const general = require('../../models/general.model')
const product = require('../../models/customer/product.model')
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)

const index = async function () { }

index.getCountCart = async (customer_id) => {
    if (!customer_id) {
        return 0;
    }

    let getCountCart = `SELECT * FROM view_count_cart WHERE customer_id = ${customer_id}`;

    return new Promise((resolve, reject) => {
        db.query(getCountCart, (err, countCart) => {
            if (err) {
                console.log(err);
                return resolve(0);
            }

            if (!countCart || countCart.length === 0) {
                return resolve(0);
            }

            return resolve(countCart[0].count_cart || 0);
        });
    });
};

index.getShortCart = async (customer_id) => {
    if (!customer_id) {
        return [];
    }

    let getShortCart = `SELECT * FROM view_cart WHERE customer_id = ${customer_id}`;
    let shortCart = await query(getShortCart)

    return shortCart || [];
};

index.checkCart = async (customer_id, product_variant_id) => {
    if (!customer_id || !product_variant_id) {
        return 0;
    }

    let checkCart = `SELECT * FROM view_cart WHERE customer_id = ${customer_id} AND product_variant_id = ${product_variant_id}`;
    let isExistInCart = await query(checkCart)

    if (isExistInCart[0]) {
        return 1;
    } else {
        return 0;
    }
};

index.getNoti = async (user_id) => {
    if (!user_id) {
        return [];
    }

    let getNoti = `SELECT * FROM view_notifications WHERE user_id = ${user_id}`;
    let noti = await query(getNoti)

    return noti || [];
}

index.header_user = async (req) => {
    if (req.user) {
        let user = req.user

        let shortCarts = []
        let noti = []

        if (req.user.customer_id) {
            shortCarts = await index.getShortCart(req.user.customer_id)
        }

        if (req.user.user_id) {
            noti = await index.getNoti(req.user.user_id)
        }

        let headers = {
            user,
            countCart: shortCarts ? shortCarts.length : 0,
            shortCarts: shortCarts || [],
            noti: noti || [],
        }

        return headers;
    } else {
        return 0
    }
}

index.header = async (req) => {
    let searchKey = req.query.searchKey ?? ''
    let cates = await general.getCates(req)

    let header = {
        searchKey,
        cates
    }

    return header
}

module.exports = index