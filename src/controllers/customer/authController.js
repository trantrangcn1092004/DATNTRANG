const db = require("../../config/db/connect");
const auth = require("../../models/customer/auth.model");
const jwt = require("jsonwebtoken");

const index = require("../../models/customer/index.model");

const authController = () => {};

// [GET] /auth/register
authController.register = async (req, res) => {
  res.render("./pages/auth/register");
};

// [POST] /auth/register
authController.submitRegister = async (req, res) => {
  auth.registerPost(req, function (error, dupPhoneNumber, success) {

    if (error) {
      console.log(error);
      return res.status(500).render("./pages/site/404-error");
    }

    if (dupPhoneNumber) {
      return res.json({
        status: "error",
        error: "Số điện thoại đã được sử dụng",
      });
    }

    if (success) {
      return res.json({
        status: "success",
        success: "Đăng ký thành công",
      });
    }
  });
};

// [GET] /auth/login
authController.login = async (req, res) => {
  res.render("./pages/auth/login");
};

// [POST] /auth/login
authController.submitLogin = async (req, res) => {

  await auth.loginPost(
    req,
    function (err, nonePhoneNumber, NotMatchPassword, success, id) {

      if (err) {
        console.log(err);
        return res.status(500).json({
          status: "error",
          error: "Lỗi server",
        });
      }

      // Không tồn tại số điện thoại
      if (nonePhoneNumber) {
        return res.json({
          status: "error",
          error: "Số điện thoại không tồn tại.",
        });
      }

      // Sai mật khẩu
      if (NotMatchPassword) {
        return res.json({
          status: "error2",
          error: "Mật khẩu không chính xác.",
        });
      }

      // Đăng nhập thành công
      if (success) {

        const token = jwt.sign(
          {
            id: id,
          },
          process.env.JWT_SECRET,
          {
            expiresIn: process.env.JWT_EXPIRES,
          }
        );

        const cookieOptions = {
          expires: new Date(
            Date.now() +
            process.env.JWT_COOKIE_EXPIRES *
            24 *
            60 *
            60 *
            1000
          ),
          httpOnly: true,
        };

        // lưu cookie
        res.cookie("userSave", token, cookieOptions);

        return res.json({
          status: "success",
          success: "Bạn đã đăng nhập thành công",
        });
      }
    }
  );
};

// [GET] /auth/logout
authController.logout = async (req, res) => {

  res.cookie("userSave", "logout", {
    expires: new Date(Date.now() + 2000),
    httpOnly: true,
  });

  return res.redirect("/");
};

// [GET] /auth/forgot
authController.forgotPassword = async (req, res) => {

  let header_user = await index.header_user(req);
  let header = await index.header(req);

  const title = "Quên mật khẩu";

  res.render("./pages/auth/forgot", {
    header: header,
    user: header_user,
    title,
  });
};

// [POST] /auth/findUser
authController.findUser = async (req, res) => {

  auth.findNumberPhone(req, function (err, notFound, success, user_id) {

    if (err) {
      return res.json({
        status: "error",
        error: "Lỗi truy cập.",
      });
    }

    if (notFound) {
      return res.json({
        status: "notFound",
        error: "Số điện thoại không tồn tại.",
      });
    }

    if (success) {
      return res.json({
        status: "success",
        user_id: user_id,
      });
    }
  });
};

// [POST] /auth/forgot
authController.forgotPasswordPost = async (req, res) => {

  auth.findNumberPhone(req, function (err, notFound, success, user_id) {

    if (err) {
      return res.json({
        status: "error",
        error: "Lỗi truy cập.",
      });
    }

    if (notFound) {
      return res.json({
        status: "notFound",
        error: "Số điện thoại không tồn tại.",
      });
    }

    if (success) {
      return res.json({
        status: "success",
        user_id: user_id,
      });
    }
  });
};

// [POST] /auth/reset
authController.resetPassword = async (req, res) => {

  const user_new_password = req.body.user_password;
  const user_phone = req.body.user_phone;

  await auth.resetPassword(
    user_phone,
    user_new_password,
    function (err, results) {

      if (err) {
        console.log(err);

        return res.status(500).json({
          status: "error",
        });
      }

      return res.status(200).json({
        status: "success",
      });
    }
  );
};

// [POST] /auth/changePass
authController.changePassPost = async (req, res) => {

  const user_phone = req.user.user_phone;
  const user_old_password = req.body.user_old_password;
  const user_new_password = req.body.user_new_password;

  auth.checkPhone(user_phone, async (err, result) => {

    if (err) {
      console.log(err);
      return res.status(500).redirect("/error");
    }

    const user_password = result[0]?.user_password;

    await auth.checkOldPassword(
      user_old_password,
      user_password,

      async (notMatchPassword, matchPassword) => {

        if (notMatchPassword) {

          return res.status(400).json({
            status: "notMatchOldPassword",
            message: "Mật khẩu cũ không chính xác!",
          });
        }

        if (matchPassword) {

          auth.resetPassword(
            user_phone,
            user_new_password,

            function (err, results) {

              if (err) {
                console.log(err);
                return res.status(500).redirect("/error");
              }

              return res.status(200).json({
                status: "success",
              });
            }
          );
        }
      }
    );
  });
};

module.exports = authController;