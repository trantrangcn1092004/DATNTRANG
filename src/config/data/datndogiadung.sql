-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 03, 2026 lúc 08:51 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `datndogiadung`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_login_name` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_full_name` varchar(100) NOT NULL,
  `admin_avt_img` varchar(100) DEFAULT NULL,
  `admin_birth` date NOT NULL,
  `admin_sex` tinyint(1) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_phone` varchar(10) NOT NULL,
  `admin_address` text DEFAULT NULL,
  `admin_role` varchar(100) DEFAULT 'Owner',
  `admin_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_login_name`, `admin_password`, `admin_name`, `admin_full_name`, `admin_avt_img`, `admin_birth`, `admin_sex`, `admin_email`, `admin_phone`, `admin_address`, `admin_role`, `admin_active`) VALUES
(1, '12345678', '$2a$08$GbZ6Nt1JVelmRGPA3eBkPO4B851FT7sPdCU9DtFLbuOKJ5YZj5Axu', 'Toản Hiền', 'Đồ gia dụng Toản Hiền', 'admin_2.png', '2004-09-01', 1, 'dtc225201321@ictu.edu.vn', '0986060280', '130 CMT8 Tỉnh Thái Nguyên', 'Chủ cửa hàng\r\n', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `customer_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `cart_quantity` int(11) NOT NULL,
  `cart_added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`customer_id`, `product_variant_id`, `cart_quantity`, `cart_added_date`) VALUES
(6, 4, 2, '2026-04-13 19:45:13'),
(10, 11, 5, '2026-04-27 19:45:13'),
(10, 28, 1, '2026-04-21 19:45:13'),
(13, 34, 1, '2026-04-28 14:16:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_img` varchar(100) NOT NULL,
  `categorry_type` varchar(50) NOT NULL DEFAULT 'Bếp ga',
  `category_added_date` date NOT NULL DEFAULT current_timestamp(),
  `category_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_img`, `categorry_type`, `category_added_date`, `category_is_display`) VALUES
(1, 'Bếp ga đôi', 'bep_ga_doi.png', 'Bếp ga', '2026-04-19', 1),
(2, 'Bếp ga đơn', 'bep_ga_don.png', 'Bếp ga', '2026-04-19', 1),
(3, 'Bếp từ đôi', 'bep_tu_doi.jpg', 'Bếp từ', '2026-04-19', 1),
(4, 'Bếp từ đơn', 'bep_tu_don.png', 'Bếp từ', '2026-04-19', 1),
(5, 'Bếp hồng ngoại', 'bep_hong_ngoai.png', 'Bếp từ', '2026-04-19', 1),
(7, 'Bếp ga du lịch/mini', 'bep_ga_dulich.png', 'Bếp ga', '2026-04-19', 1),
(8, 'Nồi cơm', 'noi_com.png', 'Đồ dùng nhà bếp', '2026-04-19', 1),
(9, 'Nồi chiên', 'noi_chien.png', 'Đồ dùng nhà bếp', '2026-04-19', 1),
(11, 'Máy sấy', 'maysay.png', 'Gia dụng', '2026-05-07', 1),
(12, 'Máy lọc nước', 'may_loc_nuoc.png', 'Gia dụng', '2026-04-19', 1),
(13, 'Quạt điều hòa', 'quat_dieu_hoa.png', 'Gia dụng', '2026-04-19', 1),
(14, 'Quạt', 'quat.png', 'Gia dụng', '2026-04-19', 1),
(15, 'Bếp ga công nghiệp', 'bep_ga_congnghiep.png', 'Bếp ga', '2026-04-19', 1),
(17, 'Máy lọc không khí', 'may_loc_khong_khi.png', 'Gia dụng', '2026-04-19', 1),
(21, 'Bình đun siêu tốc', 'binh_dun_sieu_toc.png', 'Đồ dùng nhà bếp', '2026-04-19', 1),
(22, 'Máy xay sinh tố', 'may_xay_sinh_to.png', 'Đồ dùng nhà bếp', '2026-04-19', 1),
(23, 'Máy ép trái cây', 'may_ep_trai_cay.png', 'Đồ dùng nhà bếp', '2026-04-19', 1),
(24, 'Bàn là', 'banla.png', 'Gia dụng', '2026-05-07', 1),
(25, 'Máy vắt cam', 'may_vat_cam.png', 'Đồ dùng nhà bếp', '2026-06-03', 1),
(26, 'Máy xay thịt', 'may_xay_thit.png', 'Đồ dùng nhà bếp', '2026-06-03', 1),
(27, 'Lò nướng', 'lo_nuong.png', 'Đồ dùng nhà bếp', '2026-06-03', 1),
(28, 'Lò vi sóng', 'lo_vi_song.png', 'Đồ dùng nhà bếp', '2026-06-03', 1),
(29, 'Bộ nồi', 'bo_noi.png', 'Đồ dùng nhà bếp', '2026-06-03', 1),
(30, 'Chảo', 'chao.png', 'Đồ dùng nhà bếp', '2026-06-03', 1),
(31, 'Xoong', 'xoong.jpg', 'Đồ dùng nhà bếp', '2026-06-03', 1),
(32, 'Sưởi', 'suoi.png', 'Gia dụng', '2026-06-03', 1),
(33, 'Ấm sắc thuốc', 'am_sac_thuoc.png', 'Gia dụng', '2026-06-03', 1),
(34, 'Bình giữ nhiệt', 'binh_giu_nhiet.png', 'Gia dụng', '2026-06-03', 1),
(35, 'Bình thuỷ điện', 'binh_thuy_dien.png', 'Gia dụng', '2026-06-03', 1),
(36, 'Máy hút bụi', 'hut_bui.png', 'Gia dụng', '2026-06-03', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(17, 11),
(18, 12),
(19, 13),
(20, 14),
(21, 15),
(11, 31),
(12, 32),
(13, 33),
(14, 34),
(15, 35),
(16, 36),
(22, 37),
(23, 38),
(24, 39),
(25, 40),
(26, 41),
(27, 42),
(28, 43),
(29, 44),
(30, 45),
(31, 46),
(32, 47),
(33, 48),
(34, 49),
(35, 50),
(36, 51),
(37, 52),
(38, 53),
(39, 54),
(40, 55),
(41, 56),
(42, 57),
(43, 58),
(44, 59),
(45, 60),
(46, 61),
(47, 62),
(48, 63),
(49, 64),
(50, 65),
(51, 66),
(52, 67),
(53, 68),
(54, 69),
(55, 70),
(56, 71),
(57, 72),
(58, 73),
(59, 74),
(60, 75),
(61, 76),
(62, 77),
(63, 78),
(64, 79),
(65, 80),
(66, 81),
(67, 82),
(68, 83),
(69, 84),
(70, 85),
(71, 86),
(72, 87),
(73, 88),
(74, 89),
(75, 90),
(76, 91),
(77, 92),
(78, 93),
(79, 94),
(80, 95),
(81, 96),
(82, 97),
(83, 98),
(84, 99),
(85, 100),
(86, 101),
(87, 102),
(88, 103),
(89, 104),
(90, 105),
(91, 106),
(92, 107),
(93, 108),
(94, 109),
(95, 110),
(96, 111),
(97, 112),
(98, 113),
(99, 114),
(100, 115);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL,
  `discount_name` varchar(100) NOT NULL,
  `discount_description` text DEFAULT NULL,
  `discount_start_date` date NOT NULL DEFAULT current_timestamp(),
  `discount_end_date` date NOT NULL DEFAULT current_timestamp(),
  `discount_amount` float NOT NULL,
  `discount_is_display` tinyint(1) NOT NULL DEFAULT 1,
  `discount_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`discount_id`, `discount_name`, `discount_description`, `discount_start_date`, `discount_end_date`, `discount_amount`, `discount_is_display`, `discount_img`) VALUES
(1, 'Black Friday', 'Chương trình giảm giá Black Friday', '2026-03-31', '2026-05-30', 10, 1, ''),
(2, 'Vui Tết', 'Chương trình giảm giá dịp Tết', '2027-01-01', '2027-03-31', 15, 1, ''),
(3, 'Vui Trung Thu', 'Chương trình giảm giá dịp Trung Thu', '2026-09-25', '2026-09-30', 20, 1, ''),
(4, 'Back to school', 'Chương trình giảm giá cho học sinh, sinh viên back to school', '2026-11-01', '2026-11-30', 10, 1, ''),
(5, 'Ngày lễ 30/4, 1/5 này chẳng cần đi đâu, ở nhà lướt … săn hàng xịn giá siêu mịn cũng đủ để bạn vui vẻ', 'Thông báo khẩn cấp: … SALE up to 70% cho tất cả các sản phẩm trong 3 ngày lễ 30/4 và 1/5 (30/4 - 2/5)', '2026-04-30', '2026-05-02', 20, 1, ''),
(6, '05/05', 'Chương trình giảm giá ngày đôi 05/05', '2026-05-05', '2026-05-06', 15, 1, ''),
(7, '06/06', 'Chương trình giảm giá ngày đôi 06/06', '2026-06-01', '2026-06-07', 15, 1, ''),
(8, '09/09', 'Chương trình giảm giá ngày đôi 09/09', '2026-09-01', '2026-09-30', 10, 1, ''),
(9, '10/10', 'Chương trình giảm giá ngày đôi 10/10', '2026-10-01', '2026-12-31', 12, 1, ''),
(10, '11/11', 'Chương trình giảm giá ngày đôi 11/11', '2026-11-01', '2026-12-31', 10, 1, ''),
(11, '12/12', 'Chương trình giảm giá ngày đôi 12/12', '2026-11-30', '2026-12-13', 12, 1, ''),
(12, '1/1', 'Chương trình giảm giá ngày đôi 1/1', '2027-12-27', '2027-01-02', 10, 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feedback_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `feedback_date` date NOT NULL DEFAULT current_timestamp(),
  `feedback_rate` int(11) NOT NULL DEFAULT 5,
  `feedback_content` text DEFAULT 'Bạn chưa để lại lời nhận xét nào',
  `feedback_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `feedbacks`
--

INSERT INTO `feedbacks` (`feedback_id`, `product_variant_id`, `customer_id`, `order_id`, `feedback_date`, `feedback_rate`, `feedback_content`, `feedback_is_display`) VALUES
(1, 1, 1, 1, '2026-05-15', 5, 'Sản phẩm rất tốt, chất lượng cao.', 1),
(5, 4, 5, 5, '2026-05-15', 5, 'Sản phẩm quá tuyệt vời, không có chỗ nào để chê, shop xứng đáng 10 điểm không có nhưng', 1),
(6, 5, 6, 6, '2026-05-19', 4, 'Sản phẩm nhìn chung là tốt tuy nhiên chưa đáp ứng hoàn tòa yêu cầu của tôi', 1),
(7, 4, 7, 7, '2026-05-14', 5, 'Sản phẩm rất tốt, đáng để mua', 1),
(8, 9, 8, 8, '2023-11-21', 5, 'Máy giặt êm, nhanh, giao hàng sớm hơn dự kiến, nhân viên lắp đặt thân thiện, nhiệt tình', 1),
(10, 24, 8, 10, '2026-04-22', 5, 'Sản phẩm tốt vượt ngoài mong đợi', 1),
(14, 22, 10, 14, '2026-04-22', 5, 'Máy tính bảng bao đẹp, giao hành nhanh quá trời, lại còn được khuyến mãi, shop 10 điểm', 1),
(500, 2, 5, 8, '2026-05-12', 4, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(503, 36, 4, 12, '2026-03-25', 4, 'Một trải nghiệm tích cực	 nhưng có điểm nhỏ cần lưu ý.', 1),
(505, 5, 8, 11, '2026-05-15', 4, 'Sản phẩm đáng giá đồng tiền bát gạo!', 1),
(516, 29, 3, 11, '2026-04-22', 5, 'Một trải nghiệm mua sắm trực tuyến tuyệt vời!', 1),
(517, 43, 6, 7, '2026-04-30', 5, 'Sản phẩm đáng giá đồng tiền	 tôi rất hài lòng.', 1),
(520, 8, 4, 2, '2026-05-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(521, 34, 9, 1, '2026-03-25', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(526, 41, 1, 7, '2026-03-25', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(530, 22, 4, 5, '2026-04-22', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(531, 48, 9, 2, '2026-04-30', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(540, 27, 9, 5, '2026-04-22', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(541, 5, 3, 2, '2026-05-10', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(542, 18, 6, 8, '2026-04-22', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(544, 41, 2, 4, '2023-12-04', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(545, 27, 7, 12, '2026-04-22', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(546, 8, 5, 6, '2026-05-15', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(547, 32, 3, 11, '2026-03-25', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(557, 29, 3, 11, '2023-12-04', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(558, 43, 6, 7, '2026-04-30', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(561, 8, 4, 2, '2026-05-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(562, 34, 9, 1, '2026-03-25', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(567, 41, 1, 7, '2026-04-30', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(571, 22, 4, 5, '2026-04-22', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(572, 48, 9, 2, '2026-04-30', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(581, 27, 9, 5, '2026-04-22', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(582, 5, 3, 2, '2026-05-05', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(583, 18, 6, 8, '2026-04-22', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(585, 41, 2, 4, '2026-04-30', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(586, 27, 7, 12, '2026-04-22', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(587, 8, 5, 6, '2026-05-15', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(588, 32, 3, 11, '2026-03-25', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(597, 29, 3, 11, '2026-03-25', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(598, 43, 6, 7, '2026-04-30', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(601, 8, 4, 2, '2026-05-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(602, 34, 9, 1, '2026-03-25', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(607, 41, 1, 7, '2026-04-30', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(611, 22, 4, 5, '2026-04-22', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(612, 48, 9, 2, '2026-04-30', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(620, 1, 5, 8, '2026-05-11', 4, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(622, 34, 9, 10, '2026-03-25', 5, 'Quá trình mua hàng diễn ra suôn sẻ và sản phẩm chất lượng cao.', 1),
(623, 33, 4, 12, '2026-03-25', 4, 'Một trải nghiệm tích cực	 nhưng có điểm nhỏ cần lưu ý.', 1),
(625, 51, 8, 11, '2026-04-30', 4, 'Sản phẩm đáng giá đồng tiền bát gạo!', 1),
(626, 34, 3, 7, '2026-03-25', 5, 'Hài lòng với chất lượng và giá trị sản phẩm.', 1),
(628, 22, 10, 13, '2026-04-22', 4, 'Đó là một lựa chọn tốt	 tôi sẽ mua lại!', 1),
(629, 18, 7, 5, '2026-04-22', 4, 'Chất lượng đáng kinh ngạc	 tôi sẽ giới thiệu cho bạn bè!', 1),
(630, 25, 2, 4, '2026-04-22', 4, 'Nhận được đúng những gì tôi mong đợi	 không có bất kỳ vấn đề gì.', 1),
(633, 48, 1, 10, '2026-04-30', 4, 'Hỗ trợ khách hàng rất chuyên nghiệp và hữu ích.', 1),
(637, 43, 6, 7, '2026-04-30', 5, 'Sản phẩm đáng giá đồng tiền	 tôi rất hài lòng.', 1),
(639, 44, 1, 5, '2026-04-30', 4, 'Sản phẩm chất lượng	 đúng như mô tả.', 1),
(640, 28, 4, 2, '2026-04-22', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(641, 24, 9, 1, '2026-04-22', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(645, 26, 6, 11, '2026-04-22', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(649, 26, 10, 6, '2026-04-22', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(650, 32, 4, 5, '2026-03-25', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(651, 48, 9, 2, '2026-04-30', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(652, 43, 2, 12, '2026-04-30', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(658, 43, 1, 7, '2026-04-30', 4, 'Sản phẩm tốt	 nhưng có thể cải thiện một chút.', 1),
(659, 33, 4, 11, '2026-03-25', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(661, 3, 3, 2, '2026-05-15', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(662, 28, 6, 8, '2026-04-22', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(663, 33, 9, 10, '2026-03-25', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(667, 33, 3, 11, '2026-03-25', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(670, 34, 8, 7, '2026-03-25', 4, 'Sản phẩm đúng như mô tả.', 1),
(672, 29, 4, 8, '2026-03-25', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(675, 44, 5, 6, '2026-04-30', 5, 'Không có gì để phàn nàn	 sản phẩm tốt.', 1),
(676, 46, 7, 13, '2026-04-30', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(677, 32, 3, 11, '2026-03-25', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(683, 51, 2, 10, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện thêm', 1),
(685, 1, 3, 8, '2026-05-10', 5, 'Đúng như mong đợi	 tuyệt vời!', 1),
(688, 4, 5, 13, '2026-05-15', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(690, 6, 10, 6, '2026-05-15', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(691, 7, 4, 5, '2026-05-15', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(692, 8, 9, 2, '2026-05-15', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(693, 4, 2, 12, '2026-05-17', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(695, 32, 1, 4, '2026-03-25', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(703, 20, 6, 8, '2026-04-22', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(717, 29, 3, 11, '2026-03-25', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(718, 43, 6, 7, '2026-04-30', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(721, 8, 4, 2, '2026-05-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(722, 34, 9, 1, '2026-03-25', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(727, 41, 1, 7, '2026-04-30', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(731, 22, 4, 5, '2026-04-22', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(732, 48, 9, 2, '2026-04-30', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(740, 33, 1, 4, '2026-03-25', 5, 'Nhung nguyễn test', 1),
(741, 6, 1, 1, '2026-05-15', 2, 'Sản phẩm rất tốt bán hàng rất có tâm\r\n', 1),
(757, 17, 1, 42, '2026-04-22', 4, 'Sản phẩm tốt quá nè', 1),
(758, 18, 1, 42, '2026-04-22', 2, 'Bạn không để lại lời nhận xét nào', 1),
(759, 44, 1, 42, '2026-04-30', 4, 'Bạn không để lại lời nhận xét nào', 1),
(761, 59, 2, 2, '2026-05-20', 3, 'Bếp từ bình thường. Dùng được', 1);

--
-- Bẫy `feedbacks`
--
DELIMITER $$
CREATE TRIGGER `trg_feedbacks_after_delete` AFTER DELETE ON `feedbacks` FOR EACH ROW BEGIN
    DECLARE v_product_id INT;

    SELECT pv.product_id
    INTO v_product_id
    FROM product_variants pv
    WHERE pv.product_variant_id = OLD.product_variant_id;

    UPDATE products p
    SET p.product_rate = IFNULL((
        SELECT ROUND(AVG(f.feedback_rate), 1)
        FROM feedbacks f
        JOIN product_variants pv 
            ON f.product_variant_id = pv.product_variant_id
        WHERE pv.product_id = v_product_id
    ), 0)
    WHERE p.product_id = v_product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_feedbacks_after_insert` AFTER INSERT ON `feedbacks` FOR EACH ROW BEGIN
    DECLARE v_product_id INT;

    SELECT pv.product_id
    INTO v_product_id
    FROM product_variants pv
    WHERE pv.product_variant_id = NEW.product_variant_id;

    UPDATE products p
    SET p.product_rate = (
        SELECT ROUND(AVG(f.feedback_rate), 1)
        FROM feedbacks f
        JOIN product_variants pv 
            ON f.product_variant_id = pv.product_variant_id
        WHERE pv.product_id = v_product_id
    )
    WHERE p.product_id = v_product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_feedbacks_after_update` AFTER UPDATE ON `feedbacks` FOR EACH ROW BEGIN
    DECLARE v_product_id INT;

    SELECT pv.product_id
    INTO v_product_id
    FROM product_variants pv
    WHERE pv.product_variant_id = NEW.product_variant_id;

    UPDATE products p
    SET p.product_rate = (
        SELECT ROUND(AVG(f.feedback_rate), 1)
        FROM feedbacks f
        JOIN product_variants pv 
            ON f.product_variant_id = pv.product_variant_id
        WHERE pv.product_id = v_product_id
    )
    WHERE p.product_id = v_product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback_imgs`
--

CREATE TABLE `feedback_imgs` (
  `feedback_img_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `feedback_img_name` varchar(100) NOT NULL,
  `feedback_img_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `notification_title` varchar(100) NOT NULL,
  `notification_subtitle` text DEFAULT NULL,
  `notification_content` text NOT NULL,
  `notification_date` date NOT NULL DEFAULT current_timestamp(),
  `notification_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`notification_id`, `notification_type_id`, `notification_title`, `notification_subtitle`, `notification_content`, `notification_date`, `notification_is_display`) VALUES
(1, 1, 'Đơn hàng mới', 'Bạn có một đơn hàng mới đang chờ xử lý.', 'Đơn hàng mới đã được đặt thành công. Vui lòng kiểm tra và xử lý đơn hàng.', '2026-02-01', 1),
(2, 2, 'Đơn hàng đã được vận chuyển', 'Đơn hàng của bạn đã được vận chuyển và đang trên đường đến tay bạn.', 'Đơn hàng đã được vận chuyển thành công. Bạn có thể theo dõi trạng thái đơn hàng tại đây.', '2026-02-01', 1),
(3, 3, 'Đơn hàng đã được giao', 'Đơn hàng của bạn đã được giao đến địa chỉ của bạn.', 'Đơn hàng đã được giao thành công. Vui lòng kiểm tra và xác nhận đơn hàng.', '2026-02-01', 1),
(4, 4, 'Thanh toán đã được nhận', 'Thanh toán của bạn cho đơn hàng đã được nhận.', 'Thanh toán đã được nhận thành công. Vui lòng kiểm tra email của bạn để biết thêm chi tiết.', '2026-02-01', 1),
(5, 5, 'Phản hồi đã được nhận', 'Bạn đã nhận được phản hồi từ khách hàng.', 'Khách hàng đã phản hồi về sản phẩm của bạn. Vui lòng kiểm tra và xử lý phản hồi này.', '2026-02-01', 1),
(6, 6, 'Giảm giá 50% cho tất cả sản phẩm', 'Cơ hội mua sắm tuyệt vời!', 'Từ ngày 03/03/2026 đến ngày 01/06/2026, chúng tôi giảm giá 50% cho tất cả sản phẩm. Đây là cơ hội tuyệt vời để bạn mua sắm với giá ưu đãi.', '2026-02-01', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification_types`
--

CREATE TABLE `notification_types` (
  `notification_type_id` int(11) NOT NULL,
  `notification_type_name` varchar(100) NOT NULL,
  `notification_type_img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `notification_types`
--

INSERT INTO `notification_types` (`notification_type_id`, `notification_type_name`, `notification_type_img`) VALUES
(1, 'Order placed', 'order_placed.jpg'),
(2, 'Order shipped', 'order_shipped.jpg'),
(3, 'Order delivered', 'order_delivered.jpg'),
(4, 'Payment received', 'payment_received.jpg'),
(5, 'Feedback received', 'feedback_received.jpg'),
(6, 'Sale', 'sale.jpg'),
(7, 'Lucky Customer', 'lucky_customer.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL DEFAULT 1,
  `order_name` varchar(100) NOT NULL,
  `order_phone` varchar(10) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `order_delivery_date` date NOT NULL,
  `order_delivery_address` varchar(100) NOT NULL,
  `order_note` text NOT NULL,
  `order_total_before` int(11) DEFAULT 0,
  `order_total_after` int(11) NOT NULL DEFAULT 0,
  `paying_method_id` int(11) NOT NULL DEFAULT 1,
  `order_paying_date` date NOT NULL,
  `order_is_paid` tinyint(1) NOT NULL,
  `order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy') DEFAULT 'Chờ thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `staff_id`, `order_name`, `order_phone`, `order_date`, `order_delivery_date`, `order_delivery_address`, `order_note`, `order_total_before`, `order_total_after`, `paying_method_id`, `order_paying_date`, `order_is_paid`, `order_status`) VALUES
(1, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-04-22', '2026-04-30', 'Quyết Thắng, Thái Nguyên', 'Kiểm hàng trước', 7088000, 7088000, 1, '2026-04-30', 1, 'Hoàn thành'),
(2, 2, 2, 'Trần Thị Bình', '0987654322', '2026-03-02', '2026-03-05', '456 Le Van Luong Street, Ward 10, District 2, Ho Chi Minh City', 'Giao vào giờ hành chính 8h đến 16h', 1780000, 1780000, 1, '2026-03-05', 1, 'Hoàn thành'),
(3, 3, 3, 'Lê Quang Yên', '0987654323', '2026-04-02', '2026-04-06', '789 Tran Hung Dao Street, Ward 6, District 1, Ho Chi Minh City', 'Đóng gói kỹ', 2200000, 2200000, 1, '2026-04-06', 1, 'Hoàn thành'),
(4, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-04-30', '2026-05-04', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Kiểm hàng trước', 46380000, 46380000, 1, '2026-05-04', 1, 'Hoàn thành'),
(5, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-05-02', '2026-05-06', '456 Le Van Luong Street, Ward 10, District 2, Ho Chi Minh City', 'Giao vào giờ hành chính 8h đến 16h', 11980000, 11980000, 1, '2026-05-06', 1, 'Hoàn thành'),
(6, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2026-04-12', '0000-00-00', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Đóng gói kỹ', 2178000, 2178000, 1, '0000-00-00', 0, 'Đã hủy'),
(7, 7, 3, 'Phan Thanh Danh', '0987654327', '2026-05-01', '0000-00-00', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', '', 15780000, 15780000, 1, '0000-00-00', 0, 'Đã hủy'),
(8, 8, 3, 'Mai Văn Tiên', '0987654328', '2026-04-19', '0000-00-00', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao sau giờ hành chính', 5180000, 5180000, 1, '0000-00-00', 0, 'Đã hủy'),
(10, 8, 3, 'Mai Văn Tiên', '0987654328', '2026-02-16', '0000-00-00', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao sau 10h sáng', 22490000, 22490000, 1, '0000-00-00', 0, 'Đã hủy'),
(11, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2026-03-06', '0000-00-00', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao sau 1h chiều', 1780000, 1780000, 1, '0000-00-00', 0, 'Đã hủy'),
(12, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2026-02-16', '0000-00-00', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao gấp', 46380000, 46380000, 1, '0000-00-00', 0, 'Đã hủy'),
(13, 2, 3, 'Trần Thị Bình', '0987654322', '2026-04-23', '2026-04-25', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Tránh rơi vỡ đơn hàng của tôi', 20000000, 20000000, 1, '2026-04-25', 1, 'Hoàn thành'),
(14, 2, 3, 'Trần Thị Bình', '0987654322', '2026-03-24', '0000-00-00', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao  hỏa tốc cho  tôi', 233190000, 233190000, 1, '0000-00-00', 1, 'Đang giao hàng'),
(39, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-03-05', '2026-03-08', 'tới nhà Nhung nguyễn Phường 4 Quận 8 Hồ Chí Minh', '', 1059000, 953100, 1, '2026-03-08', 1, 'Hoàn thành'),
(40, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-04-17', '0000-00-00', 'KTX Khu A Phường 4 Quận 4 Hồ Chí Minh', '', 3200000, 3200000, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(41, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-05-17', '0000-00-00', 'KTX khu A Phường 7 Quận 2 Vũng Tàu', '', 280000, 280000, 1, '0000-00-00', 1, 'Đang giao hàng'),
(42, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-03-17', '2026-03-24', 'Tới nhà Nhung Phường 4 Quận 4 Hồ Chí Minh', '', 5049000, 5049000, 1, '2026-03-24', 1, 'Hoàn thành'),
(43, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-03-24', '0000-00-00', 'Nhung Nguyễn Phường Tân Hưng Quận 7 Hồ Chí Minh', 'Boom hàng', 3750000, 3750000, 1, '0000-00-00', 1, 'Đang giao hàng'),
(44, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-03-10', '0000-00-00', 'Nhung mua Phường Tân Thuận Đông Quận 7 Hồ Chí Minh', 'Không mua', 860000, 860000, 2, '0000-00-00', 0, 'Đã hủy'),
(45, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-05-10', '0000-00-00', 'yến bom hàng Phường 1 Quận 8 Hồ Chí Minh', 'Đừng có gửi', 860000, 860000, 2, '0000-00-00', 0, 'Đã hủy'),
(46, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-03-24', '2026-03-29', 'Tới ngõ nhỏ Phường 16 Quận 5 Hồ Chí Minh', 'Kiểm hàng trước', 17190000, 17190000, 1, '2026-03-29', 1, 'Hoàn thành'),
(48, 1, 1, 'Hương vi', '0987654321', '2026-04-05', '2026-04-09', 'Hương vi nhà bà tám Phường 2 Quận 8 Hồ Chí Minh', '', 5590000, 5590000, 1, '2026-04-09', 1, 'Hoàn thành'),
(90, 16, 1, 'giang', '0365749221', '2026-05-16', '0000-00-00', '444 Phường Quyết Thắng Đường Z115 Thái Nguyên', '', 1200000, 1200000, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(91, 16, 1, 'giang', '0365749221', '2026-05-19', '0000-00-00', '333 Phan Đình Phùng Đường CMT8 Thái Nguyên', '', 10000000, 10000000, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(92, 16, 1, 'giang', '0365749221', '2026-05-22', '2026-05-22', '320 Hoàng Văn thụ Quận 5 Thái Nguyên', '', 23190000, 23190000, 2, '2026-05-22', 1, 'Hoàn thành'),
(93, 16, 1, 'giang', '0365749221', '2026-05-22', '0000-00-00', '8386 Phường Phan đình phùng TỔ 1 Thái Nguyên', '', 7540000, 7540000, 1, '0000-00-00', 1, 'Đang giao hàng'),
(94, 16, 1, 'giang', '0365749221', '2026-05-22', '0000-00-00', '111 Phường Phan đình phùng TỔ 1 Thái Nguyên', '', 280000, 280000, 2, '0000-00-00', 0, 'Đã hủy'),
(95, 16, 1, 'giang', '0365749221', '2026-05-22', '0000-00-00', '130 Phường Phan đình phùng TỔ 4 Thái Nguyên', '', 340000, 340000, 1, '0000-00-00', 1, 'Đang giao hàng'),
(96, 16, 1, 'giang', '0365749221', '2026-05-22', '0000-00-00', '128 Phường Phan đình phùng TỔ 4 Thái Nguyên', '', 340000, 340000, 3, '0000-00-00', 0, 'Chờ thanh toán'),
(97, 16, 1, 'giang', '0365749221', '2026-05-22', '0000-00-00', '444 Phường Phan đình phùng TỔ 4 Thái Nguyên', '', 1485000, 1485000, 1, '0000-00-00', 1, 'Đang giao hàng'),
(98, 16, 1, 'giang', '0365749221', '2026-05-22', '0000-00-00', 'Trường Đại học Công nghệ thông tin và Truyền thông  Phường Quyết Thắng Đường Z115 Thái Nguyên', '', 1290000, 1290000, 2, '0000-00-00', 0, 'Chờ thanh toán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_detail_quantity` int(11) NOT NULL,
  `order_detail_price_before` int(11) DEFAULT 0,
  `order_detail_price_after` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_variant_id`, `order_detail_quantity`, `order_detail_price_before`, `order_detail_price_after`) VALUES
(1, 6, 2, 549000, 549000),
(1, 62, 1, 5990000, 5990000),
(2, 59, 2, 890000, 890000),
(3, 14, 2, 1100000, 1100000),
(4, 33, 2, 23190000, 23190000),
(5, 62, 2, 5990000, 5990000),
(6, 67, 2, 1089000, 1089000),
(7, 12, 2, 7890000, 7890000),
(8, 72, 2, 2590000, 2590000),
(11, 59, 2, 890000, 890000),
(12, 33, 2, 23190000, 23190000),
(13, 11, 2, 10000000, 10000000),
(14, 33, 10, 23190000, 23190000),
(14, 60, 1, 1290000, 1290000),
(39, 1, 1, 1059000, 953100),
(40, 44, 1, 1650000, 1650000),
(40, 73, 1, 1550000, 1550000),
(41, 25, 1, 280000, 280000),
(42, 9, 1, 649000, 649000),
(42, 17, 1, 1550000, 1550000),
(42, 18, 1, 1200000, 1200000),
(42, 44, 1, 1650000, 1650000),
(43, 15, 3, 1250000, 1250000),
(44, 63, 1, 860000, 860000),
(45, 63, 1, 860000, 860000),
(46, 18, 1, 1200000, 1200000),
(46, 26, 1, 340000, 340000),
(46, 41, 1, 15650000, 15650000),
(48, 77, 1, 5590000, 5590000),
(90, 18, 1, 1200000, 1200000),
(91, 11, 1, 10000000, 10000000),
(92, 33, 1, 23190000, 23190000),
(93, 17, 1, 1550000, 1550000),
(93, 62, 1, 5990000, 5990000),
(94, 25, 1, 280000, 280000),
(95, 26, 1, 340000, 340000),
(96, 68, 1, 340000, 340000),
(97, 27, 1, 1485000, 1485000),
(98, 30, 1, 1290000, 1290000);

--
-- Bẫy `order_details`
--
DELIMITER $$
CREATE TRIGGER `trg_order_details_after_delete` AFTER DELETE ON `order_details` FOR EACH ROW BEGIN
    UPDATE orders
    SET
        order_total_before = (
            SELECT IFNULL(SUM(od.order_detail_price_before * od.order_detail_quantity), 0)
            FROM order_details od
            WHERE od.order_id = OLD.order_id
        ),
        order_total_after = (
            SELECT IFNULL(SUM(od.order_detail_price_after * od.order_detail_quantity), 0)
            FROM order_details od
            WHERE od.order_id = OLD.order_id
        )
    WHERE order_id = OLD.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_order_details_after_insert` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
    UPDATE orders
    SET
        order_total_before = (
            SELECT IFNULL(SUM(od.order_detail_price_before * od.order_detail_quantity), 0)
            FROM order_details od
            WHERE od.order_id = NEW.order_id
        ),
        order_total_after = (
            SELECT IFNULL(SUM(od.order_detail_price_after * od.order_detail_quantity), 0)
            FROM order_details od
            WHERE od.order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_order_details_after_update` AFTER UPDATE ON `order_details` FOR EACH ROW BEGIN
    UPDATE orders
    SET
        order_total_before = (
            SELECT IFNULL(SUM(od.order_detail_price_before * od.order_detail_quantity), 0)
            FROM order_details od
            WHERE od.order_id = NEW.order_id
        ),
        order_total_after = (
            SELECT IFNULL(SUM(od.order_detail_price_after * od.order_detail_quantity), 0)
            FROM order_details od
            WHERE od.order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_order_details_before_insert` BEFORE INSERT ON `order_details` FOR EACH ROW BEGIN
    SET NEW.order_detail_price_before = (
        SELECT pv.product_variant_price
        FROM product_variants pv
        WHERE pv.product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT vpv.product_variant_price * (1 - IFNULL(vpv.discount_amount, 0) / 100)
            FROM view_product_variants vpv
            WHERE vpv.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );

    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = NEW.order_detail_price_before;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_order_details_before_update` BEFORE UPDATE ON `order_details` FOR EACH ROW BEGIN
    SET NEW.order_detail_price_before = (
        SELECT pv.product_variant_price
        FROM product_variants pv
        WHERE pv.product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT vpv.product_variant_price * (1 - IFNULL(vpv.discount_amount, 0) / 100)
            FROM view_product_variants vpv
            WHERE vpv.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );

    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = NEW.order_detail_price_before;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paying_methods`
--

CREATE TABLE `paying_methods` (
  `paying_method_id` int(11) NOT NULL,
  `paying_method_name` varchar(100) NOT NULL,
  `paying_method_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `paying_methods`
--

INSERT INTO `paying_methods` (`paying_method_id`, `paying_method_name`, `paying_method_is_display`) VALUES
(1, 'Ví điện tử MoMo', 1),
(2, 'Thẻ ngân hàng', 1),
(3, 'Thẻ tín dụng', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_avt_img` varchar(100) NOT NULL,
  `product_rate` float NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_period` int(11) DEFAULT NULL,
  `product_view_count` int(11) DEFAULT NULL,
  `product_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(1, 1, 'Bếp Gas Đôi Dương Kính SUNHOUSE MMB3568 - Kiềng Tráng Men, Đầu Đốt Đồng, Tiết Kiệm Gas\r\n', 24, 'bep_ga_sunhouse.jpg', 4.7, '<p><strong><em>Bếp Gas Đôi Dương Kính SUNHOUSE MMB3568 là một loại bếp gas gia đình của thương hiệu Sunhouse </em></strong><strong><em>dùng để nấu ăn với 2 bếp (2 họng) đặt nổi trên mặt bàn bếp (gọi là “bếp gas dương”).</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Bếp được thiết kế với <strong>mặt kính cường lực sáng bóng</strong>, chịu nhiệt tốt, dễ dàng lau chùi sau khi sử dụng.</p>\r\n<p>- Tông màu đen sang trọng, phù hợp với nhiều không gian bếp.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Thân bếp làm từ <strong>thép sơn tĩnh điện</strong> chắc chắn, chống gỉ sét, tăng độ bền theo thời gian.</p>\r\n<p>- Thiết kế gọn gàng, đặt nổi tiện lợi, dễ di chuyển và lắp đặt.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng làm bằng <strong>thép tráng men</strong>, chịu lực tốt, giữ nồi chắc chắn khi nấu ăn.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp gồm <strong>2 họng đốt</strong>, giúp nấu nhiều món cùng lúc, tiết kiệm thời gian.</p>\r\n<p>- <strong>Đầu đốt hợp kim đồng</strong> cho ngọn lửa xanh, cháy ổn định, hạn chế đen đáy nồi.</p>\r\n<p>- Công suất bếp mạnh, giúp đun nấu nhanh chóng.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Sử dụng <strong>hệ thống đánh lửa Magneto</strong> bền bỉ, không cần dùng pin.</p>\r\n<p>- Núm vặn điều chỉnh linh hoạt, dễ dàng thay đổi độ lớn ngọn lửa.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt tối ưu giúp <strong>tiết kiệm gas hiệu quả</strong>.</p>\r\n<p>- Ngọn lửa cháy đều, tập trung, hạn chế thất thoát nhiệt.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Khung bếp chắc chắn, hạn chế trơn trượt khi nấu.</p>\r\n<p>- Hệ thống đánh lửa ổn định, giảm nguy cơ rò rỉ gas.</p>\r\n<p>- Phù hợp cho gia đình hoặc nhà trọ.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt kính phẳng.</p>\r\n<p>- <strong>Dễ sử dụng</strong> với núm vặn cơ học.</p>\r\n<p>- Thiết kế gọn nhẹ, phù hợp nhiều không gian.</p>\r\n\r\n<p><em>Tóm lại, bếp gas đôi dương kính SUNHOUSE MMB3568 sở hữu thiết kế hiện đại, mặt kính bền đẹp, đầu đốt tiết kiệm gas và dễ sử dụng. Đây là lựa chọn phù hợp cho nhu cầu nấu ăn hàng ngày.</em></p>', 36, 1000, 1),
(2, 1, 'Bếp ga đôi Electrolux ETG7287GKR', 44, 'bep-gas-electrolux.jpg', 4, '<p><strong><em>Bếp Gas dương 2 bếp Electrolux ETG726GKR là sản phẩm thuộc thương hiệu Electrolux, sở hữu thiết kế hiện đại, tiện lợi với 2 vùng nấu, phù hợp cho nhu cầu nấu ăn hàng ngày của gia đình.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Bếp được trang bị <strong>mặt kính cường lực cao cấp</strong>, chịu nhiệt tốt, hạn chế trầy xước và dễ dàng vệ sinh sau khi sử dụng.</p>\r\n<p>- Thiết kế <strong>Prima độc đáo</strong> với núm điều khiển đặt phía trên, mang phong cách như bếp gas âm hiện đại.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Thân bếp chắc chắn, độ bền cao, đảm bảo an toàn trong quá trình sử dụng lâu dài.</p>\r\n<p>- Thiết kế nhỏ gọn, phù hợp với nhiều không gian bếp khác nhau.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng bếp cứng cáp, chịu lực tốt, giúp giữ nồi ổn định khi nấu.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp gồm <strong>2 họng đốt</strong>, hỗ trợ nấu nhiều món cùng lúc, tiết kiệm thời gian.</p>\r\n<p>- Công suất mỗi bếp đạt <strong>3.0 kW</strong>, cho khả năng đun nấu nhanh, mạnh.</p>\r\n<p>- <strong>Nắp chia lửa bằng đồng</strong> giúp lửa cháy đều, ổn định và bền bỉ theo thời gian.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Núm vặn điều khiển đặt phía trên giúp thao tác dễ dàng, thuận tiện khi sử dụng.</p>\r\n<p>- Điều chỉnh linh hoạt mức lửa từ nhỏ đến lớn theo nhu cầu nấu ăn.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt tối ưu giúp <strong>tiết kiệm gas hiệu quả</strong>.</p>\r\n<p>- Ngọn lửa xanh, tập trung giúp giảm thất thoát nhiệt.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Mặt kính chịu lực, chịu nhiệt tốt, hạn chế nứt vỡ.</p>\r\n<p>- Kết cấu bếp chắc chắn, đảm bảo an toàn khi nấu nướng.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> với mặt kính phẳng, ít bám bẩn.</p>\r\n<p>- Thiết kế hiện đại, tăng tính thẩm mỹ cho không gian bếp.</p>\r\n<p>- Phù hợp cho gia đình, nhà trọ hoặc không gian bếp nhỏ.</p>\r\n\r\n<h3>Giá bán & ưu đãi</h3>\r\n<p>- Giá hiện tại: <strong>890.000 ₫</strong> <del>1.490.000 ₫</del> (tiết kiệm 40%).</p>\r\n<p>- Miễn phí vận chuyển trong phạm vi 10km với đơn hàng từ 500.000đ.</p>\r\n<p>- Bảo hành chính hãng <strong>24 tháng</strong>.</p>\r\n<p>- Hỗ trợ đổi lỗi kỹ thuật theo chính sách.</p>\r\n\r\n<p><em>Tóm lại, bếp gas Electrolux ETG726GKR là lựa chọn đáng cân nhắc với thiết kế đẹp, mặt kính bền, công suất mạnh và khả năng tiết kiệm gas tốt. Sản phẩm phù hợp với người dùng đang tìm kiếm một chiếc bếp gas tiện lợi, hiện đại với mức giá hợp lý.</em></p>', 36, 1200, 1),
(3, 1, 'Bếp ga đôi âm kính Sunhouse Mama MMB6632', 24, 'P3_avt.jpg', 4, '<p><strong><em>Bếp gas đôi âm kính Sunhouse Mama MMB6632 là dòng bếp gas âm cao cấp của Sunhouse, thiết kế hiện đại với mặt kính cường lực bền đẹp, phù hợp lắp đặt âm trong không gian bếp sang trọng.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Trang bị <strong>mặt kính cường lực toàn phần</strong>, chịu nhiệt tốt, chống trầy xước và dễ dàng vệ sinh.</p>\r\n<p>- Thiết kế âm bàn bếp giúp không gian gọn gàng, tăng tính thẩm mỹ.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Khung bếp chắc chắn, độ bền cao, đảm bảo sử dụng lâu dài.</p>\r\n<p>- Phù hợp với nhiều kiểu bếp hiện đại, đặc biệt là bếp âm.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng <strong>thép tráng men độc lập</strong>, chịu lực tốt, chống trượt, giữ nồi chắc chắn khi nấu.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp gồm <strong>2 họng đốt</strong>, hỗ trợ nấu nhiều món cùng lúc.</p>\r\n<p>- <strong>Pép đồng thau</strong> cho ngọn lửa xanh, cháy ổn định, không tạo muội đen.</p>\r\n<p>- Họng bếp bằng <strong>thép không gỉ cao cấp</strong>, tăng độ bền và hiệu suất đun nấu.</p>\r\n\r\n<h3>Công nghệ & vận hành</h3>\r\n<p>- <strong>Hệ thống đánh lửa IC</strong> tạo tia lửa nhanh, nhạy, dễ sử dụng.</p>\r\n<p>- Điều chỉnh ngọn lửa linh hoạt, phù hợp nhiều nhu cầu nấu ăn.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Đầu đốt công nghệ mới giúp <strong>tiết kiệm gas hiệu quả</strong>.</p>\r\n<p>- Ngọn lửa tập trung, hạn chế thất thoát nhiệt.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Mặt kính chịu lực, chịu nhiệt tốt, đảm bảo an toàn khi nấu.</p>\r\n<p>- Hệ thống đánh lửa ổn định, giảm rủi ro khi sử dụng.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt kính phẳng.</p>\r\n<p>- Thiết kế âm giúp tiết kiệm diện tích và tăng thẩm mỹ.</p>\r\n<p>- Phù hợp cho gia đình hiện đại, căn hộ, nhà phố.</p>\r\n\r\n<h3>Bảo hành</h3>\r\n<p>- <strong>Bảo hành chính hãng 24 tháng tại nhà</strong>, an tâm sử dụng.</p>\r\n\r\n<p><em>Tóm lại, bếp gas âm kính Sunhouse Mama MMB6632 là lựa chọn lý tưởng với thiết kế sang trọng, mặt kính bền đẹp, đầu đốt tiết kiệm gas và hệ thống đánh lửa IC hiện đại, đáp ứng tốt nhu cầu nấu ăn hàng ngày.</em></p>', 24, 950, 1),
(4, 1, 'BẾP GAS DƯƠNG MẶT INOX SUNHOUSE MAMA MMB0981', 24, 'P4_avt.jpg', 4.5, '<p><strong><em>Bếp gas dương mặt inox Sunhouse Mama MMB0981 là dòng bếp gas gia đình với thiết kế đơn giản, bền bỉ, phù hợp cho nhu cầu nấu ăn hàng ngày.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Bếp sử dụng <strong>mặt inox sáng bóng</strong>, chống gỉ sét, dễ lau chùi sau khi sử dụng.</p>\r\n<p>- Thiết kế tối giản, phù hợp với nhiều không gian bếp khác nhau.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Thân bếp chắc chắn, độ bền cao, chịu lực tốt trong quá trình sử dụng.</p>\r\n<p>- Thiết kế gọn nhẹ, dễ dàng di chuyển và lắp đặt.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng <strong>thép tráng men</strong> siêu bền, chịu lực tốt, giữ nồi ổn định khi nấu.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp gồm <strong>2 họng đốt</strong>, tiện lợi khi nấu nhiều món cùng lúc.</p>\r\n<p>- <strong>Họng bếp bằng hợp kim gang</strong> giúp truyền nhiệt tốt, đun nấu nhanh.</p>\r\n<p>- Ngọn lửa cháy ổn định, đáp ứng tốt nhu cầu nấu ăn cơ bản.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Trang bị <strong>hệ thống đánh lửa Magneto</strong> có độ bền cao, không cần sử dụng pin.</p>\r\n<p>- Núm vặn dễ thao tác, điều chỉnh linh hoạt mức lửa.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt giúp <strong>tiết kiệm gas hiệu quả</strong>.</p>\r\n<p>- Lửa cháy đều, hạn chế thất thoát nhiệt.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Kết cấu bếp chắc chắn, đảm bảo an toàn trong quá trình nấu.</p>\r\n<p>- Hệ thống đánh lửa ổn định, giảm rủi ro khi sử dụng.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> với mặt inox không bám bẩn.</p>\r\n<p>- <strong>Dễ sử dụng</strong>, phù hợp cho mọi đối tượng.</p>\r\n<p>- Giá thành hợp lý, phù hợp sinh viên, gia đình nhỏ.</p>\r\n\r\n<p><em>Tóm lại, bếp gas dương mặt inox Sunhouse Mama MMB0981 là lựa chọn phù hợp cho người dùng cần một chiếc bếp bền, dễ sử dụng, tiết kiệm chi phí và đáp ứng tốt nhu cầu nấu ăn cơ bản.</em></p>', 36, 1100, 1),
(5, 1, 'BẾP GAS ÂM KÍNH SUNHOUSE SHB62060-MT', 24, 'P5_avt.jpg', 4, '<p><strong><em>Bếp gas âm kính Sunhouse SHB62060-MT là dòng bếp gas âm hiện đại, thiết kế sang trọng với mặt kính cường lực bền đẹp, phù hợp cho không gian bếp cao cấp và tiện nghi.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Trang bị <strong>mặt kính cường lực sáng bóng</strong>, chịu nhiệt tốt, chống trầy xước và dễ dàng vệ sinh.</p>\r\n<p>- Thiết kế âm giúp không gian bếp gọn gàng, hiện đại.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Khung bếp chắc chắn, độ bền cao, phù hợp sử dụng lâu dài.</p>\r\n<p>- Thiết kế tối ưu cho lắp đặt âm bàn bếp.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng <strong>hợp kim thép phủ men chịu nhiệt</strong>, chắc chắn, giữ nồi ổn định khi nấu.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp gồm <strong>2 vùng nấu rộng rãi</strong>, phù hợp nhiều loại nồi chảo.</p>\r\n<p>- <strong>Đầu đốt công nghệ mới</strong> cho ngọn lửa xanh, cháy đều, không làm đen đáy nồi.</p>\r\n<p>- Đun nấu nhanh, đáp ứng tốt nhu cầu gia đình.</p>\r\n\r\n<h3>Công nghệ & vận hành</h3>\r\n<p>- Trang bị <strong>hệ thống đánh lửa IC</strong> cho tia lửa nhanh, nhạy và dễ sử dụng.</p>\r\n<p>- Núm vặn điều chỉnh linh hoạt mức lửa theo nhu cầu.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt tối ưu giúp <strong>tiết kiệm gas hiệu quả</strong>.</p>\r\n<p>- Ngọn lửa tập trung, giảm thất thoát nhiệt.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- <strong>Cảm ứng ngắt gas tự động</strong> khi có sự cố, đảm bảo an toàn cho người dùng.</p>\r\n<p>- Mặt kính chịu lực, chịu nhiệt tốt, hạn chế rủi ro khi sử dụng.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> với mặt kính phẳng.</p>\r\n<p>- Thiết kế âm hiện đại, tăng tính thẩm mỹ cho không gian bếp.</p>\r\n<p>- Phù hợp cho gia đình, căn hộ, nhà phố.</p>\r\n\r\n<p><em>Tóm lại, bếp gas âm kính Sunhouse SHB62060-MT là lựa chọn đáng cân nhắc với thiết kế đẹp, an toàn cao nhờ cảm biến ngắt gas, cùng khả năng đun nấu hiệu quả và tiết kiệm nhiên liệu.</em></p>\r\n', 36, 850, 1),
(6, 2, 'Bếp gas đơn Rinnai RV-150(G)\r\n', 47, 'P6_avt.jpg', 3, '<p><strong><em>Bếp gas đơn Rinnai RV-150(G) là dòng bếp gas nhỏ gọn, tiện lợi, phù hợp cho gia đình ít người, sinh viên hoặc nhu cầu nấu ăn đơn giản.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Bếp được làm từ <strong>thép phủ men cao cấp</strong>, bền đẹp, chống gỉ sét và dễ vệ sinh.</p>\r\n<p>- Thiết kế nhỏ gọn, hiện đại, phù hợp với nhiều không gian bếp.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Kết cấu chắc chắn, trọng lượng nhẹ, dễ dàng di chuyển.</p>\r\n<p>- Phù hợp sử dụng trong gia đình nhỏ, phòng trọ hoặc mang đi dã ngoại.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng bếp <strong>6 chân vững chắc</strong>, giữ nồi ổn định khi nấu.</p>\r\n<p>- Thiết kế tháo rời, thuận tiện cho việc vệ sinh.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp đơn với <strong>1 họng đốt</strong>, đáp ứng nhu cầu nấu cơ bản.</p>\r\n<p>- <strong>Đầu đốt bằng gang</strong> chịu nhiệt tốt, độ bền cao.</p>\r\n<p>- Ngọn lửa phân bố đều, tập trung dưới đáy nồi giúp nấu nhanh.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Trang bị <strong>hệ thống đánh lửa Magneto</strong> cho tia lửa nhanh, dễ sử dụng, không cần pin.</p>\r\n<p>- Núm vặn phía trước giúp điều chỉnh mức lửa linh hoạt.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt tối ưu giúp <strong>tiết kiệm gas hiệu quả</strong>.</p>\r\n<p>- Lửa cháy đều, hạn chế thất thoát nhiệt.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Kết cấu bếp chắc chắn, đảm bảo an toàn khi nấu.</p>\r\n<p>- Hệ thống đánh lửa ổn định, giảm rủi ro trong quá trình sử dụng.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ bề mặt trơn bóng.</p>\r\n<p>- <strong>Dễ di chuyển</strong>, phù hợp mang đi dã ngoại.</p>\r\n<p>- Phù hợp cho sinh viên, người ở trọ hoặc gia đình ít người.</p>\r\n\r\n<p><em>Tóm lại, bếp gas đơn Rinnai RV-150(G) là lựa chọn tiện lợi với thiết kế nhỏ gọn, dễ sử dụng, bền bỉ và tiết kiệm gas, đáp ứng tốt nhu cầu nấu ăn cơ bản hàng ngày.</em></p>', 12, 1, 1),
(7, 2, 'Bếp gas đơn Sunhouse SHB212KT\r\n', 24, 'P7_avt.jpg', 5, '<p><strong><em>Bếp gas đơn Sunhouse SHB212KT là dòng bếp gas nhỏ gọn, hiện đại, phù hợp cho người sống một mình, sinh viên hoặc gia đình ít thành viên với khả năng nấu nướng tiện lợi và tiết kiệm gas.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Trang bị <strong>mặt kính chịu lực, chịu nhiệt</strong>, chống trầy xước và dễ dàng vệ sinh.</p>\r\n<p>- Thiết kế nhỏ gọn, phù hợp với nhiều không gian bếp.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Trọng lượng nhẹ, dễ dàng di chuyển và sử dụng linh hoạt.</p>\r\n<p>- Kiểu dáng hiện đại, phù hợp cho gia đình nhỏ, phòng trọ hoặc mang đi dã ngoại.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng <strong>5 chân tráng men</strong> chắc chắn, chống trượt, đảm bảo an toàn khi nấu.</p>\r\n<p>- Thiết kế tháo rời, thuận tiện cho việc vệ sinh.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp đơn với <strong>1 họng đốt</strong>, đáp ứng nhu cầu nấu cơ bản.</p>\r\n<p>- <strong>Đầu đốt bằng đồng thau</strong> bền bỉ, chống mài mòn.</p>\r\n<p>- <strong>Họng bếp inox cao cấp</strong> cho ngọn lửa xanh, không làm đen đáy nồi.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Trang bị <strong>hệ thống đánh lửa Magneto</strong> tạo tia lửa nhanh, dễ sử dụng, không cần pin.</p>\r\n<p>- Núm xoay điều chỉnh êm tay, thao tác đơn giản, phù hợp mọi đối tượng.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt tối ưu giúp <strong>tiết kiệm gas hiệu quả</strong>.</p>\r\n<p>- Ngọn lửa cháy đều, hạn chế thất thoát nhiệt.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Kết cấu bếp chắc chắn, đảm bảo an toàn khi nấu nướng.</p>\r\n<p>- Kiềng chống trượt giúp cố định nồi chắc chắn.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt kính phẳng, ít bám bẩn.</p>\r\n<p>- <strong>Dễ di chuyển</strong>, phù hợp mang đi dã ngoại hoặc sử dụng linh hoạt.</p>\r\n<p>- Phù hợp cho sinh viên, người ở trọ hoặc gia đình nhỏ.</p>\r\n\r\n<p><em>Tóm lại, bếp gas đơn Sunhouse SHB212KT là lựa chọn tiện lợi với thiết kế nhỏ gọn, mặt kính bền đẹp, tiết kiệm gas và dễ sử dụng, đáp ứng tốt nhu cầu nấu ăn hàng ngày.</em></p>\r\n', 12, 1200, 1),
(8, 2, 'Bếp gas đơn Namilux NH-S4136APF\r\n', 45, 'P8_avt.jpg', 4, '<p><strong><em>Bếp gas đơn Namilux NH-S4136APF là dòng bếp gas nhỏ gọn, tiện lợi, phù hợp cho nhu cầu nấu ăn cơ bản với thiết kế hiện đại và dễ sử dụng.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Mặt bếp sáng bóng, hạn chế bám bẩn và <strong>dễ dàng lau chùi</strong> sau khi sử dụng.</p>\r\n<p>- Thiết kế nhỏ gọn, tiết kiệm diện tích, phù hợp nhiều không gian.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Kiểu dáng đơn giản, màu sắc trang nhã, phù hợp với gia đình nhỏ hoặc phòng trọ.</p>\r\n<p>- Dễ dàng di chuyển và bố trí linh hoạt.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng kim loại <strong>5 chân chắc chắn</strong>, giữ nồi ổn định khi nấu.</p>\r\n<p>- Thiết kế tháo rời, thuận tiện cho việc vệ sinh.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp đơn với <strong>1 họng đốt</strong>, đáp ứng nhu cầu nấu cơ bản.</p>\r\n<p>- <strong>Đầu đốt hợp kim nhôm</strong> giúp truyền nhiệt nhanh, nấu ăn hiệu quả.</p>\r\n<p>- Ngọn lửa phân bố đều, giữ trọn hương vị món ăn.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Trang bị <strong>hệ thống đánh lửa Magneto</strong> cho tia lửa nhanh, nhạy và không cần dùng pin.</p>\r\n<p>- Điều khiển bằng núm xoay đơn giản, dễ dàng điều chỉnh mức lửa.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt tối ưu giúp <strong>tiết kiệm gas</strong> khi sử dụng.</p>\r\n<p>- Hạn chế rò rỉ gas, tăng hiệu quả nấu nướng.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Kết cấu bếp chắc chắn, hoạt động ổn định.</p>\r\n<p>- Hệ thống đánh lửa an toàn, giảm rủi ro khi sử dụng.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt bếp trơn bóng và kiềng tháo rời.</p>\r\n<p>- <strong>Dễ sử dụng</strong> với núm xoay điều chỉnh linh hoạt.</p>\r\n<p>- Phù hợp cho sinh viên, người ở trọ hoặc gia đình ít người.</p>\r\n\r\n<p><em>Tóm lại, bếp gas đơn Namilux NH-S4136APF là lựa chọn tiện lợi với thiết kế nhỏ gọn, dễ sử dụng, tiết kiệm gas và phù hợp cho nhu cầu nấu ăn hàng ngày.</em></p>', 12, 950, 1),
(9, 2, 'BẾP GAS ĐƠN SUNHOUSE SHB215-EC\r\n', 24, 'P9_avt.jpg', 4.6, '<p><strong><em>Bếp gas đơn SUNHOUSE SHB215-EC là dòng bếp nhỏ gọn, tiện lợi, phù hợp cho nhu cầu nấu ăn cơ bản với thiết kế hiện đại, dễ sử dụng và tiết kiệm nhiên liệu.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Mặt kính sáng bóng, chịu lực tốt, hạn chế bám bẩn và <strong>dễ dàng lau chùi</strong> sau khi sử dụng.</p>\r\n<p>- Thiết kế hiện đại, tăng tính thẩm mỹ cho không gian bếp.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Kiểu dáng gọn gàng, phù hợp với nhiều không gian như phòng trọ, gia đình nhỏ.</p>\r\n<p>- Dễ dàng di chuyển và bố trí linh hoạt.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng tráng men <strong>5 chân chắc chắn</strong>, chống trượt hiệu quả khi nấu.</p>\r\n<p>- Thiết kế tháo rời, thuận tiện cho việc vệ sinh.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp đơn với <strong>1 họng đốt</strong>, đáp ứng nhu cầu nấu ăn hằng ngày.</p>\r\n<p>- <strong>Đầu đốt đồng thau</strong> giúp truyền nhiệt tốt, cho ngọn lửa ổn định.</p>\r\n<p>- Ngọn lửa xanh, cháy đều, không làm đen đáy nồi.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Trang bị <strong>hệ thống đánh lửa Magneto</strong> tạo tia lửa nhanh, nhạy và không cần dùng pin.</p>\r\n<p>- Điều khiển bằng núm xoay đơn giản, dễ dàng điều chỉnh mức lửa phù hợp.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt tối ưu giúp <strong>tiết kiệm gas</strong> hiệu quả.</p>\r\n<p>- Hạn chế hao phí nhiên liệu trong quá trình sử dụng.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Kết cấu bếp chắc chắn, hoạt động ổn định.</p>\r\n<p>- Ngọn lửa cháy đều, hạn chế rủi ro trong quá trình nấu.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt kính trơn và kiềng tháo rời.</p>\r\n<p>- <strong>Dễ sử dụng</strong> với núm xoay linh hoạt.</p>\r\n<p>- Phù hợp cho sinh viên, người ở trọ hoặc gia đình ít người.</p>\r\n\r\n<p><em>Tóm lại, bếp gas đơn SUNHOUSE SHB215-EC là lựa chọn tiện lợi với thiết kế nhỏ gọn, dễ sử dụng, an toàn và tiết kiệm gas, đáp ứng tốt nhu cầu nấu ăn hằng ngày.</em></p>', 12, 1100, 1),
(10, 2, 'Bếp Gas Đơn NaMilux NA-300ASM\r\n', 45, 'P10_avt.jpg', 4.3, '<p><strong><em>Bếp gas đơn NaMilux NA-300ASM là dòng bếp tiện lợi với thiết kế chắc chắn, dễ sử dụng, cho hiệu suất nấu cao và phù hợp với nhiều nhu cầu sử dụng khác nhau.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Mặt bếp inox sáng bóng, <strong>chống rỉ sét</strong> và dễ dàng lau chùi sau khi sử dụng.</p>\r\n<p>- Thiết kế liền khối, tạo sự chắc chắn và bền bỉ.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Kiểu dáng gọn gàng, vững chắc, phù hợp với nhiều không gian bếp.</p>\r\n<p>- Thiết kế ổn định, hạn chế rung lắc khi sử dụng.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng thép tráng men <strong>cứng cáp, chống rỉ</strong> và chịu nhiệt tốt.</p>\r\n<p>- Có thể tháo rời, thuận tiện cho việc vệ sinh.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp đơn với <strong>1 họng đốt</strong>, đáp ứng nhu cầu nấu ăn hằng ngày.</p>\r\n<p>- <strong>Bộ ống điếu đầu đốt</strong> giúp tạo ngọn lửa xanh, cháy đều và hiệu suất cao.</p>\r\n<p>- Truyền nhiệt tốt, giúp nấu ăn nhanh và tiết kiệm thời gian.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Trang bị <strong>hệ thống đánh lửa Magneto</strong> cho tia lửa nhanh, nhạy và bền bỉ.</p>\r\n<p>- Núm xoay điều khiển đặt phía trước, dễ dàng điều chỉnh mức lửa khi nấu.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Ngọn lửa xanh, cháy ổn định giúp <strong>tiết kiệm gas</strong> hiệu quả.</p>\r\n<p>- Hạn chế thất thoát nhiên liệu trong quá trình sử dụng.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Kết cấu bếp chắc chắn, hoạt động ổn định.</p>\r\n<p>- Chất liệu chịu nhiệt tốt, hạn chế biến dạng khi sử dụng lâu dài.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt inox và kiềng tháo rời.</p>\r\n<p>- <strong>Dễ sử dụng</strong> với núm xoay linh hoạt.</p>\r\n<p>- Phù hợp cho gia đình, sinh viên hoặc nhu cầu nấu ăn cơ bản.</p>\r\n\r\n<p><em>Tóm lại, bếp gas đơn NaMilux NA-300ASM là lựa chọn đáng tin cậy với thiết kế bền bỉ, dễ sử dụng, tiết kiệm gas và đáp ứng tốt nhu cầu nấu ăn hằng ngày.</em></p>\r\n', 12, 850, 1),
(11, 3, 'Bếp từ đôi Bosch PPI82566VN 3500W\r\n', 12, 'P11_avt.jpg', 4.2, '<p><strong><em>Bếp từ đôi Bosch PPI82566VN là dòng bếp từ hiện đại với thiết kế sang trọng, tích hợp nhiều tiện ích thông minh và tính năng an toàn, mang lại trải nghiệm nấu nướng tiện lợi và hiệu quả.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Mặt kính gốm thủy tinh <strong>Schott Ceran cao cấp</strong>, sáng bóng và chịu lực, chịu nhiệt tốt.</p>\r\n<p>- Dễ dàng vệ sinh, hạn chế bám bẩn trong quá trình sử dụng.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Thiết kế lắp âm hiện đại, tăng tính thẩm mỹ cho không gian bếp.</p>\r\n<p>- Kiểu dáng sang trọng với tông màu đen tinh tế.</p>\r\n\r\n<p><strong>Vùng nấu</strong></p>\r\n<p>- Bếp đôi với <strong>2 vùng nấu riêng biệt</strong>, tiện lợi khi chế biến nhiều món cùng lúc.</p>\r\n<p>- Tự nhận diện kích thước nồi, tối ưu hiệu quả đun nấu.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Gia nhiệt nhanh, giúp rút ngắn thời gian nấu ăn.</p>\r\n<p>- Ngọn nhiệt ổn định, phân bố đều giúp món ăn chín nhanh và giữ trọn hương vị.</p>\r\n<p>- Chức năng <strong>Booster</strong> tăng tốc gia nhiệt khi cần thiết.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Sử dụng công nghệ từ trường để làm nóng trực tiếp đáy nồi, <strong>không làm nóng mặt bếp</strong>.</p>\r\n<p>- Điều khiển bằng bảng cảm ứng trượt, dễ dàng điều chỉnh mức nhiệt linh hoạt.</p>\r\n\r\n<h3>Tiết kiệm năng lượng</h3>\r\n<p>- Gia nhiệt trực tiếp giúp <strong>tiết kiệm điện năng</strong> hiệu quả.</p>\r\n<p>- Hạn chế thất thoát nhiệt ra môi trường xung quanh.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Trang bị <strong>khóa bảng điều khiển</strong>, an toàn cho gia đình có trẻ nhỏ.</p>\r\n<p>- Tự động tắt khi không sử dụng, tránh rủi ro và tiết kiệm điện.</p>\r\n<p>- Chỉ làm nóng vùng tiếp xúc với nồi, hạn chế nguy cơ bỏng.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Hẹn giờ nấu</strong> giúp chủ động thời gian, không cần canh bếp.</p>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt kính cao cấp.</p>\r\n<p>- <strong>Dễ sử dụng</strong> với bảng điều khiển cảm ứng hiện đại.</p>\r\n\r\n<p><em>Tóm lại, bếp từ đôi Bosch PPI82566VN là lựa chọn cao cấp với thiết kế sang trọng, nấu ăn nhanh, tiết kiệm năng lượng và đảm bảo an toàn cho người sử dụng.</em></p>\r\n', 12, 1, 1),
(12, 3, 'BẾP ĐÔI ĐIỆN TỪ SUNHOUSE MAMA MMB9208DIH\r\n', 24, 'P12_avt.jpg', 4.6, '<p><strong><em>Bếp đôi điện từ Sunhouse Mama MMB9208DIH là dòng bếp hiện đại với thiết kế sang trọng, tích hợp nhiều tiện ích thông minh và khả năng nấu nướng nhanh, tiết kiệm điện năng.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Mặt kính <strong>Schott Ceran cao cấp</strong>, chịu lực và chịu nhiệt tốt, chống trầy xước hiệu quả.</p>\r\n<p>- Bề mặt sáng bóng, dễ dàng lau chùi sau khi sử dụng.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Thiết kế lắp âm hiện đại, giúp không gian bếp gọn gàng và tinh tế.</p>\r\n<p>- Kiểu dáng sang trọng với tông màu đen toàn phần.</p>\r\n\r\n<p><strong>Bảng điều khiển</strong></p>\r\n<p>- Trang bị <strong>bảng điều khiển cảm ứng riêng biệt</strong> cho từng vùng nấu.</p>\r\n<p>- Thao tác chạm và trượt nhẹ nhàng, dễ sử dụng.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp đôi với <strong>2 vùng nấu tiện lợi</strong>, cho phép chế biến nhiều món cùng lúc.</p>\r\n<p>- Gia nhiệt nhanh, giúp thực phẩm chín nhanh và tiết kiệm thời gian nấu.</p>\r\n<p>- Nhiệt lượng phân bố đều, giữ trọn hương vị món ăn.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Sử dụng công nghệ <strong>cảm ứng điện từ</strong> làm nóng trực tiếp đáy nồi.</p>\r\n<p>- Mặt bếp không nóng, an toàn và hạn chế thất thoát nhiệt.</p>\r\n\r\n<h3>Tiết kiệm năng lượng</h3>\r\n<p>- Gia nhiệt trực tiếp giúp <strong>tiết kiệm điện năng</strong> hiệu quả.</p>\r\n<p>- Giảm hao phí nhiệt ra môi trường xung quanh.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Trang bị <strong>khóa trẻ em</strong>, đảm bảo an toàn cho gia đình.</p>\r\n<p>- Tích hợp aptomat riêng biệt giúp vận hành ổn định và hạn chế rủi ro điện.</p>\r\n<p>- Mặt bếp không nóng, giảm nguy cơ bỏng khi sử dụng.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Hẹn giờ nấu</strong> tiện lợi, không cần canh bếp.</p>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt kính cao cấp.</p>\r\n<p>- <strong>Dễ sử dụng</strong> với bảng điều khiển cảm ứng hiện đại.</p>\r\n\r\n<p><em>Tóm lại, bếp đôi điện từ Sunhouse Mama MMB9208DIH là lựa chọn lý tưởng cho căn bếp hiện đại với thiết kế đẹp mắt, nấu ăn nhanh, tiết kiệm điện và đảm bảo an toàn cho người sử dụng.</em></p>\r\n\r\n', 24, 1200, 1),
(13, 4, 'Bếp từ đơn Electrolux ETD42SKS 2100W', 44, 'P13_avt.jpg', 4, '<h3>Bếp từ đơn Electrolux ETD42SKS 2100W</h3>\r\n\r\n<p><strong>Giới thiệu:</strong><br>\r\nBếp từ Electrolux ETD42SKS sở hữu thiết kế siêu mỏng hiện đại, phù hợp với nhiều không gian bếp khác nhau. Sản phẩm mang đến khả năng nấu nướng nhanh chóng, tiện lợi cùng nhiều tính năng thông minh hỗ trợ người dùng hiệu quả.\r\n</p>\r\n\r\n<h4>THIẾT KẾ: HIỆN ĐẠI – TINH TẾ</h4>\r\n\r\n<p><strong>Thiết kế siêu mỏng</strong><br>\r\nBếp có kiểu dáng nhỏ gọn, hiện đại, dễ dàng bố trí trong nhiều không gian bếp và thuận tiện khi di chuyển hoặc bảo quản.\r\n</p>\r\n\r\n<p><strong>Mặt kính Ceramic bền bỉ</strong><br>\r\nMặt bếp được làm từ kính Ceramic sáng bóng, có khả năng chịu nhiệt tốt, hạn chế nứt vỡ và dễ dàng lau chùi sau khi sử dụng.\r\n</p>\r\n\r\n<h4>CÔNG NGHỆ & CƠ CHẾ HOẠT ĐỘNG</h4>\r\n\r\n<p><strong>Đa dạng chế độ nấu</strong><br>\r\nBếp được tích hợp nhiều chế độ nấu tự động như ninh, lẩu, chiên, xào, đun nước và hấp giúp việc nấu ăn trở nên linh hoạt và tiện lợi hơn.\r\n</p>\r\n\r\n<p><strong>Bảng điều khiển cảm ứng hiện đại</strong><br>\r\nTrang bị bảng điều khiển cảm ứng nhạy bén đi kèm màn hình hiển thị rõ ràng, giúp người dùng dễ dàng thao tác và điều chỉnh mức nhiệt phù hợp.\r\n</p>\r\n\r\n<p><strong>Gia nhiệt nhanh, tiết kiệm điện</strong><br>\r\nBếp hoạt động với khả năng gia nhiệt nhanh, giúp thực phẩm chín đều trong thời gian ngắn, đồng thời tiết kiệm điện năng hiệu quả.\r\n</p>\r\n\r\n<h4>TIỆN ÍCH</h4>\r\n\r\n<p><strong>Hẹn giờ nấu tiện lợi</strong><br>\r\nChức năng hẹn giờ giúp người dùng chủ động thời gian nấu nướng, thuận tiện khi làm nhiều công việc cùng lúc mà không lo món ăn bị cháy.\r\n</p>\r\n\r\n<p><strong>Quạt tản nhiệt hiệu quả</strong><br>\r\nHệ thống quạt tản nhiệt giúp làm mát nhanh, tăng độ bền và duy trì hiệu suất hoạt động ổn định cho bếp.\r\n</p>\r\n\r\n<h4>TÍNH NĂNG AN TOÀN</h4>\r\n\r\n<p><strong>Khóa bảng điều khiển</strong><br>\r\nTính năng khóa an toàn giúp tránh trẻ nhỏ vô tình thay đổi cài đặt trong quá trình sử dụng.\r\n</p>\r\n\r\n<p><strong>Tự động ngắt khi quá nhiệt</strong><br>\r\nBếp sẽ tự ngắt khi nhiệt độ vượt mức cho phép nhằm đảm bảo an toàn và tăng tuổi thọ cho sản phẩm.\r\n</p>\r\n', 12, 1, 1),
(14, 4, 'Bếp từ đơn Toshiba IC-20S4PV 2000W', 7, 'P14_avt.jpg', 4, '<h3>Bếp từ đơn Toshiba IC-20S4PV 2000W</h3>\r\n\r\n<p><strong>Giới thiệu:</strong><br>\r\nBếp từ Toshiba IC-20S4PV sở hữu thiết kế hiện đại với gam màu đen sang trọng cùng kiểu dáng nhỏ gọn, phù hợp với nhiều không gian bếp khác nhau. Sản phẩm mang đến khả năng nấu nướng nhanh chóng, tiện lợi cùng nhiều tính năng thông minh hỗ trợ người dùng hiệu quả.\r\n</p>\r\n\r\n<h4>THIẾT KẾ: SANG TRỌNG – HIỆN ĐẠI</h4>\r\n\r\n<p><strong>Kiểu dáng nhỏ gọn</strong><br>\r\nBếp được thiết kế với 1 vùng nấu tiện lợi, thích hợp sử dụng trong không gian bếp nhỏ hoặc đặt trên bàn ăn để chế biến các món nóng nhanh chóng.\r\n</p>\r\n\r\n<p><strong>Mặt kính Ceramic cao cấp</strong><br>\r\nMặt bếp sử dụng kính Ceramic HEGON sáng bóng, có khả năng chịu lực, chịu nhiệt tốt, hạn chế trầy xước và dễ dàng lau chùi sau khi sử dụng.\r\n</p>\r\n\r\n<h4>CÔNG NGHỆ & CƠ CHẾ HOẠT ĐỘNG</h4>\r\n\r\n<p><strong>Gia nhiệt nhanh, tiết kiệm điện</strong><br>\r\nBếp hoạt động với công nghệ mâm nhiệt kép giúp truyền nhiệt nhanh, làm chín thực phẩm hiệu quả và tiết kiệm điện năng trong quá trình sử dụng.\r\n</p>\r\n\r\n<p><strong>Đa dạng chế độ nấu</strong><br>\r\nSản phẩm được tích hợp nhiều chế độ nấu tiện lợi như nấu nước, giữ ấm, chiên cùng chế độ công suất cao giúp việc nấu ăn trở nên linh hoạt hơn.\r\n</p>\r\n\r\n<p><strong>Bảng điều khiển cảm ứng hiện đại</strong><br>\r\nBếp trang bị bảng điều khiển cảm ứng nhạy bén giúp người dùng dễ dàng thao tác, điều chỉnh công suất và thời gian nấu phù hợp.\r\n</p>\r\n\r\n<h4>TIỆN ÍCH</h4>\r\n\r\n<p><strong>Chức năng hẹn giờ tiện lợi</strong><br>\r\nTính năng hẹn giờ hỗ trợ người dùng chủ động hơn trong quá trình nấu nướng mà không cần đứng canh bếp liên tục.\r\n</p>\r\n\r\n<p><strong>Công nghệ chống thấm an toàn</strong><br>\r\nBếp được trang bị công nghệ chống thấm giúp hạn chế chất lỏng tràn vào linh kiện bên trong, góp phần tăng độ bền cho sản phẩm.\r\n</p>\r\n\r\n<p><strong>Tặng kèm nồi đáy từ</strong><br>\r\nSản phẩm đi kèm nồi inox đáy từ phù hợp, giúp người dùng có thể sử dụng ngay khi mua về.\r\n</p>\r\n\r\n<h4>TÍNH NĂNG AN TOÀN</h4>\r\n\r\n<p><strong>Khóa bàn phím an toàn</strong><br>\r\nTính năng khóa bảng điều khiển giúp hạn chế trẻ nhỏ thay đổi cài đặt trong quá trình sử dụng.\r\n</p>\r\n\r\n<p><strong>Cảnh báo mặt bếp nóng</strong><br>\r\nBếp sẽ hiển thị cảnh báo khi mặt bếp còn nóng nhằm hạn chế nguy cơ bỏng khi chạm vào.\r\n</p>\r\n\r\n<p><strong>Tự ngắt khi không có nồi</strong><br>\r\nBếp tự động ngắt hoạt động khi không có nồi hoặc sử dụng nồi không phù hợp, giúp tiết kiệm điện và đảm bảo an toàn.\r\n</p>\r\n\r\n', 24, 1200, 1),
(15, 5, 'Bếp từ đơn Pramie PRMY-1109 2000W', 16, 'P15_avt.jpg', 4, '<div class=\"product-description\">\r\n    <h2>Bếp từ đơn Pramie PRMY-1109 2000W</h2>\r\n\r\n    <p>\r\n        Được nhập khẩu trực tiếp từ Malaysia và sở hữu nhiều tiện ích hiện đại, \r\n        <strong>Pramie PRMY-1109</strong> là lựa chọn phù hợp cho nhu cầu nấu nướng cá nhân \r\n        cũng như những bữa ăn sum họp gia đình.\r\n    </p>\r\n\r\n    <h3>Đặc điểm nổi bật</h3>\r\n    <ul>\r\n        <li>Đa dạng chế độ nấu cài đặt sẵn giúp nấu ăn dễ dàng hơn</li>\r\n        <li>Bảng điều khiển cảm ứng thao tác nhanh và trực quan</li>\r\n        <li>Chức năng hẹn giờ tiện lợi, kiểm soát thời gian nấu hiệu quả</li>\r\n        <li>Mặt kính Ceramic sang trọng, dễ lau chùi sau khi sử dụng</li>\r\n        <li>Tự nhận diện nồi và cảnh báo khi không có nồi</li>\r\n        <li>Khóa bảng điều khiển an toàn cho gia đình có trẻ nhỏ</li>\r\n        <li>Tự ngắt khi quá nhiệt hoặc điện áp không ổn định</li>\r\n        <li>Quạt tản nhiệt giúp bếp vận hành ổn định và bền bỉ</li>\r\n        <li>Tặng kèm nồi lẩu tiện lợi khi sử dụng</li>\r\n    </ul>\r\n\r\n    <h3>Tiện ích và cơ chế hoạt động</h3>\r\n    <p>\r\n        Bếp được trang bị nhiều chương trình nấu tự động như chiên, nướng, lẩu, \r\n        nấu nước, súp và giữ ấm, giúp người dùng dễ dàng lựa chọn chế độ phù hợp \r\n        cho từng món ăn. Chức năng hẹn giờ thông minh hỗ trợ kiểm soát thời gian nấu \r\n        linh hoạt, hạn chế cháy khét và tiết kiệm thời gian nội trợ.\r\n    </p>\r\n\r\n    <p>\r\n        Ngoài ra, bếp còn tích hợp nhiều tính năng an toàn như cảnh báo mặt bếp nóng, \r\n        tự tắt khi không sử dụng, nhận diện kích thước đáy nồi và cảnh báo nồi không phù hợp, \r\n        mang lại sự an tâm trong quá trình sử dụng.\r\n    </p>\r\n</div>', 24, 1, 1),
(16, 5, 'Bếp hồng ngoại đơn Pramie PRTH-1001 2200W', 16, 'P16_avt.jpg', 3.5, '<div class=\"product-description\">\r\n    <h2>Bếp hồng ngoại đơn Pramie PRTH-1001 2200W</h2>\r\n\r\n    <p>\r\n        Bếp hồng ngoại đơn <strong>Pramie PRTH-1001</strong> sở hữu thiết kế hiện đại, \r\n        sang trọng cùng nhiều tính năng tiện ích, phù hợp cho nhu cầu nấu nướng hằng ngày \r\n        của gia đình. Sản phẩm được sản xuất tại Thái Lan theo công nghệ Đức, \r\n        mang đến khả năng vận hành ổn định và an toàn khi sử dụng.\r\n    </p>\r\n\r\n    <h3>Đặc điểm nổi bật</h3>\r\n    <ul>\r\n        <li>Trang bị công nghệ Inverter giúp tiết kiệm điện năng hiệu quả</li>\r\n        <li>Gia nhiệt liên tục ổn định ngay cả ở mức công suất thấp</li>\r\n        <li>Mặt bếp kính Ceramic - Kanger bền đẹp, sáng bóng và dễ lau chùi</li>\r\n        <li>Bảng điều khiển cảm ứng hiện đại, thao tác đơn giản</li>\r\n        <li>Dễ dàng tùy chỉnh chế độ nấu, công suất và thời gian chỉ với vài thao tác chạm</li>\r\n        <li>Thiết kế nhỏ gọn, phù hợp với nhiều không gian bếp</li>\r\n        <li>Khóa bảng điều khiển an toàn cho gia đình có trẻ nhỏ</li>\r\n        <li>Cảnh báo mặt bếp nóng giúp hạn chế nguy cơ bỏng</li>\r\n        <li>Tự ngắt khi nước tràn đến khu vực điều khiển</li>\r\n        <li>Thương hiệu Pramie công nghệ Đức, sản xuất tại Thái Lan</li>\r\n    </ul>\r\n\r\n    <h3>Thiết kế hiện đại, sang trọng</h3>\r\n    <p>\r\n        Bếp hồng ngoại Pramie PRTH-1001 có kiểu dáng tinh tế với gam màu trang nhã, \r\n        phù hợp với nhiều phong cách không gian bếp. Mặt kính Ceramic sáng bóng \r\n        không chỉ tăng tính thẩm mỹ mà còn giúp việc vệ sinh trở nên nhanh chóng và dễ dàng hơn.\r\n    </p>\r\n\r\n    <h3>Công nghệ nấu ổn định, tiết kiệm điện</h3>\r\n    <p>\r\n        Sản phẩm được tích hợp công nghệ Inverter hiện đại giúp tối ưu điện năng tiêu thụ \r\n        và duy trì nhiệt độ ổn định trong suốt quá trình nấu. \r\n        Khả năng gia nhiệt liên tục kể cả ở mức nhiệt thấp rất phù hợp cho các món hầm, ninh hoặc giữ ấm thực phẩm.\r\n    </p>\r\n\r\n    <h3>Bảng điều khiển cảm ứng tiện lợi</h3>\r\n    <p>\r\n        Bếp sử dụng bảng điều khiển cảm ứng nhạy bén, hỗ trợ người dùng dễ dàng điều chỉnh \r\n        công suất, thời gian và các chế độ nấu chỉ bằng những thao tác chạm nhẹ.\r\n    </p>\r\n\r\n    <h3>An toàn khi sử dụng</h3>\r\n    <p>\r\n        Pramie PRTH-1001 được trang bị nhiều tính năng an toàn như khóa bảng điều khiển, \r\n        cảnh báo mặt bếp nóng và tự động ngắt khi nước tràn vào khu vực điều khiển, \r\n        giúp bảo vệ thiết bị cũng như đảm bảo an toàn cho người sử dụng.\r\n    </p>\r\n</div>', 12, 1200, 1),
(17, 22, 'Máy xay sinh tố Philips HR3030/00', 15, 'P17_avt.jpg', 4, '<div class=\"product-description\">\r\n    <h2>Máy xay sinh tố Philips HR3030/00 hiện đại, xay nhuyễn mạnh mẽ</h2>\r\n\r\n    <p>\r\n        Máy xay sinh tố Philips HR3030/00 được trang bị công nghệ ProBlend Plus \r\n        giúp xay nhuyễn hiệu quả nhiều loại nguyên liệu khác nhau như trái cây đông lạnh, \r\n        đá nhỏ, rau củ và các loại hạt, đáp ứng tốt nhu cầu chế biến thực phẩm hằng ngày.\r\n    </p>\r\n\r\n    <h3>Công nghệ ProBlend Plus xay mịn hiệu quả</h3>\r\n    <p>\r\n        Công nghệ ProBlend Plus độc quyền của Philips kết hợp giữa lưỡi dao cải tiến \r\n        và thiết kế cối đặc biệt giúp thực phẩm được đảo trộn liên tục trong quá trình xay, \r\n        mang lại độ nhuyễn mịn tối ưu cho món ăn và thức uống.\r\n    </p>\r\n\r\n    <h3>Thương hiệu uy tín từ Châu Âu</h3>\r\n    <p>\r\n        Philips là thương hiệu nổi tiếng đến từ Hà Lan với nhiều sản phẩm gia dụng chất lượng. \r\n        Máy được sản xuất theo tiêu chuẩn nghiêm ngặt, đảm bảo độ bền và sự an tâm khi sử dụng.\r\n    </p>\r\n\r\n    <h3>Thiết kế sang trọng, tiện dụng</h3>\r\n    <p>\r\n        Máy sở hữu thiết kế hiện đại với gam màu đen tinh tế, phù hợp với nhiều không gian bếp. \r\n        Cối xay bằng thủy tinh trong suốt giúp hạn chế bám mùi, dễ vệ sinh và tăng tính thẩm mỹ cho sản phẩm.\r\n    </p>\r\n\r\n    <h3>Xay đa dạng thực phẩm</h3>\r\n    <p>\r\n        Máy có thể sử dụng để xay sinh tố, rau củ, thực phẩm khô mềm, hạt, đá nhỏ \r\n        hoặc hỗ trợ sơ chế nguyên liệu nấu ăn, mang đến sự tiện lợi cho người dùng trong sinh hoạt hằng ngày.\r\n    </p>\r\n\r\n    <h3>Lưỡi dao sắc bén, vận hành mạnh mẽ</h3>\r\n    <p>\r\n        Lưỡi dao thép không gỉ được thiết kế sắc bén giúp tăng hiệu quả xay, \r\n        hạn chế gỉ sét và dễ làm sạch sau khi sử dụng. Động cơ hoạt động mạnh mẽ \r\n        giúp nguyên liệu được xay nhanh và đồng đều hơn.\r\n    </p>\r\n\r\n    <h3>Dễ dàng điều chỉnh tốc độ</h3>\r\n    <p>\r\n        Bảng điều khiển dạng nút xoay giúp người dùng dễ thao tác và linh hoạt lựa chọn tốc độ phù hợp \r\n        với từng loại nguyên liệu. Máy còn có chế độ nhồi hỗ trợ đảo trộn thực phẩm chống kẹt hiệu quả.\r\n    </p>\r\n\r\n    <h3>Nhiều tiện ích đi kèm</h3>\r\n    <p>\r\n        Máy được trang bị nắp nhỏ tiện lợi để thêm nguyên liệu trong khi xay mà không cần mở nắp chính. \r\n        Ngoài ra còn có đũa khuấy hỗ trợ trộn các hỗn hợp đặc như sinh tố đặc, cháo hay bơ hạt.\r\n    </p>\r\n\r\n    <h3>Dễ tháo rời và vệ sinh</h3>\r\n    <p>\r\n        Các bộ phận của máy có thể tháo rời giúp việc vệ sinh trở nên dễ dàng hơn. \r\n        Cối xay cũng thuận tiện cho việc làm sạch sau mỗi lần sử dụng.\r\n    </p>\r\n\r\n    <h3>Hoạt động ổn định và an toàn</h3>\r\n    <p>\r\n        Chân đế chống trượt giúp máy vận hành ổn định, hạn chế rung lắc khi xay. \r\n        Máy chỉ hoạt động khi lắp đúng khớp và có khả năng tự ngắt khi quá tải, \r\n        giúp bảo vệ động cơ cũng như đảm bảo an toàn cho người dùng.\r\n    </p>\r\n\r\n    <p>\r\n        Máy xay sinh tố Philips HR3030/00 là lựa chọn phù hợp cho gia đình cần một thiết bị xay mạnh mẽ, \r\n        tiện lợi và đa năng để chế biến sinh tố, đồ uống và nhiều món ăn khác mỗi ngày.\r\n    </p>\r\n</div>', 30, 1, 1),
(18, 11, 'Máy sấy tóc Philips BHD350/10', 15, 'P18_avt.jpg', 4.8, '<div class=\"product-description\">\r\n    <h2>Máy sấy tóc Philips BHD350/10 thiết kế hiện đại, chăm sóc tóc hiệu quả</h2>\r\n\r\n    <p>\r\n        Máy sấy tóc Philips BHD350/10 sở hữu kiểu dáng sang trọng, hiện đại cùng khả năng sấy khô nhanh, \r\n        hỗ trợ chăm sóc và tạo kiểu tóc tiện lợi ngay tại nhà.\r\n    </p>\r\n\r\n    <h3>Thiết kế gọn đẹp, dễ sử dụng</h3>\r\n    <p>\r\n        Sản phẩm được hoàn thiện từ chất liệu nhựa cao cấp, hạn chế bám bẩn và dễ dàng vệ sinh sau khi sử dụng. \r\n        Thiết kế nhỏ gọn giúp cầm nắm thoải mái và thuận tiện khi mang theo.\r\n    </p>\r\n\r\n    <h3>Đầu sấy tập trung luồng khí</h3>\r\n    <p>\r\n        Máy đi kèm đầu sấy hẹp giúp tập trung luồng gió, hỗ trợ tạo kiểu tóc nhanh chóng và hiệu quả hơn. \r\n        Phù hợp để sấy thẳng, tạo độ phồng hoặc định hình tóc theo ý muốn.\r\n    </p>\r\n\r\n    <h3>Công nghệ ThermoProtect bảo vệ tóc</h3>\r\n    <p>\r\n        Chế độ ThermoProtect giúp duy trì mức nhiệt sấy ổn định, hạn chế tình trạng tóc bị quá nóng, \r\n        hỗ trợ bảo vệ tóc khỏi hư tổn và giữ tóc mềm mại tự nhiên.\r\n    </p>\r\n\r\n    <h3>Công nghệ sấy ion cho tóc bóng mượt</h3>\r\n    <p>\r\n        Máy trang bị chế độ sấy ion giúp giảm hiện tượng tĩnh điện, hạn chế tóc xơ rối và hỗ trợ làm tóc bóng mượt hơn sau khi sấy.\r\n    </p>\r\n\r\n    <h3>Đa dạng chế độ sấy</h3>\r\n    <p>\r\n        Philips BHD350/10 tích hợp nhiều chế độ sấy linh hoạt như sấy mát, sấy nóng và sấy tăng cường, \r\n        giúp người dùng dễ dàng lựa chọn mức gió phù hợp với từng loại tóc và nhu cầu sử dụng.\r\n    </p>\r\n\r\n    <h3>Thiết kế hút gió hiệu quả</h3>\r\n    <p>\r\n        Mặt sau của máy được thiết kế dạng tổ ong hỗ trợ hút khí tốt hơn, \r\n        giúp luồng gió hoạt động ổn định và nâng cao hiệu quả sấy tóc.\r\n    </p>\r\n\r\n    <h3>Tiện lợi khi bảo quản</h3>\r\n    <p>\r\n        Máy có móc treo tiện dụng giúp dễ dàng cất giữ sau khi dùng, \r\n        tiết kiệm không gian và giữ khu vực sử dụng gọn gàng hơn.\r\n    </p>\r\n\r\n    <h3>An toàn khi sử dụng</h3>\r\n    <p>\r\n        Sản phẩm được trang bị tính năng tự ngắt khi quá tải nhằm bảo vệ động cơ và đảm bảo an toàn cho người dùng trong quá trình sử dụng lâu dài.\r\n    </p>\r\n\r\n    <p>\r\n        Máy sấy tóc Philips BHD350/10 là lựa chọn phù hợp cho những ai cần một thiết bị sấy tóc hiện đại, \r\n        dễ sử dụng và hỗ trợ chăm sóc tóc hiệu quả mỗi ngày.\r\n    </p>\r\n</div>', 12, 1200, 1),
(19, 7, 'Bếp ga mini Namilux NH-P3031AS', 45, 'P19_avt.jpg', 4, '<div class=\"product-description\">\r\n    <h2>Bếp ga mini Namilux NH-P3031AS kết cấu chắc chắn, hiện đại</h2>\r\n\r\n    <p>\r\n        Bếp ga mini Namilux NH-P3031AS sở hữu thiết kế nhỏ gọn, tiện lợi với \r\n        1 vùng nấu, phù hợp sử dụng trong phòng trọ, đi du lịch, cắm trại \r\n        hoặc dùng để ăn lẩu, nướng ngay trên bàn ăn. \r\n        Đây là dòng bếp gas mini chất lượng cao đạt tiêu chuẩn xuất khẩu toàn cầu.\r\n    </p>\r\n\r\n    <h3>Mặt bếp inox 430 bền bỉ, sáng đẹp</h3>\r\n    <p>\r\n        Mặt bếp được làm từ inox 430 cao cấp giúp chống rỉ sét hiệu quả, \r\n        chịu nhiệt tốt và luôn giữ được độ sáng bóng trong quá trình sử dụng. \r\n        Thiết kế dễ lau chùi giúp việc vệ sinh trở nên nhanh chóng hơn.\r\n    </p>\r\n\r\n    <h3>Hệ thống đánh lửa Magneto nhạy bén</h3>\r\n    <p>\r\n        Bếp sử dụng hệ thống đánh lửa Magneto giúp tạo tia lửa nhanh, \r\n        bật tắt dễ dàng chỉ với thao tác xoay núm vặn nhẹ nhàng.\r\n    </p>\r\n\r\n    <h3>Đầu đốt hợp kim nhôm chịu nhiệt tốt</h3>\r\n    <p>\r\n        Đầu đốt bằng hợp kim nhôm sơn vàng có khả năng chống ăn mòn, \r\n        hạn chế biến dạng khi sử dụng lâu dài. \r\n        Bếp còn được trang bị tấm truyền nhiệt giúp ổn định áp lực gas, \r\n        nâng công suất lên đến 3.1kW và tiết kiệm nhiên liệu hiệu quả.\r\n    </p>\r\n\r\n    <h3>Tính năng ngắt gas tự động an toàn</h3>\r\n    <p>\r\n        Bếp ga mini Namilux NH-P3031AS được tích hợp van Inline-Cut \r\n        giúp tự động ngắt gas khi phát hiện áp suất bất thường, \r\n        đảm bảo an toàn tối đa cho người sử dụng.\r\n    </p>\r\n\r\n    <h3>Kiềng nhôm chắc chắn, chống tràn hiệu quả</h3>\r\n    <p>\r\n        Kiềng bếp được làm từ nhôm cứng cáp, có thiết kế chống tràn nước \r\n        vào bên trong bếp giúp tăng độ bền và giữ cho bếp hoạt động ổn định.\r\n    </p>\r\n\r\n    <p>\r\n        Bếp ga mini Namilux NH-P3031AS mang đến sự tiện lợi, an toàn \r\n        và tiết kiệm cho mọi gia đình với thiết kế hiện đại, nhỏ gọn và dễ sử dụng.\r\n    </p>\r\n</div>', 24, 1, 1),
(20, 7, 'Bếp ga mini Namilux NH-P3031PS', 45, 'P20_avt.jpg', 4, '<div class=\"product-description\">\r\n    <h2>Bếp ga mini Namilux NH-P3031PS thiết kế gọn đẹp, chắc chắn</h2>\r\n\r\n    <p>\r\n        Bếp ga mini Namilux NH-P3031PS sở hữu thiết kế nhỏ gọn, hiện đại \r\n        với màu xanh ngọc lam nổi bật, phù hợp sử dụng trong phòng trọ, \r\n        gia đình ít người hoặc mang theo khi đi du lịch, cắm trại.\r\n    </p>\r\n\r\n    <p>\r\n        Với kết cấu vững chắc được sản xuất bằng công nghệ dập tự động Transfer, \r\n        sản phẩm mang lại độ đồng bộ cao, sử dụng bền bỉ và ổn định trong thời gian dài.\r\n    </p>\r\n\r\n    <h3>Chất liệu bền đẹp, dễ vệ sinh</h3>\r\n    <p>\r\n        Mặt bếp được làm từ tole sơn tĩnh điện giúp chống bám bẩn, \r\n        hạn chế trầy xước và giữ được vẻ ngoài sáng đẹp. \r\n        Kiềng nhôm chắc chắn có thiết kế chống tràn nước, \r\n        giúp tăng độ bền và dễ dàng tháo rời để vệ sinh.\r\n    </p>\r\n\r\n    <h3>Hệ thống đánh lửa Magneto nhạy bén</h3>\r\n    <p>\r\n        Bếp sử dụng hệ thống đánh lửa Magneto cơ học cho khả năng tạo tia lửa nhanh, \r\n        thao tác sử dụng đơn giản với núm vặn và cần gạt tiện lợi.\r\n    </p>\r\n\r\n    <h3>Đầu đốt hợp kim nhôm bền bỉ</h3>\r\n    <p>\r\n        Đầu đốt hợp kim nhôm được phủ lớp sơn chịu nhiệt giúp chống ăn mòn, \r\n        hạn chế biến dạng khi sử dụng lâu dài và giữ cho ngọn lửa cháy ổn định.\r\n    </p>\r\n\r\n    <h3>Van an toàn Inline-Cut bảo vệ người dùng</h3>\r\n    <p>\r\n        Bếp được trang bị van an toàn Inline-Cut giúp tự động ngắt gas \r\n        khi phát hiện áp suất bất thường, đảm bảo an toàn trong quá trình sử dụng. \r\n        Ngoài ra, miếng truyền nhiệt hỗ trợ ổn định áp lực lon gas, \r\n        giúp bếp hoạt động hiệu quả và bền hơn.\r\n    </p>\r\n\r\n    <h3>Mẹo sử dụng bếp gas mini an toàn</h3>\r\n    <p>\r\n        Không nên sử dụng nồi hoặc chảo quá lớn để tránh nhiệt tác động lên lon gas. \r\n        Đặt bếp ở nơi bằng phẳng, tránh gió mạnh để ngọn lửa ổn định hơn. \r\n        Đồng thời nên thay lon gas mới nếu lon cũ đã sử dụng quá lâu để đảm bảo an toàn.\r\n    </p>\r\n\r\n    <p>\r\n        Bếp ga mini Namilux NH-P3031PS là lựa chọn tiện lợi, an toàn và phù hợp \r\n        cho nhu cầu nấu nướng hằng ngày cũng như các chuyến đi dã ngoại.\r\n    </p>\r\n</div>\r\n', 24, 1200, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(21, 8, 'Nồi cơm điện tử Philips HD4515/55', 15, 'P21_avt.jpg', 5, '<p style=\"text-align: justify;\"><i><strong>Nồi cơm điện\n    tử&nbsp;Philips 1.8 lít HD4515/55</strong></i><i><strong> sử dụng công nghệ nấu 3D nấu cơm chín đều\ntơi xốp, lòng nồi bằng hợp kim phủ 6 lớp đá Maifan (lớp tráng Bakuhanseki siêu bền), tích hợp nhiều chế độ\ncài sẵn tiện lợi,… giúp bạn trổ tài chế biến nhiều món ngon chỉ với 1 thiết bị.&nbsp;</strong></i></p>\n<h3 style=\"text-align: justify;\">Công nghệ nấu, công suất - Dung tích</h3>\n<p style=\"text-align: justify;\">- Công suất 790 - 940W kết hợp công nghệ nấu 3D cho ra cơm chín đều, hạt cơm tơi xốp,\ngiữ lại tối đa lượng dưỡng chất trong gạo.</p>\n<p style=\"text-align: justify;\">-&nbsp;Dung tích 1.8\nlít, nấu được khoảng 8 - 10 cốc gạo, phù hợp sử dụng cho 4 - 6 người ăn.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042118.gif\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Công nghệ nấu\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042118.gif\"\n style=\"height: 436px; width: 780px;\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Công nghệ nấu\"></a>\n</p>\n<h3 style=\"text-align: justify;\">Bảng điều khiển - Chương trình cài đặt sẵn</h3>\n<p style=\"text-align: justify;\">- Bảng điều khiển nút nhấn to rõ, có kèm chú thích tiếng Anh.</p>\n<p style=\"text-align: justify;\">- Tích hợp đa dạng chương trình giúp bạn chế biến các món ăn đa dạng, dễ dàng như: gạo\ntrắng, giữ ấm, gạo lứt, cơm sushi, súp, hấp, nấu nhanh, nấu chậm, cháo, hầm, làm bánh.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-041935.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Chế độ \"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-041935.jpg\"\nstyle=\"height: 436px; width: 780px;\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Chế độ \"></a>\n</p>\n<h3 style=\"text-align: justify;\">Thiết kế, chất liệu của sản phẩm</h3>\n<p style=\"text-align: justify;\">-&nbsp;Nồi cơm điện&nbsp;tông màu trắng trang nhã,\nmẫu mã hiện đại, thiết kế dây điện có thể tháo rời.</p>\n<p style=\"text-align: justify;\">- Lòng nồi dày&nbsp;1.427&nbsp;mm được làm bằng hợp kim phủ 6 lớp đá Maifan (lớp tráng\nBakuhanseki) chống dính dày bền, nấu cơm ngon, giữ ấm hiệu quả. Bakuhanseki là đá tự nhiên, có chứa các khoáng chất\nvà các nguyên tố vi lượng, siêu bền và cứng hơn gấp 6 lần, giúp lòng nồi cứng cáp, gia nhiệt tốt, an toàn và dễ vệ\nsinh.</p>\n<p style=\"text-align: justify;\">- Nắp trong có thể tháo rời, tiện vệ sinh và lau chùi.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042014.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Lòng nồi \"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042014.jpg\"\nstyle=\"height: 436px; width: 780px;\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Lòng nồi \"></a></p>\n<h3 style=\"text-align: justify;\">Tiện ích</h3>\n<p>- Mẫu&nbsp;nồi cơm điện Philips&nbsp;này trang bị tính\nnăng hẹn giờ lên đến 24 giờ, giữ ấm tối đa 24 giờ, hỗ trợ bạn nấu cơm chủ động thời gian hơn.</p>\n<p><i><strong>Lưu ý:</strong></i>&nbsp;Tính năng hẹn giờ và giữ ấm còn tùy thuộc vào khí hậu, loại gạo,... để nồi chế\nbiến được món ăn thơm ngon, đảm bảo dinh dưỡng nhất có thể.</p>\n<p>- Có xửng hấp kèm theo để bạn tiện chế biến những món hấp đơn giản: bánh bao, xôi, trứng hấp,...</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042043.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042043.jpg\"\nstyle=\"height: 436px; width: 780px;\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Tiện ích\"></a></p>\n<h3 style=\"text-align: justify;\">Phụ kiện đi kèm</h3>\n<p style=\"text-align: justify;\">- Phụ kiện kèm theo bao gồm: cốc đong, muỗng cơm, xửng hấp.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-191222-034952.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Phụ kiện\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-191222-034952.jpg\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Phụ kiện\"></a></p>\n<p style=\"text-align: justify;\"><i>Nồi cơm điện tử Philips 1.8 lít\nHD4515/55</i>&nbsp;<em>đến từ thương hiệu uy tín Philips của Hà Lan, sở hữu nhiều chương trình tự động,\ncông nghệ nấu 3D cùng lòng nồi phủ lớp đá Maifan bền tốt sẽ giúp bạn chế biến những bữa cơm thơm ngon, giữ lại\nnhiều dưỡng chất trong gạo.</em></p>', 24, 1, 1),
(22, 8, 'Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520', 13, 'P22_avt.jpg', 4, '<p><em><strong>Nồi cơm điện nắp gài BlueStone 1.8\n    lít RCB-5520</strong></em>&nbsp;<i><strong>trang bị công nghệ 1D nấu cơm chín nhanh, lòng\nnồi hợp kim nhôm phủ chống dính bền tốt, điều chỉnh bằng nút gạt dễ sử dụng,... là sản phẩm tiện lợi\nhỗ trợ chế biến những bữa cơm thơm ngon cho gia đình.</strong></i></p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-1a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Tổng quan\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-1a-1.jpg\"\n title=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Tổng quan\"></a></p>\n<h3>Công nghệ nấu, công suất - Dung tích</h3>\n<p>- Công suất 700W kết hợp công nghệ 1D giúp nấu cơm chín nhanh, rút ngắn\nthời gian nấu nướng cho người nội trợ.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-2a.gif\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Công nghệ\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-2a.gif\"\n title=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Công nghệ\"></a></p>\n<p>- Dung tích 1.8 lít, nấu được 8 - 10 cốc gạo kèm nồi, phù hợp cho gia đình 4 - 6 người.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-3a-1.jpg\"\nonclick=\"return false;\"><img\nalt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Dung tích, công suất\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-3a-1.jpg\"\n title=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Dung tích, công suất\"></a></p>\n<h3>Bảng điều khiển - Chế độ nấu</h3>\n<p>- Bảng điều khiển nút gạt đơn giản, có kèm đèn báo trạng thái hoạt động, dễ thao tác ngay cả với người lớn\ntuổi.</p>\n<p>- Mẫu nồi cơm điện này có 2 chế\nđộ: nấu cơm và giữ ấm.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-4a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Bảng điều khiển\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-4a-1.jpg\"\ntitle=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Bảng điều khiển\"></a></p>\n<h3>Thiết kế của sản phẩm</h3>\n<p>- Mẫu&nbsp;nồi cơm điện\nBlueStone&nbsp;này được thiết kế màu vàng đồng hiện đại, làm tăng vẻ đẹp thẩm mỹ cho không gian bếp.\n</p>\n<p>- Lòng nồi dày khoảng 1.5 mm bằng hợp kim nhôm phủ lớp chống dính, gia nhiệt tốt giúp cơm chín đều, thơm\nngon, chống dính cháy, dễ vệ sinh.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-5a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Lòng nồi\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-5a-1.jpg\"\ntitle=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Lòng nồi\"></a></p>\n<h3>Tiện ích - Phụ kiện</h3>\n<p>- Có xửng hấp đi kèm, hỗ trợ bạn hấp những món đơn giản: bánh bao, khoai,... nhanh chóng và tiện lợi.</p>\n<p>- Phụ kiện: xửng hấp, muỗng múc cơm, cốc đong.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-6a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-6a-1.jpg\"\ntitle=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Tiện ích\"></a></p>\n\n', 24, 1200, 1),
(23, 9, 'Lò chiên không dầu Ferroli FAF-12M 12 lít', 19, 'P23_avt.jpg', 5, '<p><em><strong>Lò chiên không dầu&nbsp;</strong></em><i><strong>Ferroli FAF-12M 12 lít giúp bạn chiên lượng lớn thực\n    phẩm cùng lúc hoặc nướng gà nguyên con nhờ dung tích 12 lít, có nhiều phụ kiện đi kèm hỗ trợ bạn nấu nướng\n    thuận tiện, bảng điều khiển nút xoay đơn giản, dễ dàng điều chỉnh chức năng.</strong></i></p>\n<h3>Dung tích - Công suất&nbsp;</h3>\n<p>- Thiết kế&nbsp;nồi chiên không dầu&nbsp;kết hợp lò nướng, dung tích 12 lít, chế biến được gà nguyên con khoảng 1.5\nkg.</p>\n<p>- Công suất hoạt động 1800W cho khả năng chiên nướng nhanh, rút ngắn thời gian chờ đợi.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055222.jpg\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Dung tích \"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055222.jpg\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Dung tích\"></a>\n</p>\n<h3>Công nghệ chiên, nướng - Nhiệt độ, thời gian</h3>\n<p>- Công nghệ làm nóng bằng thanh nhiệt điện trở giúp thức ăn chín đều các mặt, giảm lượng dầu mỡ tối đa.</p>\n<p>- Nhiệt độ lò có thể điều chỉnh từ 80 - 200°C, thời gian từ 0 - 60 phút.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055248.gif\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Công nghệ \"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055248.gif\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Công nghệ \"></a>\n</p>\n<h3>Thiết kế, chất liệu sản phẩm&nbsp;</h3>\n<p>- Mẫu&nbsp;nồi chiên không dầu Ferroli&nbsp;FAF-12M 12 lít thiết kế 2 trong 1, kết hợp giữa nồi chiên không dầu và lò\nnướng, cửa kính trong suốt thuận tiện cho việc nấu nướng,&nbsp;thích hợp với hầu hết mọi không gian bếp.</p>\n<p>- Vỏ ngoài làm bằng nhựa ABS cao cấp, an toàn, kháng vỡ, dễ lau chùi.</p>\n<p>- Khoang lò bằng thép mạ kẽm, bền tốt, nấu ăn an toàn, thuận tiện vệ sinh sau khi nấu nướng.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-220923-090045.jpg\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Khoang lò\"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-220923-090045.jpg\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Khoang lò\"></a>\n</p>\n<h3>Bảng điều khiển</h3>\n<p>- Bảng điều khiển nút xoay dễ thao tác, tiện điều chỉnh nhiệt độ và thời gian chiên nướng.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055343.jpg\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Bảng điều khiển \"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055343.jpg\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Bảng điều khiển \"></a>\n</p>\n<h3>Tiện ích - Phụ kiện đi kèm</h3>\n<p>- Sở hữu thiết kế 2 trong 1: kết hợp giữa nồi chiên không dầu và lò nướng, giúp chế biến thực phẩm hạn chế dầu mỡ.\n</p>\n<p>-&nbsp;Nắp kính trong suốt&nbsp;và có đèn trong khoang lò để bạn dễ quan sát thức ăn lúc đang nấu.</p>\n<p>- Lò có đèn báo hoạt động, giúp người dùng tiện theo dõi trạng thái hoạt động của lò.</p>\n<p>- Trang bị quạt đối lưu đưa nhiệt lượng tỏa đều khoang lò, chế biến thức ăn chín đều các mặt.</p>\n<p>- Phụ kiện bao gồm: giỏ chiên, khay nướng, 2 vỉ nướng, khay xiên quay, tay cầm và xiên quay.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055855.jpg\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Tiện ích\"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055855.jpg\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Tiện ích\"></a>\n</p>\n<h3>Cách vệ sinh lò và lưu ý khi sử dụng</h3>\n<p>- Không sử dụng miếng cọ rửa bằng kim loại, chất tẩy rửa có tính ăn mòn, miếng len thép, hoặc khăn có sạn,... để lau\nbên ngoài, bên trong và các phụ kiện của lò chiên, hãy sử dụng miếng bọt biển hoặc vải mềm có tẩm chất tẩy rửa nhẹ\nhoặc khăn giấy với chất tẩy rửa kính dạng xịt để làm sạch.&nbsp;</p>\n<p>- Mở cửa lò chiên trong 10 - 15 phút để làm khô bên trong lò chiên và khung cửa sau mỗi lần sử dụng.</p>\n<p>- Không dùng vật thô cứng hoặc dụng cụ kim loại sắc nhọn để cạo cửa kính.</p>\n<p>Lò chiên không dầu Ferroli FAF-12M 12 lít​</i><em><i>&nbsp;mẫu mã hiện đại, dung tích lớn thuận tiện chiên số lượng\n    nhiều thực phẩm, làm bánh, nướng gà nguyên con,... là thiết bị gia dụng hữu ích, hỗ trợ tối ưu cho người nội\n    trợ trong việc nấu nướng.</i></em></p>\n', 12, 0, 1),
(24, 9, 'Nồi chiên không dầu Kangaroo KG42AF1', 14, 'P24_avt.jpg', 4.6, '<h3>Nồi chiên không dầu\n    Kangaroo&nbsp;với vỏ nhựa dày bền cách nhiệt, dễ lau chùi, dung tích tổng 4 lít và dung tích sử dụng 3.5 lít\nphục vụ thoải mái cho gia đình 3 – 5 người ăn</h3>\n<p>Nồi với màu đen hiện đại và sang trọng, kiểu dáng mềm mại, gọn gàng dễ kết hợp trong nhiều không gian bếp.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-1-2.jpg\"\n    onclick=\"return false;\"><img alt=\"Thiết kế - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-1-2.jpg\"\n        title=\"Thiết kế - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"></a></p>\n<h3>Chiên nướng ngon không cần dùng dầu ăn, tiết giảm đến 80% lượng chất béo dư thừa an toàn hơn cho sức khỏe</h3>\n<p>Công suất hoạt động 1400W, làm nóng nhanh bằng thanh nhiệt, nồi có chế độ bảo vệ tự ngắt khi quá nhiệt tránh hư hại\ncho thiết bị và an toàn hơn cho người sử dụng.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-2-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Chiên nướng không dầu - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-2-1.jpg\"\n        title=\"Chiên nướng không dầu - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"></a></p>\n<h3>Rổ chiên dung tích sử dụng 3.5 lít, có tay cầm rời tháo lắp bằng nút gạt thuận tiện khi sử dụng, chống nóng bỏng cho\nngười dùng</h3>\n<p>Khay chiên (gồm rổ chiên + lòng nồi) được phủ lớp chống dính Ceramic bền tốt, hạn chế dính cháy thực phẩm, tiện vệ\nsinh.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-4-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Rổ chiên có tay cầm rời - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-4-1.jpg\"\n       title=\"Rổ chiên có tay cầm rời - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"></a></p>\n<h3>Nhiệt độ nướng 80 - 200 độ C cho món nướng chuẩn ngon, hẹn giờ nấu 30 phút hỗ trợ người dùng rảnh tay với những việc\nbếp núc khác&nbsp;</h3>\n<p>Bảng điều khiển núm vặn\ndùng đơn giản với 2 núm độc lập chỉnh nhiệt độ nấu và hẹn giờ nấu, màn hình hiển thị tiện quan sát chế độ đang hoạt\nđộng.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-5-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Bảng điều khiển - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-5-1.jpg\"\n        title=\"Bảng điều khiển - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"></a></p>\n<p><strong>Lưu ý khi sử dụng nồi chiên không dầu:</strong></p>\n<p>- Thực phẩm trước khi đưa vào nồi chiên cần được làm sạch và ráo nước.</p>\n<p>- Không cho quá nhiều thực phẩm vào cùng một lúc tránh đầy thức ăn và thức ăn không chín đều.</p>\n<p>- Chiên xong chờ thức ăn và lò nguội bớt trước khi lấy ra ngoài và chiên thêm mẻ tiếp theo.</p>\n<p>- Rút điện, chờ thiết bị nguội ít nhất 30 phút sau khi nấu rồi mới tiến hành vệ sinh.</p>\n<p>- Rửa khay chiên bằng nước nóng với một chút nước rửa chén và miếng vải mềm.</p>\n<p>Nồi chiên không dầu Kangaroo KG42AF1 4 lít thiết kế tiện\ndụng hơn, dùng an toàn, bền tốt, cho gia đình những bữa ăn ngon nhanh gọn, dinh dưỡng, có lợi hơn cho sức khỏe.</p>', 12, 1050, 1),
(25, 3, 'Bếp từ lắp âm Pramie 2108', 16, 'P25_avt.jpg', 4.6, '<h3 style=\"text-align: justify;\">Bếp từ hồng ngoại\r\n    Pramie&nbsp;thương hiệu Pramie - Đức, sản xuất tại Malaysia, thiết kế lắp âm hiện đại</h3>\r\n<p style=\"text-align: justify;\">1 vùng nấu từ, 1 vùng nấu hồng ngoại sử dụng linh hoạt, tiện lợi cho nhu cầu\r\nhàng ngày. Với tổng công suất 4400W, bếp sử dụng điện nối qua aptomat (CB).</p>\r\n<p style=\"text-align: justify;\"><strong>Hãng Pramie hỗ trợ miễn phí cắt lỗ đá để lắp âm cho bếp Pramie trên\r\n    toàn quốc.</strong></p>\r\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\r\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108--1.jpg\"\r\n    onclick=\"return false;\"><img alt=\"Lắp âm sang trọng - Bếp từ hồng ngoại Pramie 2108\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108--1.jpg\"\r\n         title=\"Lắp âm sang trọng - Bếp từ hồng ngoại Pramie 2108\"></a></p>\r\n<h3 style=\"text-align: justify;\">Vùngbếp từ công suất 2200W, có chức năng nấu nhanh qua chế độ Booster với công suất\r\nđến 3000W</h3>\r\n<p style=\"text-align: justify;\">Nấu ăn nhanh chóng, an toàn, sử dụng với các nồi chảo có đáy nhiễm từ.</p>\r\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\r\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-2a.jpg\"\r\n    onclick=\"return false;\"><img alt=\"Bếp từ hồng ngoại lắp âm Pramie 2108 - Chảo, nồi nhiễm từ\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-2a.jpg\"\r\n        title=\"Bếp từ hồng ngoại lắp âm Pramie 2108 - Chảo, nồi nhiễm từ\"></a></p>\r\n<h3 style=\"text-align: justify;\">Vùng bếp hồng ngoại&nbsp;công suất 2200W, dùng với mọi loại nồi chảo</h3>\r\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\r\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-8.jpg\"\r\n    onclick=\"return false;\"><img alt=\"Hồng ngoại có công suất 2200W\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-8.jpg\"\r\n        title=\"Hồng ngoại có công suất 2200W\"></a></p>\r\n<h3 style=\"text-align: justify;\">Mặt kính Ceramic thương hiệu K+ (Pháp) cao cấp cho khả năng chịu lực và\r\nchịu nhiệt tốt, chịu sốc nhiệt cao, chống trầy hiệu quả, sáng bóng dễ&nbsp;lau chùi</h3>\r\n<p style=\"text-align: justify;\">Người dùng an tâm về độ mới, độ bền của mặt bếp và sự ổn định khi vận hành.\r\n</p>\r\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\r\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-4.jpg\"\r\n    onclick=\"return false;\"><img alt=\"Kính cao cấp - Bếp từ hồng ngoại Pramie 2108\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-4.jpg\"\r\n       title=\"Kính cao cấp - Bếp từ hồng ngoại Pramie 2108\"></a></p>\r\n<h3 style=\"text-align: justify;\">Bảng\r\n    điều khiển&nbsp;cảm ứng&nbsp;chạm trượt thao tác nhạy bén, thiết kế độc lập cho từng vùng nấu\r\nvới 9 mức công suất tùy chỉnh theo nhu cầu</h3>\r\n<p style=\"text-align: justify;\">Chức năng hẹn giờ cho phép người dùng chủ động thời gian dùng&nbsp;bếp từ hồng ngoại, an tâm làm những\r\ncông việc khác mà không lo món ăn quá nhiệt, cháy khét.</p>\r\n<p style=\"text-align: justify;\">Vô hiệu hóa bảng điều khiển khi bếp từ đang hoạt động, duy trì chế độ cài\r\nđặt trước đó và tránh người dùng, trẻ nhỏ vô tình chạm tay vào không gây thay đổi chương trình nấu.</p>\r\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\r\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-5.jpg\"\r\n    onclick=\"return false;\"><img alt=\"Điều khiển nhạy bén - Bếp từ hồng ngoại Pramie 2108\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-5.jpg\"\r\n       title=\"Điều khiển nhạy bén - Bếp từ hồng ngoại Pramie 2108\"></a></p>\r\n<h3 style=\"text-align: justify;\">Hỗ trợ các tính năng an toàn</h3>\r\n<p style=\"text-align: justify;\">-&nbsp;Cảnh báo mặt bếp nóng&nbsp;hiển thị cảnh báo để\r\ntránh chạm vào mặt bếp còn nóng.</p>\r\n<p style=\"text-align: justify;\">- Tự nhận diện kích cỡ nồi chảo: chỉ làm nóng vùng để nồi chảo chứ không\r\nphải hoàn toàn vùng nấu để tiết kiệm thời gian và năng lượng.</p>\r\n<p style=\"text-align: justify;\">&nbsp;<a class=\"preventdefault\"\r\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-270122-040447.jpg\"\r\n    onclick=\"return false;\"><img alt=\"Bếp từ hồng ngoại Pramie 2108 với nhiều tính năng an toàn\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-270122-040447.jpg\"\r\n      title=\"Bếp từ hồng ngoại Pramie 2108 với nhiều tính năng an toàn\"></a></p>\r\n<p style=\"text-align: justify;\">Lưu ý:</p>\r\n<p style=\"text-align: justify;\">- Đặt bếp ở vị trí chắc chắn, cân bằng, cách xa tường tầm 15 cm để tản nhiệt\r\nnhanh.</p>\r\n<p style=\"text-align: justify;\">- Không nên nấu ăn với công suất tối đa quá lâu vì dễ gây cháy thức ăn và\r\nlâu dần có thể làm giảm tuổi thọ bếp.</p>\r\n<p style=\"text-align: justify;\">- Khi nấu ăn xong, nên vệ sinh bếp để giữ bếp mới lâu.</p>\r\n<p style=\"text-align: justify;\">Bếp từ hồng ngoại Pramie 2108 phục vụ tốt\r\ncho các gia đình muốn tận dụng sự tiện nghi của cả 2 loại bếp điện, dùng an toàn, bền tốt, nấu ăn nhanh\r\ntiết kiệm thời gian.</p>\r\n', 36, 1250, 1),
(26, 5, 'Bếp hồng ngoại 3 vùng nấu lắp âm Smeg SE363ETB ', 20, 'P26_avt.jpg', 4.4, '<p><i><strong>Sản phẩm bếp hồng ngoại 3 vùng nấu lắp âm Smeg SE363ETB (536.64.101) chất lượng cao thương hiệu Smeg của\n    Ý, sản xuất tại Ý với thiết kế lắp âm sang trọng, cao cấp chuẩn Châu Âu, mang đến nét đẹp cho không gian bếp\n    hiện đại.</strong></i></p>\n<h3>Công suất - Kích thước vùng nấu</h3>\n<p>- Tổng công suất đạt 5700W, nấu ăn nhanh, tiết kiệm thời gian cho việc bếp núc.</p>\n<p>- Vùng nấu trái phía trên công suất 1200W, vùng nấu trái dưới 1800W, vùng nấu phải với 3 có 3 công suất\n1050/1950/2700W hoạt động mạnh mẽ.</p>\n<p>-&nbsp;Vùng nấu trái trên đường kính Ø14.8 cm, vùng nấu trái dưới&nbsp;Ø18.4 cm, vùng nấu phải có 3 vòng nhiệt đường\nkính lần lượt Ø15.0 - Ø21.6 - Ø28.8 cm cho phép sử dụng linh hoạt với nhiều cỡ nồi chảo vô cùng tiện lợi.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045913.gif\"\nonclick=\"return false;\"><img alt=\"Công suất lớn, vùng nấu rộng rãi\"\n    src=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045913.gif\"\n    title=\"Công suất lớn, vùng nấu rộng rãi\"></a></p>\n<h3>Thiết kế</h3>\n<p>- Bếp hồng ngoại Smeg SE363ETB\n(536.64.101) thiết kế hiện đại, sang đẹp với 3 vùng đa kích thước rộng rãi.</p>\n<p>-&nbsp;Bếp hồng ngoại&nbsp;có&nbsp;mặt kính Ceramic&nbsp;- Smeg cao cấp của Ý, khả năng chịu lực\nvà chịu nhiệt tốt, ít bị trầy xước, giữ bếp gia nhiệt hiệu quả, luôn sáng đẹp như mới.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045916.jpg\"\nonclick=\"return false;\"><img alt=\"Thiết kế sang trọng, cho gian bếp thêm phần đẳng cấp\"\n    src=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045916.jpg\"\n     title=\"Thiết kế sang trọng, cho gian bếp thêm phần đẳng cấp\"></a></p>\n<h3>Tiện ích</h3>\n<p>- 9 mức công suất và nhiệt độ, linh hoạt tùy chỉnh cho phù hợp với từng món ăn khác nhau.</p>\n<p>- Bảng điều khiển cảm ứng nhạy, điều chỉnh độc lập 3 vùng nấu.</p>\n<p>- Trang bị&nbsp;chức năng hẹn\ngiờ&nbsp;thông minh hỗ trợ người nội trợ kiểm soát tốt thời gian sử dụng bếp, rảnh tay cho những công việc\nkhác mà không lo món nấu quá nhiệt.</p>\n<p>- Bếp không kén nồi, dùng được với mọi loại&nbsp;nồi,&nbsp chảo, tiết kiệm đáng kể chi phí đầu tư mua dụng cụ\nnấu, có thể tận dụng các nồi chảo có sẵn.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045918.jpg\"\nonclick=\"return false;\"><img alt=\"Nhiều tiện ích đi kèm hỗ trợ người dùng tối đa\"\n    src=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045918.jpg\"\n     title=\"Nhiều tiện ích đi kèm hỗ trợ người dùng tối đa\"></a></p>\n<h3>Tính năng an toàn</h3>\n<p>-&nbsp;Khóa bảng điều\nkhiển, đảm bảo an toàn cho gia đình, đặc biệt gia đình có con nhỏ.</p>\n<p>- Tính năng&nbsp;tự ngắt khi quá\nnhiệt&nbsp;giúp tránh cháy nổ.</p>\n<p>- Tự ngắt khi tràn nước.</p>\n<p>- Cảnh báo mặt bếp còn nóng, tránh bị bỏng.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045920.jpg\"\nonclick=\"return false;\"><img alt=\"Nhiều tính năng an toàn bảo vệ người dùng\"\n    src=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045920.jpg\"\n     title=\"Nhiều tính năng an toàn bảo vệ người dùng\"></a></p>\n<p><strong>Sử dụng bếp hồng ngoại an toàn</strong></p>\n<p>- Lắp đặt bếp âm theo đúng hướng dẫn của nhà sản xuất, đảm bảo khu vực đun nấu thông thoáng.</p>\n<p>- Tránh các tác động gây trầy xước mặt bếp sẽ ảnh hưởng đến hiệu quả gia nhiệt, mất thẩm mỹ.</p>\n<p>- Bếp hồng ngoại có thể lưu nhiệt sau quá trình sử dụng, cẩn trọng để tránh bị phỏng.</p>\n<p><i>Bếp hồng ngoại Smeg SE363ETB (536.64.101) là thương\nhiệu Ý, sản xuất tại Ý chất lượng cao, thiết kế 3 vùng nấu rộng rãi, công suất lớn 5700W, 9 mức nhiệt điều khiển\ncảm ứng cùng nhiều tính năng hẹn giờ, khóa điều khiển, cảnh báo bếp nóng là một lựa chọn hoàn hảo cho gia đình\nbạn.</i></p>', 24, 950, 1),
(27, 23, 'Máy ép chậm BlueStone SJB-6578', 13, 'P27_avt.jpg', 5, '<div class=\"product-description\">\r\n    <h2>Máy ép chậm BlueStone SJB-6578 ép kiệt bã, giữ trọn dưỡng chất</h2>\r\n\r\n    <p>\r\n        Máy ép chậm BlueStone SJB-6578 vận hành êm ái, giúp tạo ra những ly nước ép tươi ngon, \r\n        hạn chế tách nước và giữ lại nhiều vitamin, dưỡng chất tự nhiên có trong rau củ và trái cây.\r\n    </p>\r\n\r\n    <h3>Thiết kế hiện đại, tiện dụng</h3>\r\n    <p>\r\n        Máy sở hữu kiểu dáng gọn gàng, hiện đại phù hợp với nhiều không gian bếp. \r\n        Thiết kế dễ tháo lắp giúp người dùng thuận tiện hơn trong quá trình sử dụng và vệ sinh.\r\n    </p>\r\n\r\n    <h3>Ống tiếp nguyên liệu lớn tiện lợi</h3>\r\n    <p>\r\n        Máy được trang bị 2 cửa tiếp nguyên liệu với kích thước khác nhau, \r\n        giúp ép được đa dạng loại thực phẩm từ rau củ, trái cây lớn đến các loại quả nhỏ như nho, dâu tây,...\r\n        Người dùng có thể cho nguyên liệu nguyên trái vào cửa lớn để tiết kiệm thời gian sơ chế.\r\n    </p>\r\n\r\n    <h3>Chất liệu bền bỉ, an toàn</h3>\r\n    <p>\r\n        Trục nghiền, cốc đựng và các phụ kiện được làm từ nhựa ABS, nhựa PEI và inox 304 cao cấp, \r\n        đảm bảo độ bền cao, hạn chế nứt vỡ và an toàn cho sức khỏe người sử dụng.\r\n    </p>\r\n\r\n    <h3>Ép chậm hiệu quả, giữ hương vị tự nhiên</h3>\r\n    <p>\r\n        Công nghệ ép chậm giúp giảm ma sát và nhiệt sinh ra trong quá trình vận hành, \r\n        từ đó giữ được hương vị tươi ngon và hàm lượng dưỡng chất trong thực phẩm.\r\n    </p>\r\n\r\n    <h3>Tiện ích hỗ trợ sử dụng</h3>\r\n    <p>\r\n        Máy có khóa vòi chống nhỏ giọt giúp hạn chế nước ép rò rỉ ra ngoài, \r\n        giữ khu vực sử dụng luôn sạch sẽ. Chân đế bọc cao su chống trượt giúp máy đứng vững, \r\n        hạn chế rung lắc khi hoạt động.\r\n    </p>\r\n\r\n    <h3>Dễ dàng vệ sinh</h3>\r\n    <p>\r\n        Các bộ phận có thể tháo rời thuận tiện cho việc vệ sinh sau khi sử dụng. \r\n        Máy còn đi kèm chổi vệ sinh giúp làm sạch nhanh chóng và hiệu quả hơn.\r\n    </p>\r\n\r\n    <h3>An toàn khi sử dụng</h3>\r\n    <p>\r\n        Máy chỉ hoạt động khi các bộ phận được lắp đúng khớp nhằm đảm bảo an toàn cho người dùng. \r\n        Ngoài ra, tính năng tự ngắt khi quá tải giúp bảo vệ động cơ và tăng độ bền cho sản phẩm.\r\n    </p>\r\n\r\n    <p>\r\n        Máy ép chậm BlueStone SJB-6578 là lựa chọn phù hợp cho gia đình yêu thích nước ép tươi, \r\n        mong muốn sở hữu thiết bị ép hiệu quả, dễ sử dụng và giữ được nhiều dưỡng chất tự nhiên.\r\n    </p>\r\n</div>', 12, 1200, 1),
(28, 1, 'Bếp gas âm kính SUNHOUSE SHB388PT', 24, 'P28_avt.jpg', 4.9, '<p><strong><em>Bếp gas âm kính SUNHOUSE SHB388PT là dòng bếp gas âm hiện đại, thiết kế sang trọng với mặt kính bền đẹp, phù hợp cho không gian bếp tiện nghi và thẩm mỹ.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Trang bị <strong>mặt kính cường lực toàn phần</strong>, sáng bóng, chịu nhiệt tốt và dễ dàng vệ sinh.</p>\r\n<p>- Thiết kế âm giúp không gian bếp gọn gàng, hiện đại.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Khung bếp chắc chắn, độ bền cao, phù hợp sử dụng lâu dài.</p>\r\n<p>- Thiết kế tối ưu cho lắp đặt âm bàn bếp.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng <strong>độc lập tráng men</strong> siêu bền, chịu lực tốt, giữ nồi ổn định khi nấu.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp gồm <strong>2 vùng nấu</strong>, tiện lợi khi nấu nhiều món cùng lúc.</p>\r\n<p>- <strong>Đầu đốt công nghệ mới</strong> cho ngọn lửa xanh, cháy đều và tiết kiệm gas.</p>\r\n<p>- <strong>Họng thép cao cấp</strong> giúp tăng độ bền và không sinh muội đen.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Sử dụng <strong>hệ thống đánh lửa Magneto</strong> cho tia lửa nhanh, độ bền cao, không cần dùng pin.</p>\r\n<p>- Núm vặn điều chỉnh linh hoạt, dễ thao tác.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt tối ưu giúp <strong>giảm tiêu hao gas</strong>.</p>\r\n<p>- Ngọn lửa tập trung, hạn chế thất thoát nhiệt.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Mặt kính chịu lực, chịu nhiệt tốt, đảm bảo an toàn.</p>\r\n<p>- Kết cấu bếp chắc chắn, hạn chế rủi ro trong quá trình nấu.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> với bề mặt kính phẳng.</p>\r\n<p>- Thiết kế âm tăng tính thẩm mỹ cho không gian bếp.</p>\r\n<p>- Phù hợp với gia đình, căn hộ hiện đại.</p>\r\n\r\n<p><em>Tóm lại, bếp gas âm kính SUNHOUSE SHB388PT là lựa chọn phù hợp với thiết kế đẹp, độ bền cao, tiết kiệm gas và dễ sử dụng, đáp ứng tốt nhu cầu nấu ăn hàng ngày.</em></p>', 24, 200, 1),
(29, 1, 'BẾP GAS DƯƠNG KÍNH SUNHOUSE MAMA MMB33012-V\r\n', 24, 'P29_avt.jpg', 4, '<p><strong><em>Bếp gas dương kính Sunhouse Mama MMB33012-V là dòng bếp gas gia đình với thiết kế hiện đại, mặt kính bền đẹp, phù hợp cho nhu cầu nấu ăn hàng ngày.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Trang bị <strong>mặt kính cường lực sáng bóng</strong>, chịu nhiệt tốt, chống trầy xước và dễ vệ sinh.</p>\r\n<p>- Thiết kế tinh tế, phù hợp nhiều không gian bếp.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Thân bếp chắc chắn, độ bền cao, đảm bảo sử dụng lâu dài.</p>\r\n<p>- Thiết kế gọn nhẹ, dễ dàng lắp đặt và di chuyển.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng thép bền chắc, chịu lực tốt, giữ nồi ổn định khi nấu.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp gồm <strong>2 họng đốt</strong>, giúp nấu nhiều món cùng lúc.</p>\r\n<p>- <strong>Đầu đốt bằng đồng</strong> hạn chế mài mòn, tăng độ bền.</p>\r\n<p>- Ngọn lửa tỏa đều, giúp đun nấu nhanh và hiệu quả.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Sử dụng <strong>hệ thống đánh lửa Magneto</strong> tạo tia lửa nhanh, không cần dùng pin.</p>\r\n<p>- Núm vặn dễ sử dụng, điều chỉnh linh hoạt mức lửa.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế đầu đốt tối ưu giúp <strong>tiết kiệm gas hiệu quả</strong>.</p>\r\n<p>- Ngọn lửa xanh, cháy đều, hạn chế thất thoát nhiệt.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- <strong>Họng thép không gỉ</strong> giúp ngọn lửa ổn định, không tạo muội đen.</p>\r\n<p>- Kết cấu bếp chắc chắn, đảm bảo an toàn trong quá trình nấu.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt kính phẳng.</p>\r\n<p>- Thiết kế gọn gàng, phù hợp với nhiều không gian bếp.</p>\r\n<p>- Phù hợp cho gia đình, sinh viên hoặc nhà trọ.</p>\r\n\r\n<p><em>Tóm lại, bếp gas dương kính Sunhouse Mama MMB33012-V là lựa chọn phù hợp với thiết kế đẹp, bền bỉ, tiết kiệm gas và dễ sử dụng, đáp ứng tốt nhu cầu nấu ăn hàng ngày.</em></p>', 24, 400, 1),
(30, 3, 'Bếp từ đôi Lorca LCI 886D\r\n', 48, 'P30_avt.jpg', 0, '<h3>Bếp từ đôi Lorca LCI 886D</h3>\r\n\r\n<p><strong>Giới thiệu:</strong><br>\r\nBếp từ đôi Lorca LCI 886D là sản phẩm cao cấp nổi bật với thiết kế tối giản, thanh lịch cùng công nghệ nấu nướng hiện đại. Sản phẩm mang đến trải nghiệm tiện nghi, an toàn và phù hợp với mọi không gian bếp hiện đại.\r\n</p>\r\n\r\n<h4>THIẾT KẾ: TỐI GIẢN – THANH LỊCH</h4>\r\n\r\n<p><strong>Kiểu dáng hiện đại</strong><br>\r\nBếp sở hữu thiết kế đơn giản với hai vùng nấu riêng biệt, tạo cảm giác gọn gàng và tinh tế. Mặt kính ceramic sáng bóng giúp tăng tính thẩm mỹ cho không gian bếp.\r\n</p>\r\n\r\n<p><strong>Bảng điều khiển tinh tế</strong><br>\r\nCác nút điều khiển được thiết kế nhạy bén, thao tác nhẹ nhàng giúp người dùng dễ dàng điều chỉnh trong quá trình nấu nướng.\r\n</p>\r\n\r\n<h4>CÔNG NGHỆ: THÔNG MINH – AN TOÀN</h4>\r\n\r\n<p><strong>Cảm biến nhiệt thông minh</strong><br>\r\nBếp được tích hợp công nghệ cảm biến nhiệt hiện đại, có khả năng tự động ngắt khi phát hiện nhiệt độ quá cao, giúp bảo vệ thiết bị và đảm bảo an toàn khi sử dụng.\r\n</p>\r\n\r\n<p><strong>Khóa bảng điều khiển</strong><br>\r\nTính năng khóa giúp tránh việc vô tình thay đổi cài đặt trong quá trình nấu, đặc biệt an toàn với gia đình có trẻ nhỏ.\r\n</p>\r\n\r\n<h4>HIỆU QUẢ NẤU NƯỚNG</h4>\r\n\r\n<p><strong>Nấu nhanh, tiết kiệm điện</strong><br>\r\nCông nghệ nấu từ hiện đại giúp gia nhiệt nhanh, nấu ăn hiệu quả và tiết kiệm điện năng hơn so với các loại bếp truyền thống.\r\n</p>\r\n\r\n<p><strong>Trải nghiệm tiện lợi</strong><br>\r\nHai vùng nấu giúp bạn dễ dàng chế biến nhiều món ăn cùng lúc, tiết kiệm thời gian và công sức trong căn bếp hàng ngày.\r\n</p>\r\n\r\n<p>\r\nVới thiết kế thanh lịch cùng công nghệ tiên tiến, bếp từ đôi Lorca LCI 886D là lựa chọn lý tưởng giúp nâng tầm không gian bếp và mang đến trải nghiệm nấu nướng hiện đại, tiện nghi.\r\n</p>\r\n', 24, 200, 1),
(31, 3, 'Bếp từ đôi Electrolux EHI7260BB\r\n', 44, 'P31_avt.jpg', 4.3, '<h3>Bếp từ đôi Electrolux EHI7260BB</h3>\r\n\r\n<p><strong>Giới thiệu:</strong><br>\r\nBếp từ đôi Electrolux EHI7260BB là thiết bị nhà bếp đầy tiện ích, có kiểu dáng sang trọng góp phần tô điểm cho nhiều không gian bếp. Với 2 vùng nấu khác nhau kết hợp cùng khả năng hoạt động mạnh mẽ, sản phẩm này sẽ giúp rút ngắn thời gian nấu nướng, đem lại nhiều tiện lợi cho người dùng. Bên cạnh đó, sản phẩm cũng sở hữu nhiều tính năng thông minh, hiện đại, mang đến trải nghiệm sử dụng ấn tượng.\r\n</p>\r\n\r\n<h4>ƯU ĐIỂM NỔI BẬT</h4>\r\n\r\n<ul>\r\n    <li>Thiết kế sang trọng, lắp đặt âm giúp tiết kiệm diện tích.</li>\r\n    <li>2 vùng nấu tiện lợi, hỗ trợ nấu nhiều món cùng lúc.</li>\r\n    <li>Chức năng PowerBoost giúp gia nhiệt nhanh, nấu ăn hiệu quả.</li>\r\n    <li>Hẹn giờ thông minh, chủ động thời gian nấu.</li>\r\n    <li>Bảng điều khiển cảm ứng trượt dễ thao tác.</li>\r\n    <li>Mặt kính Ceramic - Eurokera bền bỉ, dễ vệ sinh.</li>\r\n    <li>Chức năng Stop+Go tiện lợi khi cần tạm dừng.</li>\r\n    <li>Tích hợp nhiều tính năng an toàn như khóa trẻ em, cảnh báo nhiệt dư, tự ngắt khi quá nhiệt...</li>\r\n</ul>\r\n\r\n<h4>THIẾT KẾ: SANG TRỌNG – HIỆN ĐẠI</h4>\r\n\r\n<p><strong>Kiểu dáng tinh tế</strong><br>\r\nBếp từ âm Electrolux sở hữu thiết kế hiện đại với gam màu trang nhã, dễ dàng phù hợp với nhiều không gian bếp khác nhau, mang lại vẻ đẹp sang trọng và gọn gàng.\r\n</p>\r\n\r\n<p><strong>Mặt kính cao cấp</strong><br>\r\nBề mặt bếp được làm từ kính Ceramic - Eurokera bền bỉ, chịu lực, chịu nhiệt tốt và hạn chế trầy xước. Đồng thời, mặt kính luôn sáng bóng, ít bám bẩn và dễ dàng lau chùi sau khi sử dụng.\r\n</p>\r\n\r\n<h4>TIỆN ÍCH & CƠ CHẾ HOẠT ĐỘNG</h4>\r\n\r\n<p><strong>Hai vùng nấu độc lập</strong><br>\r\nBếp được trang bị 2 vùng nấu riêng biệt, cho phép người dùng chế biến nhiều món ăn cùng lúc một cách tiện lợi và tiết kiệm thời gian.\r\n</p>\r\n\r\n<p><strong>Gia nhiệt nhanh với PowerBoost</strong><br>\r\nChức năng PowerBoost giúp tăng cường công suất, làm nóng nhanh, rút ngắn thời gian nấu nướng và nâng cao hiệu quả sử dụng.\r\n</p>\r\n\r\n<p><strong>Hẹn giờ thông minh</strong><br>\r\nNgười dùng có thể cài đặt thời gian nấu linh hoạt, giúp rảnh tay làm việc khác mà không lo món ăn bị cháy khét.\r\n</p>\r\n\r\n<p><strong>Chức năng Stop+Go</strong><br>\r\nCho phép tạm thời giảm công suất xuống mức thấp khi cần, giúp tránh trào khi nấu và dễ dàng tiếp tục quá trình nấu sau đó.\r\n</p>\r\n\r\n<h4>TÍNH NĂNG AN TOÀN</h4>\r\n\r\n<p><strong>Khóa trẻ em</strong><br>\r\nGiúp vô hiệu hóa bảng điều khiển, tránh việc thay đổi cài đặt ngoài ý muốn và đảm bảo an toàn cho gia đình có trẻ nhỏ.\r\n</p>\r\n\r\n<p><strong>Cảnh báo nhiệt dư</strong><br>\r\nHiển thị cảnh báo khi mặt bếp còn nóng, giúp người dùng tránh bị bỏng khi vô tình chạm phải.\r\n</p>\r\n\r\n<p><strong>Tự ngắt an toàn</strong><br>\r\nBếp sẽ tự động ngắt khi quá nhiệt hoặc khi không có nồi, giúp tăng độ bền và đảm bảo an toàn trong quá trình sử dụng.\r\n</p>\r\n\r\n<h4>BẢNG ĐIỀU KHIỂN</h4>\r\n\r\n<p>\r\nBếp được trang bị bảng điều khiển cảm ứng hiện đại, nhạy bén giúp người dùng dễ dàng thao tác như điều chỉnh công suất, hẹn giờ, kích hoạt Booster, khóa trẻ em hoặc tạm dừng nấu một cách nhanh chóng và thuận tiện.\r\n</p>', 24, 200, 1),
(32, 5, 'Bếp hồng ngoại đơn Sunhouse SHD6006A 2000W', 24, 'P32_avt.jpg', 4.7, '<div class=\"product-description\">\r\n    <h2>Bếp hồng ngoại đơn Sunhouse SHD6006A 2000W</h2>\r\n\r\n    <p>\r\n        Bếp hồng ngoại đơn <strong>Sunhouse SHD6006A</strong> sở hữu thiết kế hiện đại, nhỏ gọn \r\n        cùng công suất mạnh mẽ 2000W giúp nấu ăn nhanh chóng và tiện lợi. \r\n        Sản phẩm phù hợp với nhiều không gian như căn hộ nhỏ, phòng trọ, gia đình ít người \r\n        hoặc sử dụng cho các bữa ăn tại bàn.\r\n    </p>\r\n\r\n    <h3>Đặc điểm nổi bật</h3>\r\n    <ul>\r\n        <li>Công suất lớn 2000W giúp làm nóng nhanh, tiết kiệm thời gian nấu nướng</li>\r\n        <li>Bảng điều khiển cảm ứng hiện đại với ký hiệu trực quan, dễ thao tác</li>\r\n        <li>Chức năng hẹn giờ linh hoạt giúp chủ động thời gian chế biến món ăn</li>\r\n        <li>Thiết kế nhỏ gọn, dễ bố trí trong nhiều không gian sử dụng</li>\r\n        <li>Mặt bếp dễ vệ sinh sau khi nấu</li>\r\n        <li>Tích hợp nhiều tính năng an toàn bảo vệ người dùng và thiết bị</li>\r\n        <li>Tự động ngắt khi điện áp quá cao hoặc quá thấp</li>\r\n        <li>Trang bị mạch bảo vệ IGBT giúp tăng độ bền cho bếp</li>\r\n        <li>Tự ngắt khi bếp hoạt động quá tải nhiệt</li>\r\n        <li>Thương hiệu Sunhouse uy tín của Việt Nam</li>\r\n    </ul>\r\n\r\n    <h3>Thiết kế hiện đại, tiện dụng</h3>\r\n    <p>\r\n        Bếp hồng ngoại Sunhouse SHD6006A có kiểu dáng gọn gàng với gam màu sang trọng, \r\n        phù hợp với nhiều phong cách không gian bếp. Bảng điều khiển cảm ứng hiện đại \r\n        giúp thao tác nhanh chóng và dễ dàng hơn trong quá trình sử dụng.\r\n    </p>\r\n\r\n    <h3>Nấu ăn nhanh chóng, linh hoạt</h3>\r\n    <p>\r\n        Với công suất lên đến 2000W, bếp giúp làm nóng nhanh và hỗ trợ chế biến đa dạng món ăn \r\n        như chiên, xào, nấu canh, đun nước hoặc nướng thực phẩm tiện lợi. \r\n        Chức năng hẹn giờ hỗ trợ người dùng chủ động hơn khi nấu nướng.\r\n    </p>\r\n\r\n    <h3>An toàn khi sử dụng</h3>\r\n    <p>\r\n        Sản phẩm được tích hợp nhiều tính năng an toàn như tự ngắt khi điện áp không ổn định, \r\n        tự ngắt khi quá nhiệt và mạch bảo vệ IGBT giúp bảo vệ linh kiện bên trong, \r\n        nâng cao tuổi thọ cho bếp và đảm bảo an toàn cho người dùng.\r\n    </p>\r\n\r\n    <h3>Lưu ý sử dụng</h3>\r\n    <p>\r\n        Nên đặt bếp trên bề mặt phẳng, khô ráo và tránh để nước tràn vào khu vực điều khiển. \r\n        Sau khi sử dụng, hãy đợi mặt bếp nguội hoàn toàn rồi mới tiến hành vệ sinh để đảm bảo an toàn.\r\n    </p>\r\n</div>', 24, 1000, 1),
(33, 5, 'Bếp hồng ngoại đơn Pramie PRTH-1000 2200W\r\n\r\n\r\n\r\n', 16, 'P33_avt.jpg', 4.3, '<div class=\"product-description\">\r\n    <h2>Bếp hồng ngoại đơn Pramie PRTH-1000 2200W</h2>\r\n\r\n    <p>\r\n        Bếp hồng ngoại đơn <strong>Pramie PRTH-1000</strong> sở hữu thiết kế nhỏ gọn, \r\n        hiện đại cùng công nghệ Inverter thông minh giúp nấu ăn nhanh, giữ nhiệt ổn định \r\n        và tiết kiệm điện hiệu quả. Sản phẩm phù hợp cho gia đình nhỏ, người sống một mình \r\n        hoặc dùng làm bếp phụ tiện lợi.\r\n    </p>\r\n\r\n    <h3>Đặc điểm nổi bật</h3>\r\n    <ul>\r\n        <li>Ứng dụng công nghệ Inverter giúp tiết kiệm điện năng hiệu quả</li>\r\n        <li>Duy trì nhiệt ổn định ở mức công suất thấp, phù hợp nấu liu riu</li>\r\n        <li>Mặt kính Ceramic Kanger sáng bóng, bền đẹp và dễ vệ sinh</li>\r\n        <li>Thiết kế nhỏ gọn, dễ dàng di chuyển và bố trí trong nhiều không gian</li>\r\n        <li>Sử dụng được với nhiều loại nồi chảo khác nhau</li>\r\n        <li>Bảng điều khiển cảm ứng nhạy bén, có màn hình LED hiển thị rõ ràng</li>\r\n        <li>Tích hợp nhiều chế độ nấu tiện lợi cho nhu cầu hằng ngày</li>\r\n        <li>Chức năng hẹn giờ hỗ trợ nấu nướng linh hoạt</li>\r\n        <li>Khóa trẻ em giúp tăng độ an toàn khi sử dụng</li>\r\n        <li>Tự động ngắt khi quá nhiệt hoặc khi nước tràn vào bảng điều khiển</li>\r\n        <li>Cảnh báo mặt bếp nóng giúp hạn chế nguy cơ bỏng</li>\r\n        <li>Thương hiệu Pramie công nghệ Đức, sản xuất tại Thái Lan</li>\r\n    </ul>\r\n\r\n    <h3>Công nghệ Inverter tiết kiệm điện</h3>\r\n    <p>\r\n        Bếp được trang bị công nghệ Inverter hiện đại giúp tối ưu điện năng tiêu thụ \r\n        và duy trì mức nhiệt ổn định trong suốt quá trình nấu. \r\n        Điều này đặc biệt phù hợp với các món hầm, ninh hoặc kho cần đun ở mức nhiệt thấp liên tục.\r\n    </p>\r\n\r\n    <h3>Thiết kế hiện đại, tiện dụng</h3>\r\n    <p>\r\n        Pramie PRTH-1000 có kiểu dáng nhỏ gọn với các góc bo cong mềm mại, \r\n        phù hợp với nhiều không gian bếp khác nhau. \r\n        Mặt kính Ceramic Kanger màu đen sang trọng không chỉ tăng tính thẩm mỹ \r\n        mà còn dễ lau chùi sau khi sử dụng.\r\n    </p>\r\n\r\n    <h3>Bảng điều khiển cảm ứng dễ sử dụng</h3>\r\n    <p>\r\n        Bảng điều khiển cảm ứng kết hợp màn hình LED hiển thị trực quan, \r\n        giúp người dùng dễ dàng thao tác và lựa chọn các chế độ nấu phù hợp chỉ với vài lần chạm nhẹ.\r\n    </p>\r\n\r\n    <h3>Nấu nướng linh hoạt</h3>\r\n    <p>\r\n        Sản phẩm tích hợp nhiều chế độ nấu tiện lợi như hấp, đun nóng, nướng, giữ ấm, lẩu và xào, \r\n        đáp ứng đa dạng nhu cầu chế biến món ăn hằng ngày. \r\n        Ngoài ra, chức năng hẹn giờ giúp người dùng chủ động hơn trong quá trình nấu nướng.\r\n    </p>\r\n\r\n    <h3>An toàn khi sử dụng</h3>\r\n    <p>\r\n        Bếp hồng ngoại Pramie PRTH-1000 được trang bị nhiều tính năng an toàn như \r\n        khóa trẻ em, cảnh báo mặt bếp nóng, tự động ngắt khi quá nhiệt hoặc khi nước tràn vào bảng điều khiển, \r\n        giúp bảo vệ thiết bị và người dùng trong quá trình sử dụng.\r\n    </p>\r\n</div>', 24, 1000, 1),
(34, 15, 'Bếp khè ga công nghiệp NaMilux NA-196 (có van)', 45, 'P34_avt.jpg', 4, '<div class=\"product-description\">\r\n    <h2>Bếp khè ga công nghiệp NaMilux NA-196 (có van)</h2>\r\n\r\n    <p>\r\n        Bếp khè ga công nghiệp <strong>NaMilux NA-196</strong> là lựa chọn phù hợp \r\n        cho nhà hàng, quán ăn, bếp ăn tập thể và các khu vực chế biến thực phẩm cần \r\n        hiệu suất nấu nướng cao. Sản phẩm nổi bật với thiết kế chắc chắn, ngọn lửa mạnh \r\n        cùng khả năng tiết kiệm gas hiệu quả.\r\n    </p>\r\n\r\n    <h3>Đặc điểm nổi bật</h3>\r\n    <ul>\r\n        <li>Thiết kế gang đúc nguyên khối chắc chắn, chịu nhiệt tốt và bền bỉ</li>\r\n        <li>Ngọn lửa lớn, mạnh mẽ giúp nấu ăn nhanh chóng</li>\r\n        <li>Tiết kiệm gas hiệu quả nhờ đầu đốt tạo lửa xanh</li>\r\n        <li>Hệ thống đánh lửa Magneto lên lửa nhanh, không cần dùng pin</li>\r\n        <li>Dễ dàng điều chỉnh mức lửa phù hợp với từng món ăn</li>\r\n        <li>Phù hợp cho nhà hàng, quán ăn, bếp công nghiệp và tiệc lớn</li>\r\n        <li>Thiết kế chắc chắn giúp hoạt động ổn định trong thời gian dài</li>\r\n        <li>Thương hiệu NaMilux uy tín, được nhiều người tin dùng</li>\r\n    </ul>\r\n\r\n    <h3>Thiết kế bền bỉ, chắc chắn</h3>\r\n    <p>\r\n        Bếp được làm từ gang đúc nguyên khối giúp tăng khả năng chịu lực và chịu nhiệt cao. \r\n        Thiết kế cứng cáp giúp sản phẩm hoạt động ổn định trong môi trường nấu nướng liên tục \r\n        với cường độ lớn.\r\n    </p>\r\n\r\n    <h3>Ngọn lửa mạnh, nấu ăn nhanh</h3>\r\n    <p>\r\n        NaMilux NA-196 tạo ra ngọn lửa lớn và tập trung, hỗ trợ chế biến món ăn nhanh chóng, \r\n        đặc biệt phù hợp với các món chiên, xào hoặc nấu với nhiệt độ cao.\r\n    </p>\r\n\r\n    <h3>Tiết kiệm gas hiệu quả</h3>\r\n    <p>\r\n        Hệ thống đầu đốt được thiết kế tối ưu giúp tạo lửa xanh ổn định, \r\n        hạn chế thất thoát nhiệt và tiết kiệm nhiên liệu trong quá trình sử dụng.\r\n    </p>\r\n\r\n    <h3>Đánh lửa Magneto tiện lợi</h3>\r\n    <p>\r\n        Bếp sử dụng hệ thống đánh lửa Magneto hiện đại giúp thao tác bật bếp nhanh chóng, \r\n        ổn định và không cần thay pin như các hệ thống đánh lửa thông thường.\r\n    </p>\r\n\r\n    <h3>Ứng dụng đa dạng</h3>\r\n    <p>\r\n        Sản phẩm thích hợp sử dụng tại nhà hàng, quán ăn, khách sạn, bếp ăn công nghiệp \r\n        hoặc các buổi tiệc lớn cần chế biến món ăn với số lượng nhiều trong thời gian ngắn.\r\n    </p>\r\n</div>', 199, 123, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(35, 21, 'Bình đun siêu tốc Sunhouse 1.8 lít SHD1353', 24, 'P35_avt.jpg', 4.2, '<div class=\"product-description\">\r\n    <h2>Bình đun siêu tốc Sunhouse 1.8 lít SHD1353 thiết kế hiện đại, màu sắc trang nhã</h2>\r\n\r\n    <p>\r\n        Bình đun siêu tốc Sunhouse SHD1353 sở hữu kiểu dáng hình trụ hiện đại \r\n        cùng tông màu xanh pastel nhẹ nhàng, giúp không gian bếp trở nên nổi bật và tinh tế hơn.\r\n    </p>\r\n\r\n    <h3>Thiết kế 2 lớp an toàn, bền bỉ</h3>\r\n    <p>\r\n        Ruột bình được làm từ inox 304 giúp hạn chế gỉ sét, đảm bảo an toàn sức khỏe \r\n        và dễ dàng vệ sinh sau khi sử dụng. Phần vỏ ngoài bằng nhựa PP cách nhiệt \r\n        giúp hạn chế bỏng tay khi chạm vào bình lúc nước đang sôi.\r\n    </p>\r\n\r\n    <h3>Dung tích phù hợp cho gia đình</h3>\r\n    <p>\r\n        Bình có dung tích 1.8 lít đáp ứng tốt nhu cầu pha trà, pha cà phê, nấu mì \r\n        hoặc chuẩn bị nước nóng cho gia đình từ 2 - 4 người.\r\n    </p>\r\n\r\n    <h3>Đun nước nhanh chóng, tiện lợi</h3>\r\n    <p>\r\n        Bình hoạt động với công suất mạnh mẽ giúp nước nhanh đạt nhiệt độ sôi, \r\n        tiết kiệm thời gian cho người sử dụng. Công tắc On/Off được bố trí ngay trên tay cầm \r\n        giúp thao tác bật tắt dễ dàng và thuận tiện.\r\n    </p>\r\n\r\n    <h3>Dễ quan sát khi sử dụng</h3>\r\n    <p>\r\n        Đèn báo hoạt động hiển thị rõ ràng trong quá trình đun nước. \r\n        Ngoài ra, cột hiển thị mực nước trên thân bình giúp người dùng \r\n        dễ dàng theo dõi và châm lượng nước phù hợp.\r\n    </p>\r\n\r\n    <h3>Đế xoay 360 độ linh hoạt</h3>\r\n    <p>\r\n        Thiết kế đế tiếp điện xoay 360 độ giúp người dùng dễ dàng nhấc lên, \r\n        đặt xuống ở nhiều góc khác nhau, tăng sự tiện lợi trong quá trình sử dụng.\r\n    </p>\r\n\r\n    <h3>Lưới lọc tiện dụng</h3>\r\n    <p>\r\n        Bình được trang bị lưới lọc giúp giữ lại cặn bã trà hoặc hạn chế côn trùng xâm nhập, \r\n        đảm bảo nguồn nước sạch hơn khi sử dụng.\r\n    </p>\r\n\r\n    <h3>Tích hợp nhiều tính năng an toàn</h3>\r\n    <p>\r\n        Sản phẩm có khả năng tự ngắt khi nước sôi, tự ngắt khi quá nhiệt \r\n        hoặc khi cạn nước nhằm tăng độ bền cho thiết bị và đảm bảo an toàn trong quá trình sử dụng.\r\n    </p>\r\n\r\n    <h3>Mẹo sử dụng bình đun siêu tốc bền lâu</h3>\r\n    <p>\r\n        Không mở nắp khi đang đun nước. Châm nước đúng mức quy định trên thân bình, \r\n        tránh để quá đầy hoặc quá ít nước. Nên vệ sinh bình thường xuyên \r\n        để hạn chế đóng cặn và không nên để nước thừa lâu trong bình.\r\n    </p>\r\n\r\n    <p>\r\n        Bình đun siêu tốc Sunhouse 1.8 lít SHD1353 là lựa chọn phù hợp \r\n        cho nhu cầu sử dụng nước nóng hằng ngày với thiết kế đẹp mắt, \r\n        tiện lợi và an toàn cho gia đình.\r\n    </p>\r\n</div>', 24, 1000, 1),
(36, 12, 'Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A17 10 lõi', 14, 'P36_avt.jpg', 4, '<div class=\"product-description\">\r\n    <h2>Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A17 thiết kế hiện đại, đáp ứng đa dạng nhu cầu sử dụng</h2>\r\n\r\n    <p>\r\n        Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A17 sở hữu thiết kế tủ đứng sang trọng, \r\n        phù hợp với nhiều không gian như phòng khách, phòng bếp, văn phòng làm việc,...\r\n    </p>\r\n\r\n    <h3>Thiết kế tiện lợi, dễ sử dụng</h3>\r\n    <p>\r\n        Sản phẩm được trang bị hệ thống lấy nước bằng nút vặn tiện thao tác cùng 2 vòi riêng biệt \r\n        cho phép sử dụng linh hoạt các chế độ nước nóng, nguội và lạnh theo nhu cầu hằng ngày.\r\n    </p>\r\n\r\n    <h3>Cung cấp nhiều chế độ nước tiện dụng</h3>\r\n    <p>\r\n        Máy hỗ trợ 3 chế độ nước nóng - nguội - lạnh giúp người dùng dễ dàng pha trà, cà phê, sữa, \r\n        nấu mì hoặc giải khát nhanh chóng mà không cần chờ đun nước.\r\n    </p>\r\n\r\n    <h3>Hệ thống lọc RO hiện đại</h3>\r\n    <p>\r\n        Trang bị màng lọc RO Vortex giúp loại bỏ hiệu quả bụi bẩn, vi khuẩn, kim loại nặng \r\n        và nhiều tạp chất có hại trong nước, mang lại nguồn nước sạch an toàn cho gia đình.\r\n    </p>\r\n\r\n    <h3>Công nghệ kháng khuẩn Nano Silver</h3>\r\n    <p>\r\n        Công nghệ Nano Silver hỗ trợ hạn chế vi khuẩn phát triển trong nguồn nước, \r\n        góp phần nâng cao chất lượng nước sau lọc và bảo vệ sức khỏe người dùng.\r\n    </p>\r\n\r\n    <h3>Hệ thống nhiều lõi lọc bổ sung khoáng chất</h3>\r\n    <p>\r\n        Máy được tích hợp nhiều lõi chức năng giúp bổ sung khoáng chất cần thiết, \r\n        hỗ trợ cân bằng pH, tạo nước kiềm nhẹ và cải thiện hương vị nước uống.\r\n    </p>\r\n\r\n    <h3>Tiện ích thông minh</h3>\r\n    <p>\r\n        Sản phẩm có các tính năng tiện lợi như tự động xả nước thải, ngừng hoạt động khi áp lực nước thấp \r\n        và hỗ trợ tạo nước kiềm giúp nâng cao trải nghiệm sử dụng hằng ngày.\r\n    </p>\r\n\r\n    <h3>An toàn và tiết kiệm</h3>\r\n    <p>\r\n        Nguồn nước sau lọc có thể sử dụng trực tiếp mà không cần đun sôi, \r\n        giúp tiết kiệm thời gian và chi phí sử dụng nước đóng chai cho gia đình.\r\n    </p>\r\n\r\n    <p>\r\n        Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A17 là lựa chọn phù hợp cho gia đình \r\n        cần nguồn nước sạch tiện lợi, đa chức năng và hỗ trợ chăm sóc sức khỏe mỗi ngày.\r\n    </p>\r\n</div>', 24, 800, 1),
(37, 13, 'Quạt điều hòa Kangaroo KG50F100 110W', 14, 'P37_avt.jpg', 4.5, '<div class=\"product-description\">\r\n    <h2>Quạt điều hòa Kangaroo KG50F100 110W – Giải pháp làm mát hiệu quả cho không gian rộng</h2>\r\n\r\n    <p>\r\n        Quạt điều hòa Kangaroo KG50F100 110W sở hữu thiết kế hiện đại cùng khả năng làm mát mạnh mẽ, \r\n        phù hợp sử dụng cho phòng khách, quán ăn, văn phòng hay không gian có diện tích khoảng 35m².\r\n    </p>\r\n\r\n    <h3>Thiết kế sang trọng, di chuyển tiện lợi</h3>\r\n    <p>\r\n        Sản phẩm nổi bật với gam màu trắng thanh lịch kết hợp mặt kính cường lực bền bỉ, \r\n        dễ dàng hài hòa với nhiều phong cách nội thất khác nhau.\r\n    </p>\r\n\r\n    <p>\r\n        Quạt được trang bị bánh xe chắc chắn giúp người dùng thuận tiện di chuyển giữa nhiều vị trí sử dụng \r\n        mà không tốn nhiều công sức.\r\n    </p>\r\n\r\n    <h3>Làm mát nhanh với công suất 110W</h3>\r\n    <p>\r\n        Hoạt động với công suất 110W cùng lưu lượng gió lớn lên đến 4500 m³/h, \r\n        quạt giúp không gian trở nên mát mẻ nhanh chóng nhưng vẫn tiết kiệm điện năng hiệu quả.\r\n    </p>\r\n\r\n    <p>\r\n        Cửa gió 3D kết hợp khả năng đảo gió tự động trái – phải giúp luồng không khí phân bổ đồng đều khắp phòng, \r\n        mang lại cảm giác dễ chịu cho người dùng.\r\n    </p>\r\n\r\n    <h3>Trang bị 2 viên đá khô tăng hiệu quả làm mát</h3>\r\n    <p>\r\n        Quạt điều hòa Kangaroo KG50F100 đi kèm 2 viên đá khô hỗ trợ làm lạnh sâu hơn. \r\n        Người dùng chỉ cần làm lạnh đá trong ngăn đông tủ lạnh rồi cho vào bình nước để tăng cường hơi mát.\r\n    </p>\r\n\r\n    <h3>Bình chứa nước dung tích lớn</h3>\r\n    <p>\r\n        Dung tích bình nước 35 lít cho phép quạt hoạt động liên tục trong thời gian dài, \r\n        hạn chế việc châm nước nhiều lần trong ngày.\r\n    </p>\r\n\r\n    <h3>Hoạt động êm ái, dễ sử dụng</h3>\r\n    <p>\r\n        Độ ồn tối đa ≤50 dB giúp quạt vận hành tương đối êm ái, phù hợp cho không gian sinh hoạt, học tập và nghỉ ngơi.\r\n    </p>\r\n\r\n    <p>\r\n        Quạt được trang bị 3 tốc độ gió cùng chế độ gió thường ổn định, \r\n        đáp ứng linh hoạt nhu cầu làm mát khác nhau của người dùng.\r\n    </p>\r\n\r\n    <h3>Bảng điều khiển trực quan</h3>\r\n    <p>\r\n        Hệ thống điều khiển bằng núm xoay kết hợp nút nhấn đơn giản, \r\n        giúp thao tác điều chỉnh tốc độ và chế độ quạt nhanh chóng, dễ sử dụng cho mọi đối tượng.\r\n    </p>\r\n\r\n    <h3>Nhiều tiện ích an toàn</h3>\r\n    <p>\r\n        Quạt tích hợp tính năng tự ngắt bơm khi cạn nước nhằm bảo vệ động cơ và tăng độ bền cho sản phẩm.\r\n    </p>\r\n\r\n    <p>\r\n        Ngoài ra, thiết bị còn có thang hiển thị mực nước giúp người dùng dễ dàng theo dõi và châm nước khi cần thiết.\r\n    </p>\r\n\r\n    <p>\r\n        Quạt điều hòa Kangaroo KG50F100 110W là lựa chọn lý tưởng cho gia đình cần một thiết bị làm mát mạnh mẽ, \r\n        tiết kiệm điện, vận hành ổn định và tích hợp nhiều tiện ích hữu ích cho cuộc sống hằng ngày.\r\n    </p>\r\n</div>', 24, 200, 1),
(38, 9, 'Nồi chiên không dầu Sunhouse SHD4062 6 lít', 24, 'P38_avt.jpg', 5, '<h3>Nồi chiên không dầu Sunhouse&nbsp;với dung tích sử dụng 5.5\n    lít có thể chiên gà vịt nguyên con khoảng 1.5 kg</h3>\n<p>Dung tích sử dụng lớn, phù hợp cho các gia đình đông người tầm 4 - 6 người thường xuyên nấu nướng, chế biến đa dạng\n    món ngon.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-8a.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 5.5 lít - Dung tích sử dụng\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-8a.jpg\"\n             title=\"Nồi chiên không dầu Sunhouse SHD4062 5.5 lít - Dung tích sử dụng\"></a></p>\n<h3>Hoạt động mạnh mẽ với công suất 1600W, công nghệ Rapid Air&nbsp;giúp cho thức ăn chín nhanh, giòn bên ngoài, mềm bên\n    trong</h3>\n<p>Sử dụng nồi chiên không dầu giúp chiên nướng thực phẩm giảm đến 80% chất béo, bảo vệ sức khỏe gia đình.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-b.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 - Dung tích sử dụng\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-b.jpg\" \n            title=\"Nồi chiên không dầu Sunhouse SHD4062 - Dung tích sử dụng\"></a></p>\n<h3>Lòng nồi bằng thép phủ chống dính bền tốt, an toàn khi nấu, hạn chế dính cháy, dễ dàng vệ sinh</h3>\n<p>Lòng nồi có thể sử dụng được với máy rửa chén, thuận tiện vệ sinh sau khi chiên nướng.&nbsp;</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit637926342256156195-1020x570.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 6 lít - Chất liệu\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit637926342256156195-1020x570.jpg\"\n             title=\"Nồi chiên không dầu Sunhouse SHD4062 6 lít - Chất liệu\"></a>\n</p>\n<h3>Bảng điều khiển nút\n        xoay đơn giản, tiện thao tác</h3>\n<p>Điều chỉnh được nhiệt độ trong khoảng 100 - 200 °C, thời gian 0 - 30 phút, phù hợp với hầu hết các món chiên nướng cơ\n    bản.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-070722-113113.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 - Bảng điều khiển\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-070722-113113.jpg\"\n             title=\"Nồi chiên không dầu Sunhouse SHD4062 - Bảng điều khiển\"></a></p>\n<h3>Thiết kế màu đen trung tính, chất liệu bền bỉ, an toàn, dễ lau chùi sau khi sử dụng</h3>\n<p>Thiết kế sang trọng với mặt trước thân nồi cấu tạo từ inox 304 cao cấp có độ bóng bề mặt cao, chịu lực chịu nhiệt\n    tốt, chống trầy xước. Phần còn lại của thân nồi bằng nhựa PP bền bỉ, dễ dàng vệ sinh để có vẻ bề ngoài luôn như mới.\n</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-2a-1.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 5.5 lít - Thiết kế\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-2a-1.jpg\" \n            title=\"Nồi chiên không dầu Sunhouse SHD4062 5.5 lít - Thiết kế\"></a></p>\n<h3>Nồi\n        chiên không dầu&nbsp;tự ngắt khi quá nhiệt, tự ngắt&nbsp;khi thức ăn chín giúp&nbsp;đảm bảo an toàn cho\n    thiết bị và nguồn điện</h3>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-070722-113109.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 - Tiện ích\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-070722-113109.jpg\"\n            title=\"Nồi chiên không dầu Sunhouse SHD4062 - Tiện ích\"></a></p>\n<p><strong>Lưu ý khi sử dụng:</strong></p>\n<p>- Xem kỹ hướng dẫn của nhà sản xuất trước khi sử dụng.</p>\n<p>- Nên đặt nồi ngay ngắn trên mặt bàn, kệ rồi mới vận hành.</p>\n<p>- Không dùng búi sắt để cọ rửa lòng nồi, tránh bị trầy xước.&nbsp;</p>\n<p>Nồi chiên không dầu Sunhouse SHD4062 6 lít của thương\n    hiệu Việt Nam - Sunhouse, thiết kế hiện đại, dung tích lớn 6 lít, công nghệ chiên không dầu&nbsp;Rapid Air, công\n    suất&nbsp;1600W, hẹn giờ 30 phút, chuẩn bị món ăn ngon, ít béo nhanh chóng, tiện dụng trong mọi gia đình.&nbsp;</p>', 24, 200, 1),
(39, 9, 'Nồi chiên không dầu Sunhouse SHD4035 9 lít', 24, 'P39_avt.jpg', 4, '<p><em><strong>Nồi chiên không dầu\n</strong></em><strong><i>Sunhouse SHD4035 9 lít</i></strong>&nbsp;<em><strong>được trang bị công nghệ\nlàm nóng Rapid Air,</strong></em><i><strong><em><strong>&nbsp;</strong></em>công suất 1800W, dung tích sử\ndụng 9 lít, bảng điều khiển nút xoay dễ sử dụng, tự ngắt khi quá nhiệt, có quạt đối lưu,... là thiết bị hữu\ních giúp bạn chế biến nhiều món chiên rán hạn chế dầu mỡ cho gia đình.</strong></i></p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-1a.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 - Tổng quan\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-1a.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 - Tổng quan\"></a></p>\n<h3>Dung tích - Công suất</h3>\n<p>- Dung tích tổng 9.5 lít, dung tích sử dụng 9 lít, chiên được gà nguyên con khoảng 1.5 kg.</p>\n<p>- Công suất 1800W giúp chiên nướng thực phẩm nhanh chóng, tiết kiệm tối đa thời gian nấu nướng cho các bà nội trợ.\n</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-6a.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Dung tích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-6a.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Dung tích\"></a></p>\n<h3>Công nghệ chiên, nướng - Nhiệt độ, thời gian</h3>\n<p>- Công nghệ làm nóng&nbsp;Rapid Air, chế biến thức ăn chín đều các mặt bên\nngoài, chín mềm phần thịt bên trong.&nbsp;</p>\n<p>- Nhiệt độ nồi có thể điều chỉnh từ 100 - 200°C, thời gian từ 0 - 30 phút, dễ dàng điều chỉnh thông số phù hợp với\nnhiều nguyên liệu nấu ăn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-2a.gif\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 - Công nghệ\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-2a.gif\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 - Công nghệ\"></a></p>\n<h3>Thiết kế, chất liệu của sản phẩm</h3>\n<p>- Vỏ ngoài làm bằng inox 304 và nhựa P cao cấp, bền tốt, an toàn, dễ lau chùi.</p>\n<p>- Lòng nồi thép phủ chống dính bền bỉ, chống bám bẩn, dễ lau chùi, an toàn cho sức khoẻ.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/vi-vn-sunhouse-shd4035-9-lit-4a.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Chất liệu\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/vi-vn-sunhouse-shd4035-9-lit-4a.jpg\"\n title=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Chất liệu\"></a></p>\n<h3>Bảng điều khiển</h3>\n<p>- Bảng điều khiển cơ với các nút\nxoay đơn giản, có đèn báo trạng thái hoạt động,&nbsp;dễ dàng sử dụng.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-3a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 - Bảng điều khiển\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-3a-1.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 - Bảng điều khiển\"></a></p>\n<h3>Tiện ích</h3>\n<p>- Trang bị&nbsp;quạt đối lưu giúp khí\nnóng tỏa đều lòng nồi, cho ra thực phẩm chín đều các mặt.</p>\n<p>- Tự động ngắt khi quá nhiệt, đảm bảo an toàn tối đa cho người sử dụng.&nbsp;</p>\n<p>- Nồi chiên không dầu có\nđèn báo hoạt động để người dùng tiện theo dõi tình trạng nấu nướng của nồi.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-5a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-5a-1.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 - Tiện ích\"></a></p>\n<h3>Phụ kiện đi kèm</h3>\n<p>- Vỉ tách dầu.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-5a.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Vỉ tách dầu\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-5a.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Vỉ tách dầu\"></a></p>\n<h3>Cách vệ sinh thiết bị&nbsp;</h3>\n<p>- Không được ngâm dây nguồn, phích cắm trong nước hoặc bất kỳ chất lỏng khác.</p>\n<p>- Vệ sinh sau mỗi lần sử dụng.</p>\n<p>- Sử dụng vải mềm hoặc bàn chải nhà bếp có lông mềm để loại bỏ những thức ăn cứng đầu. Không dùng miếng sắt cứng hoặc\nvật cứng vì chúng sẽ làm hỏng lớp chống dính.</p>\n<p>- Không sử dụng các chất tẩy rửa thô hoặc có tính mài mòn. Mặt bên ngoài có thể lau sạch bằng vải mềm và ẩm.</p>\n<p>- Có thể ngâm các phụ kiện chiên nướng vào nước để dễ dàng loại bỏ mảng bám dính nếu có.</p>\n<p>- Làm sạch thanh gia nhiệt bằng bàn chải mềm để loại bỏ những mảnh vụn thức ăn.</p>\n<p><em>Nồi chiên không\ndầu&nbsp;</em><i>Sunhouse&nbsp;SHD4035 9 lít,\nmàu đen hiện đại, thích hợp sử dụng trong gian bếp gia đình, là thiết bị hữu ích đối với những bà nội trợ đam mê\nlàm bánh hoặc những người yêu thích đồ ăn chiên rán vừa thơm ngon lại vừa hạn chế dầu mỡ.</i></p>', 24, 200, 1),
(40, 9, 'Nồi chiên không dầu BlueStone AFB-5878 5.5 lít ', 13, 'P40_avt.jpg', 4, '<h3>Nồi chiên không dầu\n    BlueStone&nbsp;mang thiết kế hiện đại, sang trọng với kiểu dáng lạ mắt</h3>\n<p>Vỏ nhựa PP nhám bền bỉ, cách nhiệt và mặt trước viền inox sáng bóng, chống trầy tốt, mới lâu.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054006.jpg\"\n    onclick=\"return false;\"><img alt=\"Sang trọng - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054006.jpg\"\n         title=\"Sang trọng - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<h3>Dung tích tổng 6.5 lít,&nbsp;dung tích sử\n    dụng 5.5 lít có thể chiên nướng dễ dàng khoảng 2 - 3 miếng sườn 0.5 kg cùng lúc</h3>\n<p>Ngoài ra, bạn còn có thể dùng nồi chiên không dầu để chế biến các món như khoai tây chiên, gà rán, làm bánh… đa dạng\nbữa ăn gia đình.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-051721-031722-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Dung tích sử dụng 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-051721-031722-1.jpg\"\n        title=\"Dung tích sử dụng 5.5 lít\"></a></p>\n<h3>Khay hứng dầu và rổ chiên chống dính tiện dụng, rổ chiên chất liệu hợp kim nhôm với lớp chống dính Greblon cao cấp\n</h3>\n<p>Giúp nồi không chỉ bắt và giữ nhiệt tốt mà còn chiên nướng ngon, an toàn sức khỏe. Rổ chiên dễ tháo rời, tiện vệ sinh\nsau khi sử dụng.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-051721-031738.jpg\"\n    onclick=\"return false;\"><img alt=\"Chống dính - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-051721-031738.jpg\"\n        title=\"Chống dính - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<h3>Bảng điều\n    khiển cảm ứng nhạy bén với màn hình Led tiện theo dõi, dễ tùy chỉnh 8 chế độ nấu được cài đặt sẵn, hẹn giờ\ntối đa đến 60 phút, lựa chọn nhiệt độ chiên lên đến 200 độ C</h3>\n<p>Cho bạn chủ động hơn trong việc chuẩn bị những món ăn ngon với nồi chiên.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054030.jpg\"\n    onclick=\"return false;\"><img alt=\"Hiện đại, dễ dùng - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054030.jpg\"\n         title=\"Hiện đại, dễ dùng - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<h3>Công suất 1700W, chiên nướng ngon nhờ công nghệ Rapid Air</h3>\n<p>Công nghệ Rapid Air đối lưu hiệu quả luồng nhiệt, làm chín thực phẩm nhanh chóng mà không cần hoặc chỉ cần dùng rất\nít dầu mỡ, giảm thiểu đến 80% lượng dầu mỡ thừa so với việc chiên thực phẩm thông thường, gia tăng lợi ích bảo vệ\nsức khỏe, an tâm thưởng thức những món ngon yêu thích.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054035.jpg\"\n    onclick=\"return false;\"><img alt=\"Chiên nướng ngon - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054035.jpg\"\n         title=\"Chiên nướng ngon - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<h3>Nồi chiên không dầu có khóa nắp,\ntránh vô tình tháo lòng nồi khi đang nấu nướng, bảo vệ an toàn cho cả thiết bị và người dùng</h3>\n<p>Kết hợp với chế độ tự ngắt khi kéo rổ chiên, bạn sẽ an tâm hơn khi sử dụng nồi chiên tại gia đình.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054040.jpg\"\n    onclick=\"return false;\"><img alt=\"An toàn - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054040.jpg\"\n         title=\"An toàn - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<p><strong>Lưu ý khi sử dụng</strong></p>\n<p>- Vệ sinh nồi trước khi sử dụng lần đầu. Thường xuyên vệ sinh các bộ phận, mặt ngoài nồi để đảm bảo độ bền, an toàn\nsức khỏe suốt thời gian sử dụng.</p>\n<p>- Khi sử dụng chiên thức ăn cần lưu ý không nên chiên quá nhiều thức ăn cùng lúc thức ăn sẽ bị mềm.</p>\n<p>- Không nên chiên thức ăn quá lâu, nhiệt độ trong nồi sẽ làm khô thức ăn.</p>\n<p>Nồi chiên không dầu BlueStone AFB-5878 5.5 lít hứa\nhẹn là người bạn đồng hành lý tưởng trong gian bếp người nội trợ, vừa giúp chế biến những món ăn ngon, lại đảm bảo\ntốt hơn cho sức khỏe gia đình.</p>', 24, 100, 1),
(41, 9, 'Nồi chiên không dầu Kangaroo KG52AF1A 5 lít', 14, 'P41_avt.jpg', 4, '<h3>Nồi chiên không\n    dầu Kangaroo&nbsp;thiết kế hiện đại, gọn đẹp, tăng tính thẩm mỹ cho không gian bếp</h3>\n<p>Dung tích tổng 5 lít, dung tích sử dụng 4.5 lít, phục vụ tốt trong các gia đình có từ 4 - 6 thành viên.&nbsp;Có chân\nđế chống trượt bám chặt vào mặt bàn, kệ, đảm bảo nồi không bị nghiêng hay rung lắc, nấu ăn an toàn, hiệu quả.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-1-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Thiết kế hiện đại, gọn đẹp - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-1-1.jpg\"\n         title=\"Thiết kế hiện đại, gọn đẹp - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"></a></p>\n<h3>Sử dụng chiên, nướng thực phẩm không cần dùng dầu nên giúp giảm dầu mỡ trong thực phẩm cho món ăn chín ngon, không\nngán</h3>\n<p>Công suất lớn 2000W kết hợp công nghệ làm nóng Rapid Air giúp làm thực phẩm chín nhanh, đều.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-2-1.jpg\"\n    onclick=\"return false;\"><img\n        alt=\"Sử dụng chiên, nướng thực phẩm không cần dùng dầu - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-2-1.jpg\"\n        title=\"Sử dụng chiên, nướng thực phẩm không cần dùng dầu - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"></a></p>\n<h3>Nồi chiên không dầu&nbsp;thiết kế\nbảng điều khiển cảm ứng\nmàn hình LED hiển thị rõ ràng, quan sát dễ dàng</h3>\n<p>Điều chỉnh các mức nhiệt độ từ 80 - 200 độ C, 8 thực đơn nấu, hẹn giờ tối đa đến 60 phút dễ dàng.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-3-1.jpg\"\n    onclick=\"return false;\"><img\n        alt=\"Bảng điều khiển nút nhấn điện tử cùng đèn LED hiển thị - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-3-1.jpg\"\n        title=\"Bảng điều khiển nút nhấn điện tử cùng đèn LED hiển thị - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"></a>\n</p>\n<h3>Rổ chiên bằng kim loại bền bỉ, phủ chống dính, hạn chế thức ăn dính cháy, dễ vệ sinh</h3>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-4-1.jpg\"\n    onclick=\"return false;\"><img\n        alt=\"Khay tách dầu, khay chiên bằng kim loại bền bỉ - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-4-1.jpg\"\n        title=\"Khay tách dầu, khay chiên bằng kim loại bền bỉ - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"></a>\n</p>\n<p><strong>Sử dụng nồi chiên không dầu hiệu quả:</strong></p>\n<p>- Đặt nồi chiên không dầu ở vị trí thăng bằng, không gần các nguồn phát nhiệt cao, nguồn nước.</p>\n<p>- Không nhét thực phẩm quá đầy vào trong nồi, thức ăn sẽ không chín đều và có nguy cơ làm giảm độ bền của sản phẩm.\n</p>\n<p>- Cần để cho nồi nguội hoàn toàn rồi mới bắt đầu vệ sinh.</p>\n<p>Nồi chiên không dầu Kangaroo KG52AF1A 5 lít&nbsp;dễ\ndùng, mẫu đẹp, độ bền cao, xứng đáng có mặt trong mọi gia đình hiện đại.</p>', 24, 100, 1),
(42, 9, 'Nồi chiên không dầu Hafele AF-T5A (535.43.712) 5 lít', 40, 'P42_avt.jpg', 4, '<h3 style=\"text-align: justify;\">Nồi chiên không dầu Hafele&nbsp;thiết\n    kế trang nhã, sang trọng với vỏ nhựa - inox bóng đẹp, tăng tính thẩm mỹ cho mọi căn bếp gia đình</h3>\n<p>Dung tích sử dụng của nồi chiên&nbsp;5 lít&nbsp;có thể\n    nướng được 4 - 5 đùi gà cùng lúc.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/hafele-af-t5a-5-lit-090822-112311.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Hafele AF-T5A (535.43.712) - Dung tích sử dụng\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/hafele-af-t5a-5-lit-090822-112311.jpg\"\n            title=\"Nồi chiên không dầu Hafele AF-T5A (535.43.712) - Dung tích sử dụng\"></a></p>\n<h3>Điều khiển&nbsp;cảm ứng&nbsp;có chỉ\n    dẫn rõ ràng với màn hình hiển thị rõ nét, dễ thao tác</h3>\n<p>Điều chỉnh nhiệt độ từ 80 - 200 độ C, hẹn giờ lên đến 60 phút.</p>\n<p>Giữ cho&nbsp;nồi chiên không dầu&nbsp;dùng bền lâu và đảm\n    bảo an toàn cho mọi người với tính năng tự động ngắt khi quá nhiệt.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/bn-dk.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Bảng điều khiển hiển thị rõ các chức năng - Nồi chiên không dầu Hafele AF-T5A 5 lít\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/bn-dk.jpg\" \n            title=\"Bảng điều khiển hiển thị rõ các chức năng - Nồi chiên không dầu Hafele AF-T5A 5 lít\"></a></p>\n<h3>Có 8 chương trình chiên được cài đặt sẵn thời gian nhiệt độ đơn giản, giúp chuẩn bị thức ăn thơm ngon hơn</h3>\n<p>Menu được cài đặt sẵn bao gồm: Khoai tây chiên, thịt nướng, gà, tôm, bít tết, bánh, rau củ, cá,...</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/chuc-nang-naau.jpg\"\n        onclick=\"return false;\"><img alt=\"Chức năng nấu đa dạng - Nồi chiên không dầu Hafele AF-T5A 5 lít\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/chuc-nang-naau.jpg\"\n            title=\"Chức năng nấu đa dạng - Nồi chiên không dầu Hafele AF-T5A 5 lít\"></a></p>\n<h3>Công suất 2000W cùng tích hợp quạt đối lưu giúp luân chuyển nhiệt lượng khắp khoang nồi cho thức ăn chín\n    đều,&nbsp;tiết kiệm điện năng tiêu thụ</h3>\n<p>Công nghệ làm nóng Rapid Air cùng công suất 2000W&nbsp;làm nóng nồi nhanh, giúp thức ăn chín mau, tiết kiệm điện.</p>\n<p>Giúp thực phẩm chín vàng đều và nhanh chóng, thưởng thức món ăn ngon miệng hơn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/untitled-1.jpg\"\n        onclick=\"return false;\"><img alt=\"Công suất 2000W - Nồi chiên không dầu Hafele AF-T5A 5 lít\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/untitled-1.jpg\" \n            title=\"Công suất 2000W - Nồi chiên không dầu Hafele AF-T5A 5 lít\"></a></p>\n<h3 style=\"text-align: justify;\">Lòng nồi bằng kim loại phủ chống dính&nbsp;cao cấp và an toàn tuyệt đối</h3>\n<p style=\"text-align: justify;\">Rổ chiên phủ lớp chống dính dễ tháo rời, tiện vệ sinh sau khi sử dụng.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/2.jpg\"\n        onclick=\"return false;\"><img alt=\"Dễ tháo rời, tiện vệ sinh - Nồi chiên không dầu Hafele AF-T5A 5 lít\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/2.jpg\" \n            title=\"Dễ tháo rời, tiện vệ sinh - Nồi chiên không dầu Hafele AF-T5A 5 lít\"></a></p>\n<p>Chân đế chống trượt dùng chắc chắn trên mọi mặt phẳng, để nồi hoạt động ổn định, tránh nghiêng đổ.</p>\n<p><strong>Lưu ý khi sử dụng:</strong></p>\n<p>- Vệ sinh nồi trước khi sử dụng lần đầu. Thường xuyên vệ sinh các bộ phận, mặt ngoài nồi để đảm bảo độ bền, an toàn\n    sức khỏe suốt thời gian sử dụng.</p>\n<p>- Khi sử dụng chiên thức ăn cần lưu ý không nên chiên quá nhiều thức ăn cùng lúc thức ăn sẽ bị mềm.</p>\n<p>- Không nên chiên thức ăn quá lâu, nhiệt độ trong nồi sẽ làm khô thức ăn.</p>\n<p>Nồi chiên không\n        dầu Hafele AF-T5A 5 lít&nbsp;là thiết bị nấu ăn hiện đại của nhãn hiệu Đức - Hafele sở hữu kiểu dáng đẹp\n    mắt, chế biến được nhiều món ngon, dễ sử dụng, giá cả hợp lý, rất thích hợp cho bạn.</p>', 24, 100, 1),
(43, 2, 'Bếp gas đơn Paloma PA-S18H \r\n', 46, 'P43_avt.jpg', 4, '<p><strong><em>Bếp gas đơn Paloma PA-S18H là dòng bếp nhỏ gọn, bền bỉ với thiết kế đơn giản, dễ sử dụng, phù hợp cho nhu cầu nấu ăn cơ bản trong không gian nhỏ.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Mặt bếp inox sáng bóng, <strong>chống han gỉ</strong> và dễ dàng vệ sinh sau khi sử dụng.</p>\r\n<p>- Thiết kế gọn gàng, phù hợp với không gian bếp nhỏ.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Kiểu dáng nhỏ gọn, tiện lợi cho gia đình ít người hoặc người sống một mình.</p>\r\n<p>- Dễ dàng di chuyển và bố trí linh hoạt.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng kim loại phủ men <strong>chắc chắn, chống dính</strong>.</p>\r\n<p>- Có thể tháo rời, thuận tiện cho việc vệ sinh.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp đơn với <strong>1 họng đốt</strong>, đáp ứng nhu cầu nấu ăn hằng ngày.</p>\r\n<p>- <strong>Đầu đốt gang xi đồng</strong> bền bỉ, chịu nhiệt tốt.</p>\r\n<p>- Ngọn lửa xanh, cháy đều, không làm đen đáy nồi.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Trang bị <strong>hệ thống đánh lửa Magneto</strong> cho tia lửa nhanh, nhạy và ổn định.</p>\r\n<p>- Điều khiển bằng núm xoay đơn giản, dễ dàng điều chỉnh mức lửa.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Ngọn lửa tập trung, giúp <strong>tiết kiệm gas</strong> hiệu quả.</p>\r\n<p>- Hạn chế thất thoát nhiên liệu trong quá trình sử dụng.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Kết cấu bếp chắc chắn, hoạt động ổn định.</p>\r\n<p>- Chất liệu bền bỉ, hạn chế biến dạng khi sử dụng lâu dài.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt inox và kiềng tháo rời.</p>\r\n<p>- <strong>Dễ sử dụng</strong> với núm xoay linh hoạt.</p>\r\n<p>- Phù hợp cho sinh viên, người ở trọ hoặc gia đình ít người.</p>\r\n\r\n<p><em>Tóm lại, bếp gas đơn Paloma PA-S18H là lựa chọn tiện lợi với thiết kế nhỏ gọn, độ bền cao, dễ sử dụng và đáp ứng tốt nhu cầu nấu ăn cơ bản hằng ngày.</em></p>', 24, 1000, 1),
(44, 2, 'Bếp Gas đơn Sunhouse SHB212KG\r\n', 24, 'P44_avt.jpg', 4, '<p><strong><em>Bếp gas đơn Sunhouse SHB212KG là dòng bếp nhỏ gọn, hiện đại, phù hợp cho nhu cầu nấu ăn cơ bản với thiết kế bền bỉ, dễ sử dụng và tiết kiệm gas.</em></strong></p>\r\n\r\n<h3>Tổng quan thiết kế</h3>\r\n\r\n<p><strong>Mặt bếp</strong></p>\r\n<p>- Mặt kính chịu lực, chịu nhiệt tốt, <strong>hạn chế trầy xước và bám bẩn</strong>.</p>\r\n<p>- Dễ dàng lau chùi, giúp bếp luôn sạch sẽ và sáng bóng.</p>\r\n\r\n<p><strong>Thân bếp</strong></p>\r\n<p>- Thiết kế nhỏ gọn, hiện đại, phù hợp cho gia đình ít người hoặc người sống một mình.</p>\r\n<p>- Kiểu dáng sang trọng, dễ bố trí trong nhiều không gian bếp.</p>\r\n\r\n<p><strong>Kiềng bếp</strong></p>\r\n<p>- Kiềng thép tráng men <strong>5 chân chắc chắn</strong>, chống trượt hiệu quả.</p>\r\n<p>- Có thể tháo rời, thuận tiện cho việc vệ sinh.</p>\r\n\r\n<h3>Hiệu suất đun nấu</h3>\r\n<p>- Bếp đơn với <strong>1 họng đốt</strong>, đáp ứng nhu cầu nấu ăn hằng ngày.</p>\r\n<p>- <strong>Đầu đốt đồng thau</strong> bền bỉ, chịu nhiệt tốt, không biến dạng.</p>\r\n<p>- Ngọn lửa xanh, cháy đều, không làm đen đáy nồi.</p>\r\n\r\n<h3>Cơ chế hoạt động</h3>\r\n<p>- Trang bị <strong>hệ thống đánh lửa Magneto</strong> cho tia lửa nhanh, nhạy và ổn định.</p>\r\n<p>- Điều khiển bằng núm xoay linh hoạt, dễ dàng bật/tắt và điều chỉnh mức lửa.</p>\r\n\r\n<h3>Tiết kiệm nhiên liệu</h3>\r\n<p>- Thiết kế pép đồng giúp <strong>tiết kiệm gas</strong> hiệu quả.</p>\r\n<p>- Ngọn lửa tập trung, hạn chế hao phí nhiên liệu.</p>\r\n\r\n<h3>An toàn khi sử dụng</h3>\r\n<p>- Chất liệu cao cấp, chịu nhiệt tốt, đảm bảo độ bền lâu dài.</p>\r\n<p>- Hệ thống đánh lửa cơ an toàn, ít hỏng hóc, không cần dùng pin.</p>\r\n\r\n<h3>Tiện ích</h3>\r\n<p>- <strong>Dễ vệ sinh</strong> nhờ mặt kính và kiềng tháo rời.</p>\r\n<p>- <strong>Dễ sử dụng</strong> với núm xoay đơn giản.</p>\r\n<p>- Phù hợp cho sinh viên, người ở trọ hoặc gia đình nhỏ.</p>\r\n\r\n<p><em>Tóm lại, bếp gas đơn Sunhouse SHB212KG là lựa chọn tiện lợi với thiết kế hiện đại, độ bền cao, dễ sử dụng và tiết kiệm gas cho nhu cầu nấu ăn hằng ngày.</em></p>', 24, 1200, 1),
(45, 4, 'Bếp điện từ đơn Kangaroo KG20IH10N 2100W', 14, 'P45_avt.jpg', 4, '<div class=\"product-description\">\r\n    <h2>Bếp điện từ đơn Kangaroo KG20IH10N 2100W</h2>\r\n\r\n    <p>\r\n        Bếp điện từ đơn <strong>Kangaroo KG20IH10N</strong> sở hữu thiết kế nhỏ gọn, \r\n        hiện đại cùng nhiều tiện ích thông minh, phù hợp cho nhu cầu nấu ăn hằng ngày \r\n        hoặc sử dụng trong các buổi ăn lẩu tại nhà.\r\n    </p>\r\n\r\n    <h3>Đặc điểm nổi bật</h3>\r\n    <ul>\r\n        <li>Thiết kế gọn nhẹ, dễ bố trí và di chuyển</li>\r\n        <li>Bảng điều khiển cảm ứng hiện đại, thao tác thuận tiện</li>\r\n        <li>Nhiều chế độ nấu cài đặt sẵn giúp nấu ăn nhanh chóng</li>\r\n        <li>Mặt kính Ceramic bền đẹp, dễ dàng vệ sinh</li>\r\n        <li>Chức năng hẹn giờ tiện lợi cho các món ninh, hầm</li>\r\n        <li>Tặng kèm nồi nấu tiện dụng</li>\r\n        <li>Cảnh báo mặt bếp nóng giúp tăng độ an toàn khi sử dụng</li>\r\n        <li>Tự ngắt khi quá nhiệt hoặc điện áp không ổn định</li>\r\n        <li>Tự nhận diện nồi và cảnh báo khi không có nồi</li>\r\n    </ul>\r\n\r\n    <h3>Tiện ích và cơ chế hoạt động</h3>\r\n    <p>\r\n        Bếp được tích hợp nhiều chương trình nấu tự động như xào, hấp, chiên, \r\n        nấu canh, đun nước và nấu lẩu, hỗ trợ người dùng lựa chọn nhanh chế độ phù hợp \r\n        cho từng món ăn. Hệ thống gia nhiệt giúp làm nóng nhanh, tiết kiệm thời gian nấu nướng.\r\n    </p>\r\n\r\n    <p>\r\n        Ngoài ra, sản phẩm còn trang bị chức năng hẹn giờ thông minh giúp người dùng \r\n        dễ dàng kiểm soát thời gian nấu mà không cần đứng canh liên tục. Các tính năng \r\n        an toàn như cảnh báo mặt bếp nóng, tự ngắt khi quá tải nhiệt hoặc khi không có nồi \r\n        giúp quá trình sử dụng an toàn và tiện lợi hơn.\r\n    </p>\r\n</div>', 12, 1500, 1),
(46, 4, 'Bếp từ đơn Sunhouse Mama SHD6886 2000W', 24, 'P46_avt.jpg', 3, '<div class=\"product-description\">\r\n    <h2>Bếp từ đơn Sunhouse Mama SHD6886 2000W</h2>\r\n\r\n    <p>\r\n        Bếp từ đơn <strong>Sunhouse Mama SHD6886</strong> sở hữu thiết kế hiện đại, \r\n        sang trọng cùng công suất mạnh mẽ 2000W giúp nấu ăn nhanh chóng và tiết kiệm thời gian. \r\n        Sản phẩm phù hợp cho gia đình nhỏ, phòng trọ hoặc sử dụng trong các bữa tiệc lẩu tiện lợi.\r\n    </p>\r\n\r\n    <h3>Đặc điểm nổi bật</h3>\r\n    <ul>\r\n        <li>Công suất lớn 2000W giúp gia nhiệt nhanh, nấu ăn hiệu quả</li>\r\n        <li>Trang bị công nghệ Inverter tiết kiệm điện năng tối ưu</li>\r\n        <li>Gia nhiệt ổn định ở mức thấp, thích hợp nấu các món hầm, ninh, đun liu riu</li>\r\n        <li>Mặt kính Ceramic cao cấp bền bỉ, chịu lực và chịu nhiệt tốt</li>\r\n        <li>Bề mặt sáng bóng, dễ lau chùi sau khi sử dụng</li>\r\n        <li>Tích hợp nhiều chương trình nấu cài đặt sẵn tiện lợi</li>\r\n        <li>Bảng điều khiển cảm ứng trượt nhạy bén, dễ thao tác</li>\r\n        <li>Có đèn hiển thị giúp theo dõi quá trình nấu thuận tiện</li>\r\n        <li>Thiết kế nhỏ gọn, phù hợp nhiều không gian bếp</li>\r\n        <li>Thương hiệu Sunhouse uy tín của Việt Nam, sản xuất tại Thái Lan</li>\r\n    </ul>\r\n\r\n    <h3>Tiện ích và công nghệ nổi bật</h3>\r\n    <p>\r\n        Bếp được ứng dụng công nghệ <strong>Inverter</strong> hiện đại giúp kiểm soát công suất \r\n        ổn định, duy trì nhiệt liên tục ở mức thấp mà không bị ngắt quãng. Nhờ đó, các món hầm, \r\n        ninh hoặc kho được nấu ngon hơn và tiết kiệm điện năng đáng kể.\r\n    </p>\r\n\r\n    <p>\r\n        Ngoài ra, bảng điều khiển cảm ứng trượt hiện đại giúp thao tác điều chỉnh nhiệt độ \r\n        nhanh chóng và chính xác. Các chương trình nấu được cài đặt sẵn hỗ trợ người dùng \r\n        chế biến nhiều món ăn tiện lợi mà không cần điều chỉnh phức tạp.\r\n    </p>\r\n</div>', 12, 900, 1),
(47, 4, 'Bếp từ đơn Sunhouse SHD6867 2000W', 24, 'P47_avt.jpg', 4.3, '<div class=\"product-description\">\r\n    <h2>Bếp từ đơn Sunhouse SHD6867 2000W</h2>\r\n\r\n    <p>\r\n        Bếp từ đơn <strong>Sunhouse SHD6867</strong> sở hữu thiết kế nhỏ gọn, màu đen sang trọng \r\n        cùng công suất mạnh mẽ 2000W giúp nấu ăn nhanh chóng và tiết kiệm thời gian. \r\n        Sản phẩm phù hợp với gia đình nhỏ, sinh viên, phòng trọ hoặc dùng trong các bữa lẩu tiện lợi tại nhà.\r\n    </p>\r\n\r\n    <h3>Đặc điểm nổi bật</h3>\r\n    <ul>\r\n        <li>Công suất 2000W giúp gia nhiệt nhanh, nhiệt độ tối đa lên đến 270°C</li>\r\n        <li>8 mức công suất tùy chỉnh linh hoạt từ 100W đến 2000W</li>\r\n        <li>Tích hợp 8 chế độ nấu cài đặt sẵn tiện lợi</li>\r\n        <li>Bảng điều khiển cảm ứng tiếng Việt dễ sử dụng</li>\r\n        <li>Chức năng tạm dừng bếp tiện lợi khi đang nấu ăn</li>\r\n        <li>Hẹn giờ nấu lên đến 3 giờ phù hợp nhiều món ăn</li>\r\n        <li>Khóa bảng điều khiển an toàn cho gia đình có trẻ nhỏ</li>\r\n        <li>Mặt kính Ceramic cường lực chịu nhiệt đến 760°C</li>\r\n        <li>Chống trầy xước, dễ lau chùi sau khi sử dụng</li>\r\n        <li>Chân đế bọc cao su chống trơn trượt, tăng độ ổn định</li>\r\n        <li>Tự động ngắt khi quá tải nhiệt giúp sử dụng an toàn hơn</li>\r\n        <li>Tặng kèm nồi lẩu tiện lợi khi sử dụng</li>\r\n    </ul>\r\n\r\n    <h3>Thiết kế hiện đại, dễ sử dụng</h3>\r\n    <p>\r\n        Bếp từ Sunhouse SHD6867 có kiểu dáng mỏng gọn, màu đen tinh tế kết hợp hoa văn hiện đại, \r\n        giúp không gian bếp trở nên sang trọng hơn. Bảng điều khiển cảm ứng tiếng Việt trực quan \r\n        giúp người dùng dễ dàng thao tác và lựa chọn chế độ nấu phù hợp.\r\n    </p>\r\n\r\n    <h3>Nấu ăn nhanh chóng, linh hoạt</h3>\r\n    <p>\r\n        Với 8 mức công suất từ 100W đến 2000W, bếp hỗ trợ đa dạng nhu cầu nấu nướng như đun nước, \r\n        chiên, xào, nấu canh, lẩu hoặc hầm thức ăn. Chức năng hẹn giờ lên đến 3 tiếng giúp bạn \r\n        chủ động thời gian nấu mà không cần đứng canh liên tục.\r\n    </p>\r\n\r\n    <h3>An toàn khi sử dụng</h3>\r\n    <p>\r\n        Bếp được trang bị chức năng khóa bảng điều khiển để tránh trẻ nhỏ vô tình thay đổi cài đặt. \r\n        Ngoài ra, tính năng tự ngắt khi quá tải nhiệt giúp bảo vệ thiết bị và tăng độ bền trong quá trình sử dụng.\r\n    </p>\r\n\r\n    <h3>Lưu ý sử dụng</h3>\r\n    <p>\r\n        Bếp chỉ sử dụng với các loại nồi, chảo có đáy nhiễm từ như inox 430, gang, thép hoặc sắt tráng men. \r\n        Đường kính đáy nồi phù hợp trong khoảng 12 – 26 cm để đạt hiệu quả nấu tối ưu.\r\n    </p>\r\n</div>', 12, 1300, 1),
(48, 14, 'Quạt trần Panasonic 3 cánh F-60MZ2 66W', 10, 'P48_avt.jpg', 4.2, '<div class=\"product-description\">\r\n    <h2>Quạt trần Panasonic 3 cánh F-60MZ2 66W – Làm mát hiệu quả cho không gian sống</h2>\r\n\r\n    <p>\r\n        Quạt trần Panasonic F-60MZ2 là sản phẩm đến từ thương hiệu Panasonic nổi tiếng của Nhật Bản, \r\n        sở hữu thiết kế sang trọng cùng khả năng làm mát mạnh mẽ, phù hợp với nhiều không gian gia đình hiện đại.\r\n    </p>\r\n\r\n    <h3>Thiết kế hiện đại, tiết kiệm không gian</h3>\r\n    <p>\r\n        Quạt trần Panasonic được thiết kế tinh tế với kiểu dáng trang nhã, \r\n        góp phần tạo điểm nhấn thẩm mỹ cho không gian phòng khách, phòng ngủ hoặc phòng ăn.\r\n    </p>\r\n\r\n    <p>\r\n        Thiết kế lắp đặt trên trần giúp tiết kiệm diện tích sử dụng, \r\n        đồng thời luồng gió được phân bổ đều khắp căn phòng mang lại cảm giác dễ chịu hơn.\r\n    </p>\r\n\r\n    <h3>3 cánh quạt lớn, làm mát mạnh mẽ</h3>\r\n    <p>\r\n        Sản phẩm sở hữu 3 cánh quạt có đường kính lên đến 150 cm kết hợp công suất hoạt động 66W, \r\n        giúp tạo lưu lượng gió lớn và làm mát nhanh chóng cho không gian rộng.\r\n    </p>\r\n\r\n    <h3>Động cơ bạc đạn vận hành êm ái</h3>\r\n    <p>\r\n        Quạt sử dụng động cơ bạc đạn bền bỉ, vận hành ổn định và hạn chế tiếng ồn hiệu quả, \r\n        phù hợp cho không gian sinh hoạt, nghỉ ngơi hoặc học tập.\r\n    </p>\r\n\r\n    <h3>5 tốc độ gió linh hoạt</h3>\r\n    <p>\r\n        Quạt trần Panasonic F-60MZ2 được trang bị 5 mức tốc độ gió khác nhau, \r\n        giúp người dùng dễ dàng điều chỉnh theo nhu cầu sử dụng và điều kiện thời tiết.\r\n    </p>\r\n\r\n    <p>\r\n        Chế độ gió thường mang lại luồng gió ổn định, tạo cảm giác mát mẻ tự nhiên và dễ chịu cho cả gia đình.\r\n    </p>\r\n\r\n    <h3>Điều khiển dễ sử dụng</h3>\r\n    <p>\r\n        Sản phẩm sử dụng hộp số gắn tường với thao tác đơn giản, \r\n        giúp điều chỉnh tốc độ quạt nhanh chóng và thuận tiện.\r\n    </p>\r\n\r\n    <p>\r\n        Quạt trần Panasonic 3 cánh F-60MZ2 66W là lựa chọn phù hợp cho gia đình cần một thiết bị làm mát bền bỉ, \r\n        hoạt động êm ái, tiết kiệm không gian và mang lại luồng gió mát dễ chịu trong những ngày nắng nóng.\r\n    </p>\r\n</div>', 12, 500, 1),
(49, 17, 'Máy lọc không khí LG PuriCare 360 Hit AS60GHWG0 41W', 3, 'P49_avt.jpg', 4.5, '<div class=\"product-description\">\r\n    <h2>Máy lọc không khí LG PuriCare 360 Hit AS60GHWG0 41W – Không gian sống trong lành hơn mỗi ngày</h2>\r\n\r\n    <p>\r\n        Máy lọc không khí LG PuriCare AS60GHWG0 sở hữu thiết kế hiện đại, \r\n        khả năng lọc sạch hiệu quả cùng nhiều công nghệ tiên tiến, phù hợp sử dụng cho phòng có diện tích đến 60m².\r\n    </p>\r\n\r\n    <h3>Thiết kế hiện đại, lọc khí 360 độ</h3>\r\n    <p>\r\n        Sản phẩm có kiểu dáng sang trọng với gam màu trang nhã, dễ dàng bố trí tại nhiều không gian như phòng khách, phòng ngủ hoặc văn phòng làm việc.\r\n    </p>\r\n\r\n    <p>\r\n        Thiết kế lọc khí 360 độ giúp luồng không khí sạch được lan tỏa đều khắp căn phòng, \r\n        mang lại cảm giác dễ chịu và thoải mái cho người sử dụng.\r\n    </p>\r\n\r\n    <h3>Hệ thống lọc 3 lớp hiệu quả</h3>\r\n    <p>\r\n        Máy được trang bị hệ thống lọc gồm màng lọc thô, màng lọc HEPA H13 và màng lọc than hoạt tính, \r\n        giúp loại bỏ bụi bẩn, bụi mịn, vi khuẩn và các mùi khó chịu trong không khí.\r\n    </p>\r\n\r\n    <p>\r\n        Màng lọc HEPA H13 có khả năng lọc bụi mịn PM0.01 với hiệu suất lên đến 99.999%, \r\n        góp phần mang lại bầu không khí trong lành và an toàn hơn cho gia đình.\r\n    </p>\r\n\r\n    <h3>Cảm biến chất lượng không khí thông minh</h3>\r\n    <p>\r\n        Máy tích hợp cảm biến bụi PM1.0 và khí gas giúp phát hiện nhanh các tác nhân ô nhiễm trong không khí, \r\n        từ đó tự động điều chỉnh chế độ hoạt động phù hợp.\r\n    </p>\r\n\r\n    <p>\r\n        Đèn hiển thị chất lượng không khí bằng 4 màu sắc giúp người dùng dễ dàng theo dõi tình trạng không khí trong phòng:\r\n    </p>\r\n\r\n    <ul>\r\n        <li>Xanh lá: Không khí sạch.</li>\r\n        <li>Vàng: Không khí ở mức trung bình.</li>\r\n        <li>Cam: Không khí ô nhiễm nhẹ.</li>\r\n        <li>Đỏ: Không khí ô nhiễm nghiêm trọng.</li>\r\n    </ul>\r\n\r\n    <h3>Động cơ Inverter vận hành êm ái</h3>\r\n    <p>\r\n        Máy hoạt động với công suất 41W, tiết kiệm điện năng và vận hành ổn định nhờ công nghệ Inverter hiện đại.\r\n    </p>\r\n\r\n    <p>\r\n        Độ ồn thấp khi sử dụng chế độ ngủ giúp mang lại không gian yên tĩnh, \r\n        hỗ trợ giấc ngủ ngon hơn cho cả gia đình.\r\n    </p>\r\n\r\n    <h3>Đa dạng chế độ và mức lọc</h3>\r\n    <p>\r\n        Máy có 2 chế độ hoạt động gồm chế độ tự động và chế độ ngủ, \r\n        kết hợp cùng 4 mức độ gió thấp, trung bình, cao và turbo đáp ứng linh hoạt nhiều nhu cầu sử dụng.\r\n    </p>\r\n\r\n    <h3>Bảng điều khiển cảm ứng hiện đại</h3>\r\n    <p>\r\n        Bảng điều khiển cảm ứng nhạy bén đi kèm màn hình hiển thị rõ ràng các thông tin như chất lượng không khí, nhiệt độ, độ ẩm và chế độ hoạt động giúp người dùng dễ dàng thao tác.\r\n    </p>\r\n\r\n    <h3>Nhiều tiện ích thông minh</h3>\r\n    <p>\r\n        Máy lọc không khí LG PuriCare AS60GHWG0 được trang bị nhiều tiện ích hữu ích như:\r\n    </p>\r\n\r\n    <ul>\r\n        <li>Ion diệt khuẩn giúp không khí sạch hơn.</li>\r\n        <li>Cảnh báo thay bộ lọc tiện lợi.</li>\r\n        <li>Khóa bảng điều khiển an toàn cho gia đình có trẻ nhỏ.</li>\r\n        <li>Điều khiển từ xa qua ứng dụng LG ThinQ bằng wifi.</li>\r\n    </ul>\r\n\r\n    <p>\r\n        Máy lọc không khí LG PuriCare 360 Hit AS60GHWG0 41W là lựa chọn phù hợp cho những gia đình mong muốn sở hữu không gian sống sạch sẽ, thoáng mát và bảo vệ sức khỏe hiệu quả mỗi ngày.\r\n    </p>\r\n</div>', 18, 2400, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(50, 24, 'Bàn ủi hơi nước cầm tay Philips STH5030/20 1400W', 15, 'P50_avt.jpg', 4, '<div class=\"product-description\">\r\n    <h2>Bàn ủi hơi nước cầm tay Philips STH5030/20 1400W – Nhỏ gọn, tiện lợi, ủi nhanh hiệu quả</h2>\r\n\r\n    <p>\r\n        Bàn ủi hơi nước cầm tay Philips STH5030/20 sở hữu thiết kế hiện đại, nhỏ gọn cùng công suất mạnh mẽ, \r\n        giúp quần áo phẳng nhanh chóng và tiện lợi khi mang theo trong những chuyến du lịch hoặc công tác.\r\n    </p>\r\n\r\n    <h3>Thiết kế nhỏ gọn, tiện mang theo</h3>\r\n    <p>\r\n        Sản phẩm có kiểu dáng gọn nhẹ với khối lượng chỉ khoảng 1.204 kg, \r\n        giúp người dùng dễ dàng cầm nắm và thao tác trong quá trình sử dụng.\r\n    </p>\r\n\r\n    <p>\r\n        Thiết kế hiện đại phù hợp với những ai yêu thích sự tối giản, \r\n        thuận tiện để trong vali khi đi du lịch hoặc công tác xa.\r\n    </p>\r\n\r\n    <p>\r\n        Đầu ủi có thể điều chỉnh góc nghiêng linh hoạt, hỗ trợ ủi theo chiều đứng, chiều ngang hoặc nghiêng dễ dàng hơn.\r\n    </p>\r\n\r\n    <p>\r\n        Dây điện dài 197 cm giúp di chuyển linh hoạt trong khi sử dụng, \r\n        mang lại cảm giác thoải mái và thuận tiện hơn.\r\n    </p>\r\n\r\n    <h3>Mặt đế kim loại lướt êm trên bề mặt vải</h3>\r\n    <p>\r\n        Mặt đế bằng kim loại giúp bàn ủi lướt nhẹ nhàng trên quần áo, \r\n        hạn chế bám dính và giảm nguy cơ gây cháy vải.\r\n    </p>\r\n\r\n    <p>\r\n        Hơi nước liên tục giúp làm mềm sợi vải, giảm nhăn nhanh chóng và tiết kiệm thời gian ủi đồ mỗi ngày.\r\n    </p>\r\n\r\n    <h3>Công suất mạnh mẽ, làm nóng nhanh</h3>\r\n    <p>\r\n        Bàn ủi hoạt động với công suất từ 1200 - 1400W, \r\n        giúp thiết bị làm nóng nhanh chỉ trong khoảng 35 giây.\r\n    </p>\r\n\r\n    <p>\r\n        Công suất lớn giúp ủi quần áo hiệu quả hơn, tiết kiệm thời gian và điện năng cho người sử dụng.\r\n    </p>\r\n\r\n    <h3>Hai bình chứa nước tiện lợi</h3>\r\n    <p>\r\n        Sản phẩm được trang bị 2 bình chứa nước dung tích 120 ml và 200 ml dễ dàng tháo rời để châm nước khi cần thiết.\r\n    </p>\r\n\r\n    <p>\r\n        Dung tích lớn giúp người dùng có thể ủi quần áo liên tục mà không cần thêm nước quá nhiều lần.\r\n    </p>\r\n\r\n    <h3>Bảng điều khiển đơn giản, dễ sử dụng</h3>\r\n    <p>\r\n        Bàn ủi được thiết kế bảng điều khiển đơn giản với nút nhấn dễ thao tác, \r\n        phù hợp với nhiều đối tượng người dùng.\r\n    </p>\r\n\r\n    <p>\r\n        Máy có 2 chế độ Eco và Max giúp lựa chọn mức hơi nước phù hợp với từng loại vải, \r\n        vừa tiết kiệm điện vừa bảo vệ quần áo tốt hơn.\r\n    </p>\r\n\r\n    <h3>Nhiều tiện ích hữu ích</h3>\r\n    <ul>\r\n        <li>Ủi quần áo treo tiện lợi.</li>\r\n        <li>Có đế ủi rời đi kèm.</li>\r\n        <li>Hỗ trợ vừa ủi nằm vừa ủi đứng.</li>\r\n    </ul>\r\n\r\n    <h3>Lưu ý khi sử dụng</h3>\r\n    <ul>\r\n        <li>Đọc kỹ hướng dẫn sử dụng trước khi dùng.</li>\r\n        <li>Đổ hết nước sau khi sử dụng để tránh tích tụ độ ẩm.</li>\r\n        <li>Bảo quản ở nơi khô ráo và thông thoáng.</li>\r\n        <li>Chỉ sử dụng nước sạch, không dùng tinh dầu hoặc nước hoa.</li>\r\n    </ul>\r\n\r\n    <p>\r\n        Bàn ủi hơi nước cầm tay Philips STH5030/20 1400W là lựa chọn phù hợp cho những ai cần một thiết bị ủi quần áo tiện lợi, \r\n        nhỏ gọn nhưng vẫn đảm bảo hiệu quả làm phẳng nhanh chóng mỗi ngày.\r\n    </p>\r\n</div>', 12, 2500, 1),
(51, 24, 'Bàn ủi hơi nước Philips DST2020/80 2000W', 15, 'P51_avt.jpg', 4.3, '<div class=\"product-description\">\r\n    <h2>Bàn ủi hơi nước Philips DST2020/80 2000W – Ủi nhanh, chống dính, dễ sử dụng</h2>\r\n\r\n    <p>\r\n        Bàn ủi hơi nước Philips DST2020/80 sở hữu thiết kế hiện đại cùng công suất mạnh mẽ lên đến 2000W, \r\n        giúp quần áo phẳng nhanh chóng và tiết kiệm thời gian cho người sử dụng.\r\n    </p>\r\n\r\n    <h3>Thiết kế đầu nhọn tiện lợi</h3>\r\n    <p>\r\n        Sản phẩm được thiết kế đầu nhọn hình tam giác kết hợp rãnh cúc tiện lợi, \r\n        giúp dễ dàng tiếp cận những khu vực khó ủi như cổ áo, hàng cúc hoặc các nếp gấp nhỏ.\r\n    </p>\r\n\r\n    <p>\r\n        Với khối lượng khoảng 1.16 kg, bàn ủi gọn nhẹ, dễ cầm nắm và thao tác trong suốt quá trình sử dụng.\r\n    </p>\r\n\r\n    <p>\r\n        Dây điện dài 190 cm hỗ trợ người dùng di chuyển linh hoạt, \r\n        thuận tiện sử dụng trong nhiều không gian khác nhau.\r\n    </p>\r\n\r\n    <h3>Mặt đế Ceramic chống dính</h3>\r\n    <p>\r\n        Mặt đế Ceramic chống dính giúp bàn ủi lướt êm trên bề mặt vải, \r\n        hạn chế bám dính gây cháy xém quần áo và dễ dàng vệ sinh sau khi sử dụng.\r\n    </p>\r\n\r\n    <h3>Công suất mạnh mẽ, làm nóng nhanh</h3>\r\n    <p>\r\n        Bàn ủi hoạt động với công suất từ 1700 - 2000W giúp làm nóng nhanh, \r\n        hỗ trợ ủi phẳng quần áo hiệu quả chỉ trong thời gian ngắn.\r\n    </p>\r\n\r\n    <p>\r\n        Công suất lớn còn giúp tiết kiệm thời gian và nâng cao hiệu quả sử dụng hằng ngày.\r\n    </p>\r\n\r\n    <h3>Bình chứa nước dung tích lớn</h3>\r\n    <p>\r\n        Philips DST2020/80 được trang bị bình chứa nước dung tích 250 ml, \r\n        cho phép người dùng ủi quần áo liên tục mà không cần châm nước nhiều lần.\r\n    </p>\r\n\r\n    <p>\r\n        Thiết kế lỗ châm nước thông minh giúp việc thêm nước trở nên nhanh chóng và tiện lợi hơn.\r\n    </p>\r\n\r\n    <h3>Bảng điều khiển dễ thao tác</h3>\r\n    <p>\r\n        Bàn ủi sử dụng bảng điều khiển dạng núm xoay giúp người dùng dễ dàng điều chỉnh nhiệt độ phù hợp với từng loại vải khác nhau.\r\n    </p>\r\n\r\n    <h3>Tiện ích và tính năng an toàn</h3>\r\n    <ul>\r\n        <li>Trang bị nút trượt xả cặn tiện lợi.</li>\r\n        <li>Tự động ngắt điện khi quá nhiệt đảm bảo an toàn.</li>\r\n        <li>Có rãnh cúc hỗ trợ ủi dễ dàng hơn.</li>\r\n        <li>Hơi nước hỗ trợ làm phẳng quần áo nhanh chóng.</li>\r\n    </ul>\r\n\r\n    <h3>Lưu ý khi sử dụng</h3>\r\n    <ul>\r\n        <li>Đọc kỹ hướng dẫn sử dụng trước khi dùng.</li>\r\n        <li>Chỉ sử dụng nước sạch để đảm bảo độ bền sản phẩm.</li>\r\n        <li>Không sử dụng tinh dầu hoặc nước hoa trong bình chứa.</li>\r\n        <li>Đổ hết nước sau khi sử dụng để tránh ẩm mốc.</li>\r\n        <li>Bảo quản sản phẩm ở nơi khô ráo và thông thoáng.</li>\r\n    </ul>\r\n\r\n    <p>\r\n        Bàn ủi hơi nước Philips DST2020/80 2000W là lựa chọn phù hợp cho gia đình nhờ thiết kế tiện lợi, \r\n        công suất mạnh mẽ, mặt đế chống dính và nhiều tính năng hỗ trợ an toàn khi sử dụng.\r\n    </p>\r\n</div>', 12, 2200, 1),
(52, 8, 'Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH', 6, 'P52_avt.jpg', 4.2, '\n<p>\n    <em><strong>Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH</strong></em\n    ><em\n      ><strong\n        ><strong\n          >&nbsp;với nhiều chế độ cài sẵn,&nbsp;công nghệ nhiệt 3D nấu cơm ngon,\n          hẹn giờ đến 24 giờ, bảng điều khiển tiếng Việt dễ hiểu,... là công cụ\n          đắc lực trong căn bếp gia đình.</strong\n        ></strong\n      ></em\n    >\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043120.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Tổng quan\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043120.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Tổng quan\"></a>\n  </p>\n  <h3>Công nghệ nấu, công suất - Dung tích</h3>\n  <p>\n    - Công suất 835W kết hợp&nbsp;công nghệ nấu 3D giúp nồi nấu cơm chín đều, tơi\n    xốp, giữ lại được dinh dưỡng trong hạt gạo.\n  </p>\n  <p>\n    -&nbsp; Dung tích 1.8 lít&nbsp;nấu được 8 - 10 cốc gạo kèm nồi, đáp ứng tốt khẩu phần ăn cho 4 - 6\n    người.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043155.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Dung tích\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043155.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Dung tích\"></a>\n  </p>\n  <h3>Bảng điều khiển - Chương trình cài đặt sẵn</h3>\n  <p>\n    - Bảng điều khiển nút nhấn dễ dùng, có chú thích tiếng Việt kèm màn hình hiển\n    thị, tiện quan sát và điều chỉnh các chức năng.\n  </p>\n  <p>\n    -<strong> </strong>Đa dạng chương trình cài đặt sẵn giúp bạn nấu nhiều món\n    ngon: gạo lứt, hấp, gạo nếp, bánh,&nbsp; cháo, súp, gạo trắng, giữ ấm.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043215.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Bảng điều khiển\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043215.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Bảng điều khiển\"></a>\n  </p>\n  <h3>Thiết kế, chất liệu của sản phẩm</h3>\n  <p>\n    - Mẫu&nbsp; nồi cơm điện Sharp &nbsp;này được thiết kế màu trắng trang nhã, có bảng điều khiển nằm phía\n    trước độc lạ, làm tăng vẻ đẹp thẩm mỹ cho không gian bếp.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-011122-043358.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Thiết kế\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-011122-043358.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Thiết kế\"></a>\n  </p>\n  <p>\n    - Lòng nồi nhôm phủ chống dính bền tốt, dày 1.183 mm, gia nhiệt hiệu quả giúp\n    cơm chín đều, chống dính cháy, tiện vệ sinh.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043241.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Lòng nồi\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043241.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Lòng nồi\"\n    /></a>\n  </p>\n  <h3>Tiện ích - Phụ kiện</h3>\n  <p>\n    - Giữ ấm cơm đến 12 giờ và hẹn giờ nấu đến 24 giờ, hỗ trợ bạn căn chỉnh thời\n    gian nấu nướng linh hoạt hơn.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043305.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Tiện ích\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043305.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Tiện ích\"\n    /></a>\n  </p>\n  <p>\n    - Phụ kiện đi kèm&nbsp; nồi cơm điện: cốc đong, muỗng cơm, muỗng canh, xửng hấp.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-011122-043404.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Xửng hấp\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-011122-043404.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Xửng hấp\"\n    /></a>\n  </p>\n  <p>\n    <em>Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH</em>&nbsp;<i\n      >đến từ thương hiệu uy tín của Nhật Bản - Sharp, sở hữu nhiều chương trình\n      nấu, chất liệu lòng nồi bền tốt, nhiều tiện ích: hẹn giờ đến 24 giờ, có xửng\n      hấp đi kèm,... hỗ trợ bạn nấu nướng đa dạng món ngon một cách thuận tiện.</i\n    >\n  </p>\n   ', 12, 2200, 1),
(53, 8, 'Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK', 6, 'P53_avt.jpg', 4, '\n<p>\n    <strong\n      ><i>\n      Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK &nbsp;có lòng nồi phủ lớp chống dính giúp nấu cơm ngon, giữ ấm tốt, đa\n        dạng chương trình cài sẵn với nhiều loại gạo khác nhau, giữ ấm đến 24 giờ\n        tiện lợi.</i\n      ></strong\n    >\n  </p>\n  <h3>Công nghệ nấu, công suất - Dung tích</h3>\n  <p>\n    - Công suất 790W cùng công nghệ nấu 3D với bộ gia nhiệt được lắp đặt phía\n    trên, mặt bên và phía dưới tạo ra năng lượng nhiệt mạnh mẽ, đảm bảo hương vị\n    thơm ngon trong từng hạt gạo.\n  </p>\n  <p>\n    -&nbsp; Dung tích 1.8 lít &nbsp;nấu được 8 - 10 cốc gạo đi kèm theo nồi, đáp ứng tốt khẩu phần ăn cho 4\n    - 6 người.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115017.gif\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Công nghệ \"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115017.gif\"\n        style=\"height: 436px; width: 780px\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Công nghệ \"></a>\n  </p>\n  <h3>Bảng điều khiển - Chương trình cài đặt sẵn</h3>\n  <p>\n    - Bảng điều khiển nút nhấn có màn hình hiển thị hỗ trợ tiếng Việt giúp bạn\n    quan sát chức năng, thời gian nấu thêm rõ ràng, tiện lợi.\n  </p>\n  <p>\n    -<strong>&nbsp;</strong>Đa dạng chương trình cài đặt sẵn giúp bạn nấu nhiều\n    món ngon: cháo, cơm niêu, giữ ấm, hấp, làm bánh, ngũ cốc, nấu nhanh, nấu thông\n    thường và súp.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115128.gif\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Nút nhấn\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115128.gif\"\n        style=\"height: 436px; width: 780px\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Nút nhấn\"></a>\n  </p>\n  <h3>Thiết kế, chất liệu của sản phẩm</h3>\n  <p>\n    - Mẫu&nbsp; nồi cơm điện Sharp &nbsp;này sở hữu vẻ ngoài sang trọng, bóng sáng với màu đen - xám, góp phần\n    tạo nên vẻ đẹp hiện đại, thời thượng cho không gian bếp.\n  </p>\n  <p>\n    - Lòng nồi hợp kim phủ lớp chống dính với lớp phủ trong PTFE và lớp phủ ngoài\n    Organosilicon, dày bền đến 2.2 mm,<strong>&nbsp;</strong>cầm chắc tay, an toàn\n    khi nấu, hạn chế cháy dính.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115153.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Dung tích\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115153.jpg\"\n        style=\"height: 436px; width: 780px\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Dung tích\"></a>\n  </p>\n  <h3>Tiện ích - Phụ kiện</h3>\n  <p>\n    - Giữ ấm cơm đến 24 giờ, hỗ trợ bạn căn chỉnh thời gian nấu nướng linh hoạt\n    hơn.&nbsp;<strong\n      >Lưu ý: Hãng khuyến cáo thời gian giữ ấm tốt nhất là 12 giờ (tùy thuộc vào\n      loại gạo, khí hậu,...).</strong\n    >\n  </p>\n  <p>- Hẹn giờ nấu đến 15 giờ.</p>\n  <p>\n    - Phụ kiện đi kèm&nbsp; nồi cơm điện: cốc đong, muỗng cơm, muỗng canh và xửng hấp.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115216.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Tiện ích\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115216.jpg\"\n        style=\"height: 436px; width: 780px\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Tiện ích\"></a>\n  </p>\n  <p>\n    <i\n      >Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK&nbsp;thuộc&nbsp;thương hiệu uy\n      tín của Nhật Bản, đa dạng chương trình nấu để bạn trổ tài làm nhiều món ngon\n      cho gia đình, màu sắc sang trọng, chất liệu lòng nồi bền tốt, công nghệ nấu\n      3D chế biến hạt cơm mềm xốp, chín đều, bảo toàn dinh dưỡng trong gạo. Đây\n      chắc chắn là sự lựa chọn xứng đáng cho không gian bếp nhà bạn.</i\n    >\n  </p>\n   ', 12, 1800, 1),
(54, 8, 'Nồi cơm điện Toshiba', 7, 'P54_avt.jpg', 4, '\n<div>\n    <h3> Nồi cơm điện Toshiba \n      RC-18NMFVN(WT) thiết kế chắc chắn, màu trắng sang trọng\n    </h3>\n  </div>\n  <p>Góp phần tôn thêm nét đẹp hiện đại của mọi không gian bếp.</p>\n  <p>\n    Thêm một đặc điểm nổi bật của chiếc nồi này là đáy nồi nghiên 60 độ giúp tạo\n    lực chéo 60 độ để khi nấu cơm sôi, gạo sẽ được trộn từ dưới đáy lên trên nên\n    gạo sẽ nở đều, cơm chín ngon hơn.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-1.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-1.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3> Nồi cơm điện &nbsp;này có dung tích 1.8 lít đáp ứng nhu cầu cơm cho&nbsp; gia đình 4 – 6 thành viên\n  </h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-2.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-2.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>\n    Nấu cơm nhanh chín, tiết kiệm điện với công suất 800W cùng&nbsp;công nghệ nấu\n    3D\n  </h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-3.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-3.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>Lòng nồi 3 lớp dày 4 mm, bằng hợp kim nhôm phủ lớp chống dính bền bỉ</h3>\n  <p>\n    An toàn cho sức khỏe, cho hạt cơm chín tơi, ngon và&nbsp; dễ chùi rửa &nbsp;sau khi dùng.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-4.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-4.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>\n    Nhiều chế độ nấu tự động, giữ ấm, hâm nóng, hẹn giờ nấu tiện dụng với bảng\n    điều khiển điện tử có màn hình hiển thị\n  </h3>\n  <p>\n    Các chế độ nấu tự động như:&nbsp; nấu gạo trắng, gạo trộn, nấu nhanh,\n     nấu cháo, lên men làm bánh,làm bánh, nấu súp, luộc trứng,... giúp bạn chế biến các món ăn đa dạng, dễ dàng. &nbsp;\n  </p>\n  <p>\n    Ngoài ra,&nbsp; nồi cơm điện tử &nbsp;còn có chức năng hâm nóng, giữ ấm đến 30 tiếng, hẹn giờ nấu tới 24\n    tiếng đem đến cho người nội trợ nhiều sự tiện lợi khi nấu ăn.&nbsp; Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN&nbsp;với các nút bấm có chú thích chức năng sử dụng rõ ràng giúp bạn điều\n    chỉnh các chức năng, chế độ nấu dễ dàng, chính xác.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-9.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-9.jpg\"\n        style=\"height: 1200px; width: 800px\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>Nồi có xửng hấp giúp bạn hấp bánh bao, rau củ quả tiện lợi</h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-6.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-6.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>Muỗng lấy cơm, cốc đong gạo giúp nấu cơm dễ dàng</h3>\n  <p>\n    Bên cạnh đó, nồi còn trang bị kệ để muỗng lấy cơm cho phép bạn bảo quản muỗng\n    lấy cơm sạch sẽ, gọn gàng hơn.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-7.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-7.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <p>\n   Nồi cơm điện tử Toshiba &nbsp;1.8 lít RC-18NMFVN(WT) đến từ thương hiệu Toshiba – Nhật Bản, sản xuất\n    tại Thái Lan chất lượng tốt, nấu cơm ngon, dùng bền.\n  </p>\n   ', 12, 1600, 1),
(55, 3, 'Bếp điện từ đôi BlueStone ICB-6818', 13, 'P55_avt.jpg', 4.8, '<h3>\r\n    Bếp điện từ đôi BlueStone ICB-6818\r\n      lắp đặt âm sang trọng, gia tăng nét đẹp cho không gian đun nấu\r\n    </h3>\r\n    <p>Bếp từ\r\n      với tổng công suất 4000W nấu ăn cực nhanh chóng, 2 vùng nấu hỗ trợ đun nấu\r\n      tiện lợi hơn. Với tổng công suất này, bếp sử dụng điện nối qua aptomat (CB).\r\n    </p>\r\n    <p>\r\n      <a\r\n        class=\"preventdefault\"\r\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-9.jpg\"\r\n        onclick=\"return false;\"\r\n        ><img\r\n          alt=\"Sang trọng, tiện dụng - Bếp điện từ đôi Bluestone ICB-6818\"\r\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-9.jpg\"\r\n          title=\"Sang trọng, tiện dụng - Bếp điện từ đôi Bluestone ICB-6818\"></a>\r\n    </p>\r\n    <h3>\r\n      Mặt bếp bằng kính Ceramic chịu nhiệt cao cấp, chống trầy hiệu quả, sáng bóng\r\n      lâu, dễ chùi rửa, giữ bếp luôn mới\r\n    </h3>\r\n    <p>\r\n      <a\r\n        class=\"preventdefault\"\r\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-10.jpg\"\r\n        onclick=\"return false;\"\r\n        ><img\r\n          alt=\"Mặt bếp cao cấp, bền tốt - Bếp điện từ đôi Bluestone ICB-6818\"\r\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-10.jpg\"\r\n          title=\"Mặt bếp cao cấp, bền tốt - Bếp điện từ đôi Bluestone ICB-6818\"></a>\r\n    </p>\r\n    <h3>Độ dày mặt kính&nbsp;0.4 cm siêu bền</h3>\r\n    <p>\r\n      <a\r\n        class=\"preventdefault\"\r\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-11.jpg\"\r\n        onclick=\"return false;\"\r\n        ><img\r\n          alt=\"Mặt kính dày -  Bếp điện từ đôi Bluestone ICB-6818\"\r\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-11.jpg\"\r\n          title=\"Mặt kính dày -  Bếp điện từ đôi Bluestone ICB-6818\"></a>\r\n    </p>\r\n    <h3>\r\n     Bảng điều khiển cảm ứng\r\n      nhạy bén với đèn Led hiển thị, cho phép tùy chỉnh 9 mức công suất theo món nấu\r\n    </h3>\r\n    <p>\r\n      Với bộ vi mạch cải tiến, bếp cho phép sử dụng mức công suất thấp nấu ổn định\r\n      (không bật tắt) trong thời gian dài, giữ thức ăn không bị cháy khét và tiết\r\n      kiệm điện, thuận tiện cho các món ninh hầm.\r\n    </p>\r\n    <p>\r\n      <a\r\n        class=\"preventdefault\"\r\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-12.jpg\"\r\n        onclick=\"return false;\"\r\n        ><img\r\n          alt=\"Bảng điều khiển cảm ứng -  Bếp điện từ đôi Bluestone ICB-6818\"\r\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-12.jpg\"\r\n          title=\"Bảng điều khiển cảm ứng -  Bếp điện từ đôi Bluestone ICB-6818\"></a>\r\n    </p>\r\n    <h3>\r\n      Chế độ hẹn giờ\r\n      nấu lên đến 99 phút cho người dùng thực sự làm chủ thời gian đun nấu, chuẩn bị\r\n      bữa ăn hoàn hảo cả khi bận rộn\r\n    </h3>\r\n    <p>\r\n      <a\r\n        class=\"preventdefault\"\r\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-13.jpg\"\r\n        onclick=\"return false;\"\r\n        ><img\r\n          alt=\"Hẹn giờ tiện lợi -  Bếp điện từ đôi Bluestone ICB-6818\"\r\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-13.jpg\"\r\n          title=\"Hẹn giờ tiện lợi -  Bếp điện từ đôi Bluestone ICB-6818\"></a>\r\n    </p>\r\n    <h3>\r\n      An toàn sử dụng hơn với tính năng khóa bảng điều khiển và chế độ tự ngắt khi\r\n      bếp quá tải\r\n    </h3>\r\n    <p>\r\n      <a\r\n        class=\"preventdefault\"\r\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-14.jpg\"\r\n        onclick=\"return false;\"\r\n        ><img\r\n          alt=\"Sử dụng an toàn -  Bếp điện từ đôi Bluestone ICB-6818\"\r\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-14.jpg\"\r\n          title=\"Sử dụng an toàn -  Bếp điện từ đôi Bluestone ICB-6818\"></a>\r\n    </p>\r\n    <p>Lưu ý:</p>\r\n    <p>\r\n      Sản phẩm có công suất 4000W, cần lắp đặt thêm các vật tư để đảm bảo an toàn\r\n      hơn trong quá trình sử dụng. Mua ngay ở Điện máy XANH để được miễn phí công\r\n      lắp đặt và đảm bảo an toàn bởi người có chuyên môn.\r\n    </p>\r\n    <p>\r\n      <a\r\n        class=\"preventdefault\"\r\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-15.jpg\"\r\n        onclick=\"return false;\"\r\n        ><img\r\n          alt=\"Lắp đặt sản phẩm - Bếp điện từ đôi lắp âm Bluestone ICB-6818\"\r\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-15.jpg\"\r\n          title=\"Lắp đặt sản phẩm - Bếp điện từ đôi lắp âm Bluestone ICB-6818\"></a>\r\n    </p>\r\n    <p>Lưu ý: bếp phù hợp với nồi/chảo có đường kính đáy&nbsp;từ 14 cm trở lên.</p>\r\n    <p>\r\n     Bếp từ BlueStone\r\n      thiết kế đẹp, dùng tiện lợi, đơn giản mà an toàn, phục vụ tích cực cho công\r\n      việc bếp núc của người nội trợ.\r\n    </p>\r\n     ', 24, 1500, 1),
(56, 3, 'Bếp từ đôi lắp âm Hafele HC-I2712A (536.61.716)', 40, 'P56_avt.jpg', 4, '<h3 style=\"text-align: justify\">\r\n    Bếp từ thương hiệu Hafele của Đức, sản xuất và nhập khẩu nguyên chiếc từ\r\n    Malaysia đảm bảo chất lượng, mẫu mã\r\n  </h3>\r\n  <p>\r\n    <a\r\n      class=\"preventdefault\"\r\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-052852.jpg\"\r\n      onclick=\"return false;\"\r\n      ><img\r\n        alt=\"Thương hiệu Đức, sản xuất Malaysia - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-052852.jpg\"\r\n        title=\"Thương hiệu Đức, sản xuất Malaysia - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"></a>\r\n  </p>\r\n  <h3 style=\"text-align: justify\">\r\n    Mặt kính Ceramic thương hiệu Schott Ceran (Đức) cao cấp có độ bền vượt trội\r\n  </h3>\r\n  <p style=\"text-align: justify\">\r\n    Chất liệu sáng bóng dễ&nbsp; lau chùi, khả năng chống trầy xước tốt, chịu lực và chịu nhiệt, ổn định hiệu suất đun\r\n    nấu trong suốt thời gian sử dụng.\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n  Bảng điều khiển&nbsp;cảm ứng trượt &nbsp;hỗ trợ 8 mức công suất tùy chỉnh theo nhu cầu, có tính năng ủ ấm tiện\r\n    lợi.\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n    Chức năng hẹn giờ nấu tối đa đến 99 phút giúp người dùng chủ động hơn trong\r\n    quá trình nấu nướng với&nbsp; bếp từ, có thể rảnh tay cho các công việc khác trong khi chờ thức ăn chín.\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n    <a\r\n      class=\"preventdefault\"\r\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a3.jpg\"\r\n      onclick=\"return false;\"\r\n      ><img\r\n        alt=\"Chất liệu cao cấp - Bếp từ đôi Hafele HC-I2712A\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a3.jpg\"\r\n        title=\"Chất liệu cao cấp - Bếp từ đôi Hafele HC-I2712A\"></a>\r\n  </p>\r\n  <h3 style=\"text-align: justify\">\r\n    Trang bị công nghệ Inverter tiết kiệm điện năng hiệu quả\r\n  </h3>\r\n  <p>\r\n    <a\r\n      class=\"preventdefault\"\r\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-054129.jpg\"\r\n      onclick=\"return false;\"\r\n      ><img\r\n        alt=\"Công nghệ Inverter - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-054129.jpg\"\r\n        title=\"Công nghệ Inverter - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"></a>\r\n  </p>\r\n  <h3 style=\"text-align: justify\">\r\n  Bếp từ Hafele\r\n    HC-I2712A sang trọng với kiểu lắp đặt âm tiện lợi, 2 vùng nấu kích\r\n    thước&nbsp;Ø195 mm\r\n  </h3>\r\n  <p style=\"text-align: justify\">\r\n    <a\r\n      class=\"preventdefault\"\r\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a1.jpg\"\r\n      onclick=\"return false;\"\r\n      ><img\r\n        alt=\"Lắp âm sang trọng - Bếp từ đôi Hafele HC-I2712A\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a1.jpg\"\r\n        title=\"Lắp âm sang trọng - Bếp từ đôi Hafele HC-I2712A\"></a>\r\n  </p>\r\n  <h3 style=\"text-align: justify\">\r\n  Bếp từ có tổng công suất 4200W, mỗi vùng nấu tối đa 2000W và đạt 2200W khi sử dụng Booster gia nhiệt nhanh\r\n  </h3>\r\n  <p style=\"text-align: justify\">\r\n    Chức năng Booster chỉ sử dụng được 1 vùng nấu trong 1 thời điểm, không thể sử\r\n    dụng Booster cùng lúc cho 2 vùng nấu.\r\n  </p>\r\n  <p>Với tổng công suất này, bếp sử dụng điện nối qua aptomat (CB).</p>\r\n  <p style=\"text-align: justify\">\r\n    <a\r\n      class=\"preventdefault\"\r\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a2-1.jpg\"\r\n      onclick=\"return false;\"\r\n      ><img\r\n        alt=\"Nấu ăn nhanh - Bếp từ đôi Hafele HC-I2712A\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a2-1.jpg\"\r\n        title=\"Nấu ăn nhanh - Bếp từ đôi Hafele HC-I2712A\"></a>\r\n  </p>\r\n  <h3 style=\"text-align: justify\">\r\n    Bếp từ kén nồi, cần chọn&nbsp; nồi &nbsp;chảo có đế nhiễm từ (gang, inox 430) để đảm bảo hiệu quả gia nhiệt, nấu\r\n    ăn nhanh\r\n  </h3>\r\n  <p>Lưu ý: bếp phù hợp với nồi/chảo có đường kính đáy&nbsp;12 - 26 cm.</p>\r\n  <p style=\"text-align: justify\">\r\n    <a\r\n      class=\"preventdefault\"\r\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-053455.jpg\"\r\n      onclick=\"return false;\"\r\n      ><img\r\n        alt=\"Loại nồi sử dụng - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-053455.jpg\"\r\n        title=\"Loại nồi sử dụng - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"></a>\r\n  </p>\r\n  <h3 style=\"text-align: justify\">Trang bị nhiều tính năng an toàn</h3>\r\n  <p style=\"text-align: justify\">\r\n    Bao gồm:&nbsp; Cảnh báo mặt bếp nóng, tự tắt khi không có nồi, nhận diện nồi chảo, âm báo nồi nấu không phù hợp\r\n    và khóa trẻ em.\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n    - Cảnh báo mặt bếp nóng với đèn báo chữ H tránh trường hợp người dùng vô tình\r\n    chạm phải gây nóng bỏng.\r\n  </p>\r\n  <p style=\"text-align: justify\">- Tự ngắt khi không có nồi trên bếp.</p>\r\n  <p style=\"text-align: justify\">\r\n    - Nhận diện kích cỡ đáy nồi/chảo:&nbsp;chỉ gia nhiệt trong khoảng đáy nồi được\r\n    quy định giúp tiết kiệm lượng điện năng tiêu thụ.\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n    - Âm báo nồi nấu không phù hợp: Giúp người dùng nhận biết và thay thế nồi chảo\r\n    khác để có thể sử dụng trên bếp từ.\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n    - Khóa trẻ em giúp vô hiệu hóa bảng điều khiển khi bếp từ đang hoạt động, đảm\r\n    bảo bếp vẫn hoạt động theo chế độ đã cài đặt mà không bị ảnh hưởng do vô tình\r\n    va chạm với bảng điều khiển, an tâm hơn khi khu vực đun nấu có trẻ nhỏ.&nbsp;\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n    <a\r\n      class=\"preventdefault\"\r\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a6.jpg\"\r\n      onclick=\"return false;\"\r\n      ><img\r\n        alt=\"An toàn - Bếp từ đôi Hafele HC-I2712A\"\r\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a6.jpg\"\r\n        title=\"An toàn - Bếp từ đôi Hafele HC-I2712A\"></a>\r\n  </p>\r\n  <p style=\"text-align: justify\"><strong>Lưu ý:</strong></p>\r\n  <p style=\"text-align: justify\">\r\n    - Đặt bếp ở vị trí chắc chắn, cân bằng, khoảng cách trống tối thiểu 50 mm xung\r\n    quanh lỗ cắt.\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n    - Khi gặp sự cố hoặc muốn thay đổi vị trí bếp, vui lòng gọi chuyên viên, không\r\n    tự ý làm để tránh rủi ro.\r\n  </p>\r\n  <p style=\"text-align: justify\">- Đọc kỹ hướng dẫn sử dụng sản phẩm.</p>\r\n  <p style=\"text-align: justify\">\r\n    - Không nên nấu ăn với công suất tối đa quá lâu vì dễ gây cháy thức ăn và lâu\r\n    dần có thể làm giảm tuổi thọ bếp.\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n    - Khi nấu ăn xong, nên để mặt bếp nguội và tiến hành vệ sinh bếp để giữ bếp\r\n    mới lâu.\r\n  </p>\r\n  <p style=\"text-align: justify\">\r\n  Bếp từ đôi Hafele HC-I2712A &nbsp;sản xuất và nhập khẩu từ Malaysia, hẹn giờ lên tới 99 phút, trang bị\r\n    nhiều tính năng an toàn và tiện ích hiện đại đáp ứng tốt nhu cầu nấu nướng\r\n    trong gia đình.\r\n  </p>\r\n   ', 12, 1400, 1),
(57, 5, 'Bếp từ hồng ngoại lắp âm Kangaroo KG852i', 14, 'P57_avt.jpg', 4, '<h3>\n    Thiết kế 2 vùng nấu 2 món cùng lúc: 1 vùng, 1 vùng&nbsp;bếp từ\n    giúp tiết kiệm thời gian chế biến thực phẩm\n  </h3>\n  <p>\n    Vùng từ chỉ sử dụng nồi có đáy nhiễm từ chất liệu inox 430 và gang, vùng hồng\n    ngoại không kén nồi.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035454.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Thiết kế 2 vùng nấu\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035454.jpg\"\n        title=\"Thiết kế 2 vùng nấu\"></a>\n  </p>\n  <h3> Bếp từ&nbsp;hồng ngoại &nbsp;Kangaroo với tổng công suất 4000W khi mở hai bếp cùng lúc\n  </h3>\n  <p>\n    Vùng từ 2000W, đạt 2400W khi sử dụng Booster&nbsp; gia nhiệt nhanh, vùng hồng ngoại 2000W.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035546.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Tổng công suất 3600W\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035546.jpg\"\n        title=\"Tổng công suất 3600W\"></a>\n  </p>\n  <h3>\n    Bảng điều khiển cảm ứng trượt, màn hình hiển thị rõ ràng, dễ dàng thao tác chỉ với cái trượt nhẹ\n  </h3>\n  <p>\n    Chức năng hẹn giờ &nbsp;giúp&nbsp;linh hoạt trong quá trình nấu, phù hợp với các món ninh, hầm,\n    om,... và bếp&nbsp;sẽ tự tắt sau khi hoàn thành.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035806.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Bảng điều khiển cảm ứng trượt đi kèm chức năng hẹn giờ\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035806.jpg\"\n        title=\"Bảng điều khiển cảm ứng trượt đi kèm chức năng hẹn giờ\"></a>\n  </p>\n  <h3>\n    Bếp từ Kangaroo &nbsp;sở hữu các tính năng an toàn, tăng độ bền sản phẩm và đảm bảo an toàn\n    cho người sử dụng\n  </h3>\n  <p>- Tính năng dừng bếp tạm thời khi đang gián đoạn với một công việc khác.</p>\n  <p>\n    - Tự ngắt khi bếp nóng quá tải, khi không có nồi giúp duy trì độ bền bỉ cho\n    bếp.\n  </p>\n  <p>\n    -&nbsp;Chức năng khóa bảng điều khiển khi kích hoạt sẽ vô hiệu hóa toàn bàn\n    phím ngăn người dùng thay đổi các cài đặt trước đó, bảo vệ an toàn cho gia\n    đình có trẻ nhỏ.\n  </p>\n  <p>- Tự nhận diện kích cỡ đáy nồi giúp hoạt động ổn định và hiệu quả.</p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035904.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Bếp sở hữu nhiều tính năng an toàn\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035904.jpg\"\n        title=\"Bếp sở hữu nhiều tính năng an toàn\"></a>\n  </p>\n  <h3>\n    Mặt kính Crystal (Trung Quốc) khả năng chịu nhiệt tốt với độ sáng bóng cao, làm sạch đơn giản\n  </h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-10-2.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Mặt bếp - Bếp từ hồng ngoại lắp âm Kangaroo KG852i \"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-10-2.jpg\"\n        title=\"Mặt bếp - Bếp từ hồng ngoại lắp âm Kangaroo KG852i \"></a>\n  </p>\n  <p><strong>Lưu ý:</strong></p>\n  <p>- Sử dụng với nguồn điện áp ổn định để kéo dài tuổi thọ bếp.</p>\n  <p>- Xem kỹ hướng dẫn được nhà sản xuất cung cấp để dùng đúng cách, an toàn.</p>\n  <p>\n    - Mặt bếp không sử dụng vật sắc nhọn để cạo vết bẩn hoặc dùng búi sắt vệ sinh\n    vì dễ làm trầy xước.\n  </p>\n  <p>\n  Bếp từ hồng ngoại lắp âm Kangaroo KG852i&nbsp; thiết kế sang trọng, chất lượng cao với những tính năng an toàn, là lựa chọn\n    tuyệt vời cho mọi gia đình hiện đại.\n  </p>', 12, 1300, 1),
(58, 3, 'BẾP TỪ ĐÔI LORCA TA 1008 VN', 48, 'P58_avt.jpg', 4, '<h3>Bếp từ đôi Lorca TA 1008 VN</h3>\r\n\r\n<p><strong>Giới thiệu:</strong><br>\r\nBếp từ Lorca TA-1008VN là dòng bếp từ đôi cao cấp được lắp ráp tại Việt Nam, sở hữu thiết kế đẹp mắt, bền bỉ và dễ sử dụng. Đây là lựa chọn phù hợp cho không gian bếp hiện đại, mang lại trải nghiệm nấu nướng tiện lợi và an toàn.\r\n</p>\r\n\r\n<h4>THIẾT KẾ: HIỆN ĐẠI – SANG TRỌNG</h4>\r\n\r\n<p><strong>Mặt kính cao cấp</strong><br>\r\nBếp sử dụng mặt kính EURO PLATINUM với thiết kế vát cạnh sang trọng. Chất liệu sứ tinh thể chịu nhiệt tốt, hạn chế nứt vỡ, ít bám bẩn và dễ dàng lau chùi. Bề mặt kính có họa tiết chấm bi tăng tính thẩm mỹ và chống trơn trượt khi sử dụng.\r\n</p>\r\n\r\n<h4>CÔNG NGHỆ & CƠ CHẾ HOẠT ĐỘNG</h4>\r\n\r\n<p><strong>Công nghệ Inverter tiết kiệm điện</strong><br>\r\nBếp tích hợp công nghệ Smart Inverter giúp tiết kiệm điện năng hiệu quả, duy trì mức nhiệt ổn định khi nấu và đặc biệt có khả năng đun liu riu mà không bị ngắt quãng như bếp thông thường.\r\n</p>\r\n\r\n<p><strong>Cảm ứng thông minh</strong><br>\r\nBảng điều khiển cảm ứng trượt Slider nhạy bén, dễ thao tác với nhiều mức công suất linh hoạt. Bếp tự động nhận diện nồi và chỉ hoạt động khi có nồi đặt lên, đảm bảo an toàn và tiết kiệm năng lượng.\r\n</p>\r\n\r\n<p><strong>Booster nấu nhanh</strong><br>\r\nChức năng Booster giúp tăng nhiệt nhanh chóng, hỗ trợ đun nấu trong thời gian ngắn mà vẫn đảm bảo an toàn.\r\n</p>\r\n\r\n<p><strong>Hâm nóng – giữ nhiệt</strong><br>\r\nChức năng giữ ấm giúp duy trì nhiệt độ ổn định cho món ăn, hạn chế việc phải hâm lại nhiều lần, đặc biệt tiện lợi trong thời tiết lạnh.\r\n</p>\r\n\r\n<p><strong>Tăng nhiệt nhanh</strong><br>\r\nBếp có khả năng gia nhiệt nhanh, giúp rút ngắn thời gian nấu nướng và nâng cao hiệu quả sử dụng trong gia đình.\r\n</p>\r\n\r\n<p><strong>Chế độ nấu đa dạng</strong><br>\r\nTích hợp nhiều chế độ nấu như chiên xào, rã đông, nấu cơm giúp việc chế biến món ăn trở nên đơn giản và tiện lợi hơn.\r\n</p>\r\n\r\n<h4>TÍNH NĂNG AN TOÀN</h4>\r\n\r\n<p><strong>Khóa trẻ em</strong><br>\r\nGiúp vô hiệu hóa bảng điều khiển, tránh thay đổi cài đặt ngoài ý muốn và đảm bảo an toàn cho gia đình có trẻ nhỏ.\r\n</p>\r\n\r\n<p><strong>Chống tràn</strong><br>\r\nKhi phát hiện nước tràn vào khu vực điều khiển, bếp sẽ tự động ngắt và cảnh báo để đảm bảo an toàn.\r\n</p>\r\n\r\n<p><strong>Cảnh báo nhiệt dư</strong><br>\r\nHiển thị cảnh báo khi mặt bếp còn nóng, giúp tránh nguy cơ bỏng khi sử dụng.\r\n</p>\r\n\r\n<p><strong>Tự động tắt</strong><br>\r\nBếp sẽ tự ngắt khi không có nồi hoặc khi không sử dụng, giúp tiết kiệm điện và tăng độ an toàn.\r\n</p>\r\n', 12, 100, 1),
(59, 25, 'Máy vắt cam Philips HR2738/00', 15, 'P59_avt.jpg', 5, '<div class=\"product-description\">\n    <h2>Máy vắt cam Philips HR2738/00 – Nhỏ gọn, tiện lợi, dễ sử dụng</h2>\n\n    <p>\n        Máy vắt cam Philips HR2738/00 sở hữu thiết kế nhỏ gọn cùng khả năng vận hành đơn giản, \n        giúp bạn dễ dàng chuẩn bị những ly nước cam tươi ngon mỗi ngày cho cả gia đình.\n    </p>\n\n    <h3>Thiết kế nhỏ gọn, tiết kiệm không gian</h3>\n    <p>\n        Sản phẩm có kiểu dáng nhỏ gọn, hiện đại, phù hợp với nhiều không gian bếp khác nhau.\n    </p>\n\n    <p>\n        Kích thước gọn nhẹ giúp máy dễ dàng đặt trên bàn bếp và thuận tiện cất giữ sau khi sử dụng mà không chiếm nhiều diện tích.\n    </p>\n\n    <h3>Vận hành hiệu quả với công suất 25W</h3>\n    <p>\n        Máy hoạt động với công suất 25W kết hợp hệ thống vắt tự động đảo chiều, \n        giúp tăng hiệu quả ép nước và tận dụng tối đa lượng nước có trong trái cây.\n    </p>\n\n    <p>\n        Cơ chế vận hành đơn giản giúp người dùng tiết kiệm thời gian khi chuẩn bị nước ép hằng ngày.\n    </p>\n\n    <h3>Ly chứa dung tích 500ml tiện dụng</h3>\n    <p>\n        Máy được trang bị ly chứa nước ép dung tích 500 ml, \n        đáp ứng nhu cầu sử dụng cho cá nhân hoặc gia đình nhỏ.\n    </p>\n\n    <p>\n        Thiết kế vòi chảy thông minh giúp hạn chế tình trạng nhỏ giọt, \n        giữ khu vực sử dụng luôn sạch sẽ và gọn gàng.\n    </p>\n\n    <h3>Dễ dàng tháo rời và vệ sinh</h3>\n    <p>\n        Các bộ phận của máy có thể tháo rời thuận tiện cho việc vệ sinh sau khi sử dụng.\n    </p>\n\n    <p>\n        Người dùng có thể làm sạch nhanh chóng hoặc cho các bộ phận vào máy rửa chén để tiết kiệm thời gian.\n    </p>\n\n    <h3>An toàn và tiện lợi khi sử dụng</h3>\n    <p>\n        Máy được thiết kế với hệ thống lưu trữ dây điện gọn gàng bên dưới thân máy, \n        giúp tiết kiệm không gian và tăng tính thẩm mỹ khi bảo quản.\n    </p>\n\n    <p>\n        Kết cấu chắc chắn cùng thao tác sử dụng đơn giản mang lại sự an toàn và thuận tiện trong quá trình sử dụng hằng ngày.\n    </p>\n\n    <p>\n        Máy vắt cam Philips HR2738/00 là lựa chọn phù hợp cho những gia đình yêu thích các loại nước ép trái cây tươi, \n        nhờ thiết kế nhỏ gọn, dễ sử dụng, dễ vệ sinh và khả năng ép nước hiệu quả.\n    </p>\n</div>', 12, 1000, 1),
(60, 26, 'Máy xay thịt Philips HR2505/00', 15, 'P60_avt.jpg', 4.2, '```html\r\n<h2>Máy xay thịt Philips HR2505/00</h2>\r\n\r\n<p>\r\nMáy xay thịt Philips HR2505/00 được thiết kế hiện đại với gam màu sang trọng, kích thước nhỏ gọn giúp dễ dàng bố trí trong nhiều không gian bếp. Sản phẩm hỗ trợ xay thực phẩm nhanh chóng, tiết kiệm thời gian chế biến cho gia đình.\r\n</p>\r\n\r\n<h3>Công suất hoạt động mạnh mẽ</h3>\r\n<p>\r\nMáy vận hành với công suất 500W, giúp xay nhuyễn thịt, cá, rau củ và nhiều loại thực phẩm khác một cách nhanh chóng. Động cơ hoạt động ổn định, hỗ trợ tối ưu công việc nội trợ hằng ngày.\r\n</p>\r\n\r\n<h3>Lưỡi dao inox sắc bén</h3>\r\n<p>\r\nLưỡi dao được làm từ inox không gỉ cao cấp, có độ sắc bén cao, chống ăn mòn tốt và đảm bảo độ bền lâu dài. Nhờ đó thực phẩm được xay nhuyễn đồng đều và hiệu quả hơn.\r\n</p>\r\n\r\n<h3>Cối xay dung tích lớn</h3>\r\n<p>\r\nMáy được trang bị cối xay dung tích 1.1 lít, cho phép xay lượng thực phẩm lớn trong một lần sử dụng, đáp ứng tốt nhu cầu chế biến thực phẩm của gia đình.\r\n</p>\r\n\r\n<h3>Thiết kế tiện lợi</h3>\r\n<p>\r\nCác bộ phận của máy được thiết kế dễ dàng tháo lắp, thuận tiện cho việc vệ sinh và bảo quản sau khi sử dụng. Kiểu dáng nhỏ gọn giúp tiết kiệm không gian lưu trữ.\r\n</p>\r\n\r\n<p>\r\nMáy xay thịt Philips HR2505/00 là lựa chọn phù hợp cho gia đình nhờ công suất 500W mạnh mẽ, lưỡi dao inox sắc bén và cối xay dung tích lớn 1.1 lít, giúp việc chuẩn bị thực phẩm trở nên nhanh chóng và thuận tiện hơn.\r\n</p>\r\n```\r\n', 12, 1000, 1),
(61, 28, 'Lò vi sóng mặt gương 27L Toshiba MW3-AC27PE(BM)VN', 7, 'P61_avt.jpg', 4, '```html\r\n<h2>Lò vi sóng mặt gương 27L Toshiba MW3-AC27PE(BM)VN</h2>\r\n\r\n<p>\r\nLò vi sóng Toshiba MW3-AC27PE(BM)VN sở hữu thiết kế mặt gương sang trọng cùng dung tích 27 lít, đáp ứng tốt nhu cầu nấu nướng của gia đình. Sản phẩm được tích hợp chức năng vi sóng, nướng và nướng đối lưu, giúp chế biến đa dạng món ăn nhanh chóng, giữ trọn hương vị thơm ngon.\r\n</p>\r\n\r\n<h3>Thiết kế hiện đại, dung tích lớn</h3>\r\n<p>\r\nLò có thiết kế nhỏ gọn, tối ưu không gian bếp nhưng vẫn sở hữu dung tích lên đến 27 lít, phù hợp để chế biến các món ăn gia đình như bánh, pizza, gà nướng và nhiều loại thực phẩm khác. Mặt gương cao cấp mang lại vẻ đẹp hiện đại và sang trọng cho không gian sử dụng.\r\n</p>\r\n\r\n<h3>Công suất mạnh mẽ, nấu ăn nhanh chóng</h3>\r\n<p>\r\nSản phẩm hoạt động với công suất vi sóng 900W, công suất nướng 1000W và công suất nướng đối lưu lên đến 2100W. Sự kết hợp giữa sóng vi ba và công nghệ nướng đối lưu giúp thực phẩm chín đều từ trong ra ngoài, rút ngắn thời gian chế biến và giữ nguyên hương vị hấp dẫn.\r\n</p>\r\n\r\n<h3>Đa dạng chế độ nấu</h3>\r\n<p>\r\nLò được tích hợp các chức năng vi sóng, nướng và nướng đối lưu, mang lại sự linh hoạt trong quá trình nấu nướng. Người dùng có thể dễ dàng chế biến từ các món nướng, bánh ngọt cho đến các món hâm nóng, rã đông thực phẩm hằng ngày.\r\n</p>\r\n\r\n<h3>9 thực đơn chiên tự động tiện lợi</h3>\r\n<p>\r\nToshiba MW3-AC27PE(BM)VN được trang bị 9 chương trình chiên tự động giúp chế biến các món ăn giòn ngon mà không cần sử dụng nhiều dầu mỡ. Chỉ cần lựa chọn thực đơn phù hợp, lò sẽ tự động cài đặt thời gian và công suất tối ưu.\r\n</p>\r\n\r\n<h3>10 menu nấu tự động thông minh</h3>\r\n<p>\r\nSản phẩm tích hợp 10 chương trình nấu tự động hỗ trợ chế biến nhiều món ăn khác nhau như nướng, làm bánh, hầm hoặc hâm nóng thực phẩm. Các chương trình được thiết lập sẵn giúp người dùng tiết kiệm thời gian và thao tác dễ dàng hơn.\r\n</p>\r\n\r\n<h3>Khoang lò thép không gỉ bền bỉ</h3>\r\n<p>\r\nKhoang lò được làm từ thép không gỉ cao cấp, có khả năng chịu nhiệt tốt, hạn chế bám bẩn và dễ dàng vệ sinh sau khi sử dụng. Chỉ với một chiếc khăn mềm, người dùng có thể nhanh chóng lau sạch dầu mỡ và cặn thức ăn.\r\n</p>\r\n\r\n<p>\r\nLò vi sóng mặt gương Toshiba MW3-AC27PE(BM)VN là lựa chọn lý tưởng cho gia đình nhờ dung tích 27 lít rộng rãi, công suất mạnh mẽ, tích hợp vi sóng, nướng và nướng đối lưu cùng 9 thực đơn chiên tự động và 10 menu nấu sẵn, mang đến sự tiện lợi tối đa trong quá trình nấu nướng hằng ngày.\r\n</p>\r\n```\r\n', 12, 950, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(62, 27, 'Lò vi sóng có nướng 24L Panasonic NN-GM34NBYUE', 10, 'P62_avt.jpg\r\n', 4.3, '<h2>Lò vi sóng có nướng Panasonic NN-GM34NBYUE 24 lít</h2>\r\n\r\n<p>\r\nLò vi sóng có nướng Panasonic NN-GM34NBYUE sở hữu thiết kế tối giản, hiện đại cùng dung tích 24 lít đáp ứng tốt nhu cầu sử dụng của gia đình. Sản phẩm tích hợp chức năng vi sóng và nướng, giúp chế biến đa dạng món ăn nhanh chóng, tiện lợi và thơm ngon hơn mỗi ngày.\r\n</p>\r\n\r\n<h3>Thiết kế tối giản, tinh tế</h3>\r\n<ul>\r\n    <li>Thiết kế hiện đại với kiểu dáng gọn gàng, phù hợp nhiều không gian bếp.</li>\r\n    <li>Màu sắc trang nhã, góp phần tăng tính thẩm mỹ cho căn bếp gia đình.</li>\r\n    <li>Dung tích 24 lít đáp ứng nhu cầu nấu nướng hằng ngày cho gia đình.</li>\r\n</ul>\r\n\r\n<h3>Chức năng nấu kép tiện lợi</h3>\r\n<ul>\r\n    <li>Kết hợp vi sóng và nướng giúp thực phẩm chín nhanh cả bên trong lẫn bên ngoài.</li>\r\n    <li>Chức năng vi sóng làm nóng và nấu chín thực phẩm hiệu quả.</li>\r\n    <li>Chức năng nướng giúp món ăn vàng giòn, hấp dẫn hơn.</li>\r\n    <li>Hai chế độ hoạt động luân phiên giúp rút ngắn thời gian chế biến và giữ trọn hương vị món ăn.</li>\r\n</ul>\r\n\r\n<h3>Công suất mạnh mẽ, điều chỉnh linh hoạt</h3>\r\n<ul>\r\n    <li>Công suất vi sóng tối đa lên đến 900W giúp nấu ăn nhanh chóng.</li>\r\n    <li>Trang bị 5 mức công suất khác nhau, dễ dàng lựa chọn theo từng loại thực phẩm.</li>\r\n    <li>Đáp ứng tốt các nhu cầu hâm nóng, nấu chín và rã đông thực phẩm.</li>\r\n</ul>\r\n\r\n<h3>Điều khiển cơ học đơn giản</h3>\r\n<ul>\r\n    <li>Sử dụng núm xoay cơ học dễ thao tác.</li>\r\n    <li>Phù hợp với mọi đối tượng sử dụng, kể cả người lớn tuổi.</li>\r\n    <li>Chỉ cần xoay núm đến chế độ mong muốn là có thể bắt đầu nấu nướng.</li>\r\n</ul>\r\n\r\n<h3>Rã đông nhanh chóng và hiệu quả</h3>\r\n<ul>\r\n    <li>Chức năng rã đông theo trọng lượng thực phẩm giúp tiết kiệm thời gian.</li>\r\n    <li>Thực phẩm được rã đông đồng đều, hạn chế tình trạng chín mép hoặc còn đông bên trong.</li>\r\n    <li>Giữ được kết cấu và hương vị tự nhiên của thực phẩm sau khi rã đông.</li>\r\n</ul>\r\n\r\n<h3>Tiện ích nổi bật</h3>\r\n<ul>\r\n    <li>Kết hợp chức năng vi sóng và nướng trong cùng một thiết bị.</li>\r\n    <li>5 mức công suất tùy chỉnh linh hoạt.</li>\r\n    <li>Rã đông nhanh theo trọng lượng thực phẩm.</li>\r\n    <li>Điều khiển cơ học dễ sử dụng.</li>\r\n</ul>\r\n\r\n<p>\r\nLò vi sóng có nướng Panasonic NN-GM34NBYUE 24 lít là lựa chọn lý tưởng cho những gia đình cần một thiết bị nấu nướng đa năng, dễ sử dụng và bền bỉ. Với công suất mạnh mẽ, chức năng nấu kép tiện lợi cùng khả năng rã đông hiệu quả, sản phẩm giúp việc chuẩn bị bữa ăn trở nên nhanh chóng và đơn giản hơn.\r\n</p>', 12, 950, 1),
(63, 29, 'Bộ nồi chảo inox 304 Sunhouse SHG601', 24, 'P63_avt.jpg', 4, '<h2>Bộ nồi chảo inox 304 Sunhouse SHG601</h2>\r\n\r\n<p>\r\nBộ nồi chảo inox 304 Sunhouse SHG601 là bộ dụng cụ nấu ăn tiện dụng dành cho mọi gia đình. Sản phẩm được làm từ inox 304 cao cấp, thiết kế bền đẹp cùng đáy 5 lớp truyền nhiệt nhanh, hỗ trợ nấu ăn hiệu quả trên nhiều loại bếp, đặc biệt là bếp từ.\r\n</p>\r\n\r\n<h3>Thiết kế tiện dụng cho gia đình</h3>\r\n<ul>\r\n    <li>Bộ sản phẩm gồm 3 món: 1 quánh và 2 nồi đáp ứng đa dạng nhu cầu nấu nướng hằng ngày.</li>\r\n    <li>Kiểu dáng hiện đại, sang trọng phù hợp với nhiều không gian bếp.</li>\r\n    <li>Tay cầm chắc chắn giúp thao tác thuận tiện và an toàn khi sử dụng.</li>\r\n</ul>\r\n\r\n<h3>Chất liệu inox 304 cao cấp</h3>\r\n<ul>\r\n    <li>Thân nồi được làm từ inox 304 bền bỉ, chống gỉ sét hiệu quả.</li>\r\n    <li>An toàn cho sức khỏe, không làm ảnh hưởng đến hương vị thực phẩm.</li>\r\n    <li>Bề mặt sáng bóng, dễ dàng vệ sinh sau khi sử dụng.</li>\r\n</ul>\r\n\r\n<h3>Đáy 5 lớp truyền nhiệt vượt trội</h3>\r\n<ul>\r\n    <li>Cấu tạo đáy 5 lớp giúp truyền nhiệt nhanh và tỏa nhiệt đồng đều.</li>\r\n    <li>Giúp thực phẩm chín đều, hạn chế cháy khét trong quá trình nấu.</li>\r\n    <li>Tiết kiệm thời gian và năng lượng hiệu quả.</li>\r\n</ul>\r\n\r\n<h3>Giữ nhiệt tốt, nấu ăn ngon hơn</h3>\r\n<ul>\r\n    <li>Thân nồi dày dặn giúp giữ nhiệt lâu.</li>\r\n    <li>Hỗ trợ giữ trọn hương vị và dưỡng chất trong thực phẩm.</li>\r\n    <li>Thích hợp cho các món hầm, luộc, nấu canh hoặc kho.</li>\r\n</ul>\r\n\r\n<h3>Tương thích nhiều loại bếp</h3>\r\n<ul>\r\n    <li>Bắt từ nhanh và ổn định trên bếp từ.</li>\r\n    <li>Sử dụng tốt với bếp gas, bếp hồng ngoại và các loại bếp điện khác.</li>\r\n    <li>Phù hợp cả với các dòng bếp từ nhập khẩu có yêu cầu nhận diện đáy nồi cao.</li>\r\n</ul>\r\n\r\n<h3>Ưu điểm nổi bật</h3>\r\n<ul>\r\n    <li>Bộ 3 món tiện dụng cho gia đình.</li>\r\n    <li>Inox 304 cao cấp, bền đẹp.</li>\r\n    <li>Đáy 5 lớp truyền nhiệt nhanh, giữ nhiệt tốt.</li>\r\n    <li>Bắt từ nhạy, sử dụng trên nhiều loại bếp.</li>\r\n    <li>Dễ dàng vệ sinh và bảo quản.</li>\r\n</ul>\r\n\r\n<p>\r\nBộ nồi chảo inox 304 Sunhouse SHG601 là lựa chọn lý tưởng cho căn bếp hiện đại với thiết kế sang trọng, chất liệu cao cấp và khả năng truyền nhiệt hiệu quả. Sản phẩm giúp việc nấu nướng trở nên dễ dàng, tiết kiệm thời gian và mang đến những bữa ăn thơm ngon cho cả gia đình.\r\n</p>', 12, 950, 1),
(64, 30, 'Chảo inox Impact Sunhouse ECO IN26M3', 24, 'P64_avt.jpg', 4, '<h2>Chảo inox Impact Sunhouse ECO IN26M3</h2>\r\n\r\n<p>\r\nChảo inox Impact Sunhouse ECO IN26M3 sở hữu thiết kế hiện đại, bền bỉ với chất liệu inox cao cấp cùng công nghệ dập đáy Impact Bonding tiên tiến. Sản phẩm giúp truyền nhiệt nhanh, giữ nhiệt tốt và tương thích với mọi loại bếp, mang đến trải nghiệm nấu nướng tiện lợi cho mọi gia đình. \r\n</p>\r\n\r\n<h3>Thiết kế sang trọng, bền đẹp</h3>\r\n<ul>\r\n    <li>Thân chảo được làm từ inox 430 sáng bóng, mang lại vẻ đẹp hiện đại cho không gian bếp.</li>\r\n    <li>Bề mặt inox bền bỉ, hạn chế gỉ sét và dễ dàng vệ sinh sau khi sử dụng.</li>\r\n    <li>Đường kính 26 cm phù hợp cho nhu cầu chiên, xào thực phẩm hằng ngày.</li>\r\n</ul>\r\n\r\n<h3>Tay cầm Bakelite cách nhiệt an toàn</h3>\r\n<ul>\r\n    <li>Tay cầm được làm từ nhựa Bakelite chịu nhiệt tốt.</li>\r\n    <li>Chống nóng hiệu quả, hạn chế bỏng khi nấu nướng.</li>\r\n    <li>Thiết kế chắc chắn, cầm nắm thoải mái và thuận tiện khi di chuyển chảo.</li>\r\n</ul>\r\n\r\n<h3>Đáy Impact Bonding truyền nhiệt vượt trội</h3>\r\n<ul>\r\n    <li>Đáy từ được dập bằng công nghệ Impact Bonding giúp đáy chảo phẳng và bền chắc.</li>\r\n    <li>Hạn chế cong vênh, lồi lõm sau thời gian dài sử dụng.</li>\r\n    <li>Truyền nhiệt nhanh và đều, giúp thực phẩm chín ngon hơn và tiết kiệm năng lượng.</li>\r\n</ul>\r\n\r\n<h3>Cấu tạo 3 lớp liền đáy cao cấp</h3>\r\n<ul>\r\n    <li>Cấu tạo gồm Inox 430 – Nhôm – Inox 430.</li>\r\n    <li>Khả năng truyền và giữ nhiệt hiệu quả.</li>\r\n    <li>Tăng độ bền cho sản phẩm và tối ưu hiệu suất nấu nướng.</li>\r\n</ul>\r\n\r\n<h3>Lớp chống dính tự nhiên an toàn</h3>\r\n<ul>\r\n    <li>Sau khi tôi chảo đúng cách sẽ hình thành lớp chống dính tự nhiên.</li>\r\n    <li>Không bong tróc như các lớp chống dính thông thường.</li>\r\n    <li>An toàn cho sức khỏe và thuận tiện trong quá trình chế biến món ăn.</li>\r\n</ul>\r\n\r\n<h3>Sử dụng trên mọi loại bếp</h3>\r\n<ul>\r\n    <li>Đáy từ bắt nhiệt nhanh và hiệu quả.</li>\r\n    <li>Tương thích với bếp từ, bếp gas, bếp hồng ngoại và bếp điện.</li>\r\n    <li>Hiệu suất bắt từ cao, đáp ứng tốt nhu cầu nấu nướng hiện đại.</li>\r\n</ul>\r\n\r\n<h3>Ưu điểm nổi bật</h3>\r\n<ul>\r\n    <li>Inox 430 sáng bóng, bền đẹp.</li>\r\n    <li>Đáy Impact Bonding chống cong vênh hiệu quả.</li>\r\n    <li>Cấu tạo 3 lớp liền đáy truyền nhiệt nhanh.</li>\r\n    <li>Lớp chống dính tự nhiên an toàn cho sức khỏe.</li>\r\n    <li>Dùng được trên mọi loại bếp.</li>\r\n    <li>Tay cầm Bakelite chống nóng tiện lợi.</li>\r\n</ul>\r\n\r\n<p>\r\nChảo inox Impact Sunhouse ECO IN26M3 là lựa chọn phù hợp cho những gia đình yêu thích đồ dùng nhà bếp bền bỉ và an toàn. Với công nghệ Impact Bonding hiện đại, cấu tạo 3 lớp cao cấp cùng khả năng sử dụng trên mọi loại bếp, sản phẩm giúp việc nấu nướng trở nên dễ dàng và hiệu quả hơn. \r\n</p>', 12, 1200, 1),
(65, 31, 'Nồi inox 5 đáy cao cấp 24cm Sunhouse SHG24324', 24, 'P65_avt.png', 4, '<h2>Nồi inox 5 đáy cao cấp 24cm Sunhouse SHG24324</h2>\r\n\r\n<p>\r\nNồi inox 5 đáy cao cấp Sunhouse SHG24324 sở hữu thiết kế hiện đại, sang trọng cùng đường kính 24 cm phù hợp cho nhu cầu nấu ăn hằng ngày của gia đình từ 4 - 5 thành viên. Sản phẩm được làm từ inox cao cấp, đáy 5 lớp bền bỉ giúp truyền nhiệt nhanh, giữ nhiệt tốt và sử dụng hiệu quả trên nhiều loại bếp. :contentReference[oaicite:0]{index=0}\r\n</p>\r\n\r\n<h3>Thiết kế hiện đại, sang trọng</h3>\r\n<ul>\r\n    <li>Kiểu dáng tinh tế với bề mặt inox sáng bóng, góp phần làm nổi bật không gian bếp.</li>\r\n    <li>Đường kính 24 cm phù hợp để nấu canh, súp, lẩu hoặc luộc thực phẩm cho cả gia đình.</li>\r\n    <li>Nắp kính trong suốt giúp quan sát thực phẩm trong quá trình nấu mà không cần mở nắp.</li>\r\n</ul>\r\n\r\n<h3>Chất liệu inox cao cấp bền bỉ</h3>\r\n<ul>\r\n    <li>Thân nồi làm từ inox cao cấp có độ bền cao, hạn chế oxy hóa và dễ vệ sinh.</li>\r\n    <li>Bề mặt sáng bóng, an toàn cho sức khỏe người sử dụng.</li>\r\n    <li>Chống bám bẩn tốt, giữ vẻ đẹp lâu dài theo thời gian. :contentReference[oaicite:1]{index=1}</li>\r\n</ul>\r\n\r\n<h3>Đáy 5 lớp truyền nhiệt hiệu quả</h3>\r\n<ul>\r\n    <li>Cấu tạo đáy 5 lớp giúp hấp thụ và truyền nhiệt nhanh chóng.</li>\r\n    <li>Phân bổ nhiệt đồng đều, hạn chế tình trạng cháy khét thực phẩm.</li>\r\n    <li>Giữ nhiệt tốt, giúp món ăn chín đều và tiết kiệm năng lượng khi nấu. :contentReference[oaicite:2]{index=2}</li>\r\n</ul>\r\n\r\n<h3>Tay cầm và nắp kính tiện lợi</h3>\r\n<ul>\r\n    <li>Tay cầm chắc chắn, hỗ trợ di chuyển nồi thuận tiện.</li>\r\n    <li>Nắp kính chịu nhiệt bền bỉ, dễ dàng theo dõi quá trình chế biến món ăn.</li>\r\n    <li>Thiết kế phù hợp cho nhu cầu nấu nướng hằng ngày.</li>\r\n</ul>\r\n\r\n<h3>Sử dụng trên nhiều loại bếp</h3>\r\n<ul>\r\n    <li>Tương thích với bếp từ, bếp gas và bếp hồng ngoại.</li>\r\n    <li>Đáy từ bắt nhiệt nhanh, tối ưu hiệu suất nấu nướng.</li>\r\n    <li>Đáp ứng tốt nhu cầu sử dụng trong mọi không gian bếp hiện đại. :contentReference[oaicite:3]{index=3}</li>\r\n</ul>\r\n\r\n<h3>Ưu điểm nổi bật</h3>\r\n<ul>\r\n    <li>Đường kính 24 cm phù hợp gia đình 4 - 5 người.</li>\r\n    <li>Đáy 5 lớp truyền nhiệt nhanh, giữ nhiệt lâu.</li>\r\n    <li>Inox cao cấp sáng bóng, bền đẹp.</li>\r\n    <li>Nắp kính tiện quan sát thực phẩm.</li>\r\n    <li>Sử dụng được trên mọi loại bếp.</li>\r\n    <li>Dễ dàng vệ sinh và bảo quản.</li>\r\n</ul>\r\n\r\n<p>\r\nNồi inox 5 đáy cao cấp Sunhouse SHG24324 là lựa chọn lý tưởng cho gia đình cần một chiếc nồi bền đẹp, truyền nhiệt hiệu quả và sử dụng linh hoạt trên nhiều loại bếp. Với thiết kế sang trọng cùng cấu tạo đáy 5 lớp chắc chắn, sản phẩm giúp việc nấu nướng trở nên nhanh chóng và tiện lợi hơn mỗi ngày. :contentReference[oaicite:4]{index=4}\r\n</p>', 12, 1200, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `product_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_detail_name` varchar(100) NOT NULL,
  `product_detail_value` text DEFAULT NULL,
  `product_detail_unit` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`product_detail_id`, `product_id`, `product_detail_name`, `product_detail_value`, `product_detail_unit`) VALUES
(1, 1, 'Tên sản phẩm', 'Bếp Gas Đôi Dương Kính SUNHOUSE MMB3568', NULL),
(2, 1, 'Mã sản phẩm', 'MMB3568', NULL),
(3, 1, 'Loại ga sử dụng', 'LPG', NULL),
(4, 1, 'Trọng lượng', '7 KG', NULL),
(5, 1, 'Bảo hành ', '12 tháng', NULL),
(6, 1, 'Xuất xứ', 'Việt Nam', NULL),
(12, 2, 'Mã sản phẩm', 'ETG7287GKR', NULL),
(13, 2, 'Loại:', 'Bếp gas dương\r\nBếp Gas đôi', NULL),
(14, 2, 'Tiện ích', 'Mặt bếp dễ vệ sinh\r\nNấu nhanh không đen đáy nồi', NULL),
(15, 2, 'Sản xuất tại:', 'Trung Quốc', NULL),
(16, 2, 'Kích thước:', '710 x 410 mm', NULL),
(17, 2, 'Bề mặt:', 'Bằng kính cường lực sáng bóng, chịu nhiệt tốt', NULL),
(18, 2, 'Đầu đốt:', 'Hợp kim nhôm sơn vàng chịu nhiệt tốt', NULL),
(19, 2, 'Hệ thống đánh lửa:', 'Đánh lửa Magneto điều khiển bằng núm vặn linh hoạt, tiện dụng', NULL),
(20, 2, 'Bảo hành', '24 tháng', NULL),
(23, 3, 'Tên sản phẩm:', 'Bếp gas âm kính SUNHOUSE MAMA MMB6632', NULL),
(24, 3, 'Số lò nấu:', '2', NULL),
(25, 3, 'Hệ thống đánh lửa:', 'IC', NULL),
(26, 3, 'Chất liệu mặt bếp:', 'Kính cường lực', NULL),
(27, 3, 'Độ dày mặt bếp:', '7mm', NULL),
(28, 3, 'Kiềng bếp:', 'Thép tráng men', NULL),
(29, 3, 'PEP:', 'Đồng', NULL),
(30, 3, 'Cảm ứng ngắt gas:', 'Không', NULL),
(31, 3, 'Loại gas sử dụng:', 'LPG', NULL),
(32, 3, 'Kích thước sản phẩm', '720 x 410 x 145 (mm)', NULL),
(33, 3, 'Trọng lượng:', '11 KG', NULL),
(34, 4, 'Số lò nấu', '2', NULL),
(35, 4, 'Hệ thống đánh lửa', 'Magneto', NULL),
(36, 4, 'Chất liệu mặt bếp', 'Inox', NULL),
(37, 4, 'Độ dày mặt kính', 'Không kính', NULL),
(38, 4, 'Kiềng bếp', 'Thép tráng men', NULL),
(39, 4, 'Loại gas sử dụng', 'LPG', NULL),
(40, 4, 'Kích thước sản phẩm', '675 x 410 x 155 (mm)', NULL),
(41, 4, 'Trọng lượng', '5.78 kg', NULL),
(42, 4, 'Bảo hành', '18 tháng', NULL),
(44, 5, 'Số lò nấu', '2', NULL),
(45, 5, 'Hệ thống đánh lửa', 'IC', NULL),
(46, 5, 'Chất liệu mặt bếp', 'Kính cường lực', NULL),
(47, 5, 'Kiềng bếp	', 'Hợp kim thép phủ men chịu nhiệt', NULL),
(48, 5, 'PEP', 'Đồng thau', NULL),
(49, 5, 'Cảm ứng ngắt gas', 'Có', NULL),
(50, 5, 'Loại gas sử dụng', 'LPG', NULL),
(51, 5, 'Kích thước sản phẩm', '750 x 450 x 160 (mm)', NULL),
(52, 5, 'Trọng lượng', '10.3 kg', NULL),
(53, 5, 'Bảo hành', '24 tháng', NULL),
(55, 6, 'Loại sản phẩm\r\n\r\n', 'Bếp Gas Đơn\r\n\r\n', NULL),
(56, 6, 'Số lượng bếp nấu\r\n\r\n', '01 Bếp\r\n\r\n', NULL),
(57, 6, 'Mặt Bếp\r\n\r\n', 'Sơn tĩnh điện\r\n\r\n', NULL),
(58, 6, 'Hệ thống đánh lửa\r\n\r\n', 'Magneto\r\n\r\n', NULL),
(59, 6, 'Vòi phun lửa\r\n\r\n', '1', NULL),
(60, 6, 'Kích thước (RxSxC) (mm)\r\n\r\n', 'Ngang 38.5cm - Sâu 27.8cm - Cao 16cm\r\n\r\n', NULL),
(61, 6, 'Màu Sắc\r\n\r\n', 'Xám đen\r\n\r\n', NULL),
(62, 6, 'Kích thước - Khối lượng', 'Cao 91.1 cm - Ngang 53.7 cm - Sâu 55 cm - Nặng 29 kg', NULL),
(63, 6, 'Trọng lượng (Kg)\r\n\r\n', '2.4 Kg\r\n\r\n', NULL),
(64, 7, 'Loại sản phẩm', 'Bếp Gas Đơn\r\n\r\n', NULL),
(65, 7, 'Model', 'SHB212KT\r\n\r\n', NULL),
(66, 7, 'Mặt Bếp\r\n\r\n', 'Kính chịu lực chịu nhiệt\r\n\r\n', NULL),
(67, 7, 'Hệ thống đánh lửa\r\n\r\n', 'Magneto\r\n\r\n', NULL),
(68, 7, 'Tính năng khác\r\n\r\n', 'Họng thép chất liệu inox cao cấp\r\n\r\n', NULL),
(69, 7, 'Kích thước (RxSxC) (mm)\r\n\r\n', '365 x 291 x 127 (mm)\r\n\r\n', NULL),
(70, 7, 'Trọng lượng (Kg)\r\n\r\n', '2.4 kg\r\n\r\n', NULL),
(71, 7, 'Chất Liệu\r\n\r\n', 'Kiềng bếp : Kiềng tráng men siêu bền\r\n\r\n', NULL),
(72, 7, 'Bảo Hành\r\n\r\n', '12 tháng\r\n\r\n', NULL),
(73, 8, 'Model:', 'NH-S4136APF', NULL),
(74, 8, 'Loại bếp gas:', 'Bếp đơn', NULL),
(75, 8, 'Số bếp:', '1 bếp', NULL),
(76, 8, 'Đầu đốt:', 'Hợp kim nhôm', NULL),
(77, 8, 'Hệ thống đánh lửa:', 'Magneto', NULL),
(78, 8, 'Kích thước sản phẩm:', '140 x 400 x 292 mm', NULL),
(79, 8, 'Khối lượng sản phẩm (kg):', '1.7 kg', NULL),
(80, 8, 'Ngắt gas tự động:', 'Không', NULL),
(81, 8, 'Thời gian bảo hành:', '12 Tháng', NULL),
(82, 9, 'Số lò nấu', '1', NULL),
(83, 9, 'Hệ thống đánh lửa', 'Magneto', NULL),
(84, 9, 'Chất liệu mặt bếp', 'Mặt bếp chịu lực chịu nhiệt', NULL),
(85, 9, 'Kiềng bếp', 'Kiềng tráng men siêu bền', NULL),
(86, 9, 'PEP', 'PEP đồng', NULL),
(87, 9, 'Kích thước sản phẩm', '365 x 291 x 127 (mm)', NULL),
(88, 9, 'Trọng lượng', '2.4 kg', NULL),
(89, 9, 'Bảo hành', '12 tháng', NULL),
(91, 10, 'Lượng gas tiêu hao tối đa', '200g/h', NULL),
(92, 10, 'Kích thước sản phẩm (CxDxR)', '140x300x385 (mm)', NULL),
(93, 10, 'Trọng lượng SP', '2.0 (kg)', NULL),
(94, 10, 'Thời gian bảo hành', '24 tháng', NULL),
(100, 11, 'Thương hiệu', 'Bosch', NULL),
(101, 11, 'Mã sản phẩm', 'PPI82566VN', NULL),
(102, 11, 'Chế độ an toàn:', 'Cảnh báo khi không có nồi trên bếp\r\nKhóa bảng điều khiển', NULL),
(103, 11, 'Thành phần bếp:', 'Bếp từ đôi', NULL),
(104, 11, 'Chất liệu mặt bếp:', 'Kính Schott chịu lực, nhiệt', NULL),
(105, 11, 'Công suất:', '3500W', NULL),
(106, 11, 'Bảng điều khiển:', 'Cảm ứng', NULL),
(107, 11, 'Hẹn giờ:', 'Có hẹn giờ', NULL),
(108, 11, 'Tiện ích:', 'Đèn báo nhiệt dư\r\nChức năng Booster nấu nhanh tăng cường\r\nĐiều chỉnh thời gian độc lập cho từng bếp', NULL),
(109, 11, 'Kích thước bếp:', 'Ngang 78 cm - Dọc 45 cm - Cao 6.5 cm', NULL),
(110, 12, 'Model', 'MMB9208DIH', NULL),
(111, 12, 'Số vùng nấu', '2', NULL),
(112, 12, 'Tổng công suất', '3600W (bếp trái: 2600W, bếp phải: 2200W)', NULL),
(113, 12, 'Điện áp', '220V / 50Hz', NULL),
(114, 12, 'Chất liệu mặt kính', 'Kính Schott Ceran', NULL),
(115, 12, 'Độ dày mặt kính', '4 mm', NULL),
(116, 12, 'Chất liệu mâm từ', 'Đồng', NULL),
(117, 12, 'Bảng điều khiển', 'Cảm ứng', NULL),
(118, 12, 'Loại nồi thích hợp', 'Các loại nồi chảo đáy nhiễm từ', NULL),
(119, 12, 'Hẹn giờ', 'Có', NULL),
(120, 13, 'Công suất vùng nấu:', '2100W', NULL),
(121, 13, 'Điện áp:', '220 - 240V - 50/60 Hz', NULL),
(122, 13, 'Bảng điều khiển:', 'Cảm ứng', NULL),
(123, 13, 'Chất liệu mặt bếp:', 'Kính Ceramic - Eurokera (Pháp)', NULL),
(124, 13, 'Chế độ nấu tự động:\r\n', '6 chế độ nấu cài đặt sẵn', NULL),
(125, 13, 'Loại nồi nấu:', 'Chỉ sử dụng loại nồi có đế nhiễm từ', NULL),
(126, 13, 'Tiện ích:', 'Có hẹn giờ\r\nChức năng ninh/hầm\r\nChức năng xào\r\nChức năng đun nước\r\nChức năng hấp\r\nChức năng chiên\r\nChức năng nấu lẩu\r\nKèm vỉ, nồi, chảo', NULL),
(127, 13, 'Tính năng an toàn:', 'Tự ngắt khi bếp nóng quá tải\r\nTính năng dừng bếp tạm thời\r\nKhóa bảng điều khiển\r\nCảnh báo nồi chảo không phù hợp', NULL),
(128, 13, 'Kích thước - Khối lượng:\r\n', 'Ngang 29 cm - Dọc 36 cm - Cao 4.5 cm - Nặng 2.27 kg\r\n', NULL),
(129, 14, 'Công suất vùng nấu:\r\n', '2000W', NULL),
(130, 14, 'Điện áp:\r\n', '220V/50 Hz\r\n', NULL),
(131, 14, 'Kích thước vùng nấu:\r\n', 'Ø20 cm\r\n', NULL),
(132, 14, 'Bảng điều khiển:\r\n', 'Cảm ứng\r\n', NULL),
(133, 14, 'Chất liệu mặt bếp:\r\n', 'Kính Ceramic - Hegon (Đức)\r\n', NULL),
(134, 14, 'Chế độ nấu tự động:\r\n', '3 chế độ nấu cài đặt sẵn\r\n', NULL),
(135, 14, 'Loại nồi nấu:\r\n', 'Chỉ sử dụng loại nồi có đế nhiễm từ\r\n', NULL),
(136, 14, 'Tiện ích:\r\n', 'Có hẹn giờ\r\nChức năng giữ ấm\r\nChức năng đun nước\r\nChức năng chiên\r\nTặng kèm nồi', NULL),
(137, 14, 'Tính năng an toàn:', 'Tính năng dừng bếp tạm thời\r\nCảnh báo mặt bếp nóng\r\nTự ngắt khi không có nồi\r\nKhóa bảng điều khiển\r\nCảnh báo nồi chảo không phù hợp', NULL),
(138, 15, 'Công suất vùng nấu:\r\n', '2000W\r\n', NULL),
(139, 15, 'Điện áp:\r\n', '220 - 240V, 50 - 60 Hz\r\n', NULL),
(140, 15, 'Kích thước vùng nấu:\r\n', 'Ø 20 cm\r\n', NULL),
(141, 15, 'Kiểu lắp đặt:\r\n', 'Lắp dương\r\n', NULL),
(142, 15, 'Bảng điều khiển:\r\n', 'Cảm ứng\r\n', NULL),
(143, 15, 'Chất liệu mặt bếp:\r\n', 'Kính Ceramic - Kanger', NULL),
(144, 15, 'Chế độ nấu tự động:\r\n', '6 chế độ nấu cài đặt sẵn\r\n', NULL),
(145, 15, 'Loại nồi nấu:\r\n', 'Chỉ sử dụng loại nồi có đế nhiễm từ\r\n', NULL),
(146, 15, 'Tiện ích:\r\n', 'Có hẹn giờ\r\nChức năng nấu súp\r\nChức năng giữ ấm\r\nChức năng nướng\r\nChức năng đun nước\r\nChức năng chiên\r\nChức năng nấu lẩu\r\nTặng kèm nồi', NULL),
(147, 15, 'Bảo hành', '6 tháng', NULL),
(148, 16, 'Công suất vùng nấu:\r\n', '2200W', NULL),
(149, 16, 'Điện áp:\r\n\r\n', '220 - 240V, 50 - 60 Hz\r\n', NULL),
(150, 16, 'Kích thước vùng nấu:\r\n', 'Ø23 cm\r\n', NULL),
(151, 16, 'Bảng điều khiển:\r\n', 'Cảm ứng\r\n', NULL),
(152, 16, 'Chất liệu mặt bếp:\r\n', 'Kính Ceramic - Kanger (Trung Quốc)', NULL),
(153, 16, 'Chế độ nấu tự động:\r\n', 'Đun nước\r\nSúp\r\nNướng\r\nLẩu\r\nLàm nóng\r\nChiên\r\nNấu sữa', NULL),
(154, 16, 'Loại nồi nấu:\r\n', 'Tất cả loại nồi\r\n', NULL),
(155, 16, 'Tính năng an toàn:\r\n', 'Chức năng khóa trẻ em\r\nTự tắt bếp khi nước tràn đến bảng điều khiển\r\nTự ngắt khi không sử dụng\r\nTự ngắt khi bếp nóng quá tải\r\nCảnh báo mặt bếp nóng', NULL),
(156, 16, 'Tiện ích:\r\n', 'Có hẹn giờ\r\nCông nghệ Inverter tiết kiệm điện\r\nChức năng sôi liu riu', NULL),
(157, 16, 'Kích thước, khối lượng', 'Ngang 28 cm - Dọc 35.8 cm - Cao 6 cm - Nặng 3.16 kg\r\n', NULL),
(158, 16, 'Bảo hành', '6 tháng', NULL),
(159, 17, 'Loại máy xay:\r\n', 'Máy xay sinh tố\r\n', NULL),
(160, 17, 'Chức năng:\r\n', 'Xay đá\r\nXay thực phẩm khô\r\nXay sinh tố\r\nXay rau củ\r\nXay hạt', NULL),
(161, 17, 'Công suất:\r\n', '1200W\r\n', NULL),
(162, 17, 'Số lượng cối:\r\n', '1 cối\r\n', NULL),
(163, 17, 'Dung tích sử dụng:\r\n', 'Cối lớn 1.5 lít\r\n', NULL),
(168, 18, 'Công suất:\r\n', '2100W\r\n', NULL),
(169, 18, 'Tốc độ sấy:\r\n', '2 tốc độ, có sấy mát', NULL),
(170, 18, 'Đầu sấy:\r\n', 'Đầu sấy ThermoProtect\r\nĐầu sấy hẹp', NULL),
(171, 18, 'Kiểu dáng:\r\n', 'Tay cầm thẳng\r\n', NULL),
(172, 18, 'Chế độ bảo vệ:\r\n', 'Tự ngắt khi quá nhiệt\r\nChế độ sấy bảo vệ tóc', NULL),
(173, 18, 'Tiện ích:\r\n', 'Sấy ion làm mượt tóc\r\nCó sấy nhanh\r\nCó móc treo\r\nĐầu sấy hẹp tạo kiểu tóc', NULL),
(178, 27, 'Loại máy', 'Máy ép chậm', NULL),
(179, 27, 'Chức năng:\r\n', 'Ép trái cây, rau củ\r\nNghiền trái cây đông lạnh làm kem', NULL),
(180, 27, 'Công suất:\r\n', '400W\r\n', NULL),
(181, 27, 'Ống tiếp nguyên liệu:\r\n', 'Cửa lớn: 80 mm, cửa nhỏ: 40 mm\r\n', NULL),
(182, 27, 'Số cối:\r\n', '1 cối ép\r\n', NULL),
(183, 27, 'Dung tích:\r\n', 'Cốc đựng nước ép: 0.8 lít - Cốc đựng bã: 0.8 lít\r\n', NULL),
(184, 27, 'Chất liệu cối:\r\n', 'Cối ép: Nhựa PP, Kim loại\r\n', NULL),
(185, 27, 'Chất liệu phụ kiện:\r\n', 'Thanh nhấn: nhựa ABS\r\nLưới lọc: nhựa, thép không gỉ\r\nTrục ép: nhựa PEI (ULTEM), inox 304\r\nCốc đựng nước ép: nhựa ABS\r\nCốc đựng bã ép: nhựa ABS', NULL),
(186, 27, 'Chế độ an toàn:\r\n', 'Tự ngắt khi quá tải\r\nChỉ hoạt động khi cối xay được lắp đúng', NULL),
(187, 27, 'Tiện ích:\r\n', 'Ống tiếp nguyên liệu lớn\r\nChân đế chống trượt\r\nCó chổi vệ sinh máy\r\nKhóa vòi chống rò ', NULL),
(188, 27, 'Tốc độ:\r\n', '1 tốc độ, có xoay đảo chiều\r\n', NULL),
(189, 19, 'Loại bếp:\r\n', 'Bếp lắp dương\r\n\r\n\r\n', NULL),
(190, 19, 'Hệ thống đánh lửa:\r\n', 'Đánh lửa Magneto độ bền cao\r\n', NULL),
(191, 19, 'Số bếp:\r\n', '01 bếp', NULL),
(192, 19, 'Lượng gas tiêu thụ:\r\n', '0.228 kg/h/lò\r\n', NULL),
(193, 19, 'Mặt bếp:\r\n', 'Inox 430\r\n', NULL),
(194, 19, 'Kiềng bếp:\r\n', 'Nhôm, kiềng bếp có thể tháo rời\r\n', NULL),
(195, 19, 'Đầu đốt:\r\n', 'Đầu đốt thông thường, Chất liệu Nhôm\r\n\r\n', NULL),
(196, 19, 'Tiện ích:\r\n', 'Khay kiềng có gờ chống tràn nước\r\nNgắt ga tự động', NULL),
(199, 19, 'Hãng', 'Samsung', NULL),
(200, 20, 'Loại bếp:\r\n', 'Bếp lắp dương\r\n', NULL),
(201, 20, 'Hệ thống đánh lửa:\r\n', 'Đánh lửa Magneto độ bền cao\r\n', NULL),
(202, 20, 'Số bếp:\r\n', '1 bếp\r\n', NULL),
(203, 20, 'Lượng gas tiêu thụ:\r\n', '0.228 kg/h/lò\r\n', NULL),
(204, 20, 'Mặt bếp:\r\n', 'Tole (tôn) sơn tĩnh điện\r\n', NULL),
(205, 20, 'Kiềng bếp:\r\n', 'Nhôm, kiềng bếp có thể tháo rời\r\n', NULL),
(206, 20, 'Đầu đốt:\r\n', 'Đầu đốt thông thường, Chất liệu Hợp kim nhôm, sơn chịu nhiệt\r\n', NULL),
(207, 20, 'Tiện ích:\r\n', 'Thiết kế miếng truyền nhiệt giúp ổn định áp lực lon gas\r\nKhay kiềng có gờ chống tràn nước\r\nNgắt ga tự động\r\nNấu nhanh không đen đáy nồi', NULL),
(211, 21, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(212, 21, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(213, 21, 'Công suất', '790 - 940W', NULL),
(214, 21, 'Lòng nồi dày', '1.427 mm, Hợp kim phủ đá Maifan chống dính (Bakuhanseki)', NULL),
(215, 21, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(216, 21, 'Tiện ích', 'Có xửng hấp, Giữ ấm 24 giờ, Hẹn giờ 24 giờ', NULL),
(217, 21, 'Thương hiệu của', 'Hà Lan', NULL),
(218, 21, 'Hãng', 'Philips', NULL),
(219, 22, 'Loại nồi', 'Nồi cơm nắp gài', NULL),
(220, 22, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(221, 22, 'Công suất', '700W', NULL),
(222, 22, 'Lòng nồi dày', '1.5 mm, Hợp kim nhôm phủ chống dính', NULL),
(223, 22, 'Điều khiển', 'Nút gạt', NULL),
(224, 22, 'Tiện ích', 'Có xửng hấp', NULL),
(225, 22, 'Thương hiệu của', 'Singapore', NULL),
(226, 22, 'Hãng', 'BlueStone', NULL),
(227, 23, 'Dung tích tổng', '12 lít', NULL),
(228, 23, 'Dung tích sử dụng', '12 lít', NULL),
(229, 23, 'Điều chỉnh', '80 - 200°C, 0 - 60 phút', NULL),
(230, 23, 'Phụ kiện chính', '2 vỉ nướng, Giỏ chiên, Khay nướng, Khay xiên quay, Tay cầm, Xiên nướng gà', NULL),
(231, 23, 'Chất liệu nồi', 'Khoang lò thép mạ kẽm, Vỏ nhựa ABS', NULL),
(232, 23, 'Công nghệ, công suất', 'Thanh nhiệt điện trở 1800W', NULL),
(233, 23, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(234, 23, 'Bảng điều khiển', 'Nút xoay', NULL),
(235, 23, 'Tiện ích', 'Có đèn báo hoạt động, Nắp kính trong suốt, quan sát được quá trình nấu, Quạt đối lưu, Đèn trong khoang lò', NULL),
(236, 23, 'Năm ra mắt', '2023', NULL),
(237, 23, 'Thương hiệu của', 'Ý', NULL),
(238, 23, 'Hãng', 'Ferroli', NULL),
(239, 24, 'Dung tích tổng', '4 lít', NULL),
(240, 24, 'Dung tích sử dụng', '3.5 lít', NULL),
(241, 24, 'Điều chỉnh', '80 - 200°C, 0 - 30 phút', NULL),
(242, 24, 'Phụ kiện chính', 'Rổ chiên', NULL),
(243, 24, 'Chất liệu nồi', 'Khay chiên phủ chống dính Ceramic', NULL),
(244, 24, 'Công nghệ, công suất', 'Làm nóng điện trở nhiệt 1400W', NULL),
(245, 24, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(246, 24, 'Bảng điều khiển', 'Nút xoay', NULL),
(247, 24, 'Tiện ích', 'Tay cầm bọc nhựa cách nhiệt, Tự ngắt khi quá nhiệt, Tự động ngắt khi kéo lòng nồi', NULL),
(248, 24, 'Năm ra mắt', '2019', NULL),
(249, 24, 'Thương hiệu của', 'Việt Nam', NULL),
(250, 24, 'Hãng', 'Kangaroo', NULL),
(251, 25, 'Loại bếp', 'Bếp từ hồng ngoại, Bếp âm cần lắp CB', NULL),
(252, 25, 'Công suất vùng nấu', 'Hồng ngoại: 2200W - Từ: 2200/3000W', NULL),
(253, 25, 'Chất liệu mặt bếp', 'Kính Ceramic - K+ (Pháp)', NULL),
(254, 25, 'Bảng điều khiển', 'Cảm ứng', NULL),
(255, 25, 'Loại nồi nấu', 'Vùng từ sử dụng nồi có đáy nhiễm từ, vùng hồng ngoại không kén nồi', NULL),
(256, 25, 'Tính năng an toàn', 'Cảnh báo khi không có nồi, Cảnh báo mặt bếp nóng, Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải, Tự ngắt khi điện áp quá cao/thấp, Tự tắt bếp khi nước tràn đến bảng điều khiển, Tự tắt khi không sử dụng', NULL),
(257, 25, 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ, Công nghệ Inverter tiết kiệm điện', NULL),
(258, 25, 'Kích thước lỗ đá', 'Ngang 68 cm - Dọc 39 cm', NULL),
(259, 25, 'Thương hiệu của', 'Đức', NULL),
(260, 25, 'Hãng', 'Pramie', NULL),
(261, 26, 'Loại bếp', 'Bếp hồng ngoại 3 vùng nấu, Bếp âm cần lắp CB', NULL),
(262, 26, 'Công suất vùng nấu', 'Trái dưới: 1800W - Trái trên: 1200W - Phải: 1050 - 1950 - 2700W', NULL),
(263, 26, 'Chất liệu mặt bếp', 'Kính Ceramic - Smeg (Ý)', NULL),
(264, 26, 'Bảng điều khiển', 'Cảm ứng', NULL),
(265, 26, 'Loại nồi nấu', 'Tất cả loại nồi', NULL),
(266, 26, 'Tính năng an toàn', 'Cảnh báo mặt bếp nóng, Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải, Tự tắt bếp khi nước tràn đến bảng điều khiển', NULL),
(267, 26, 'Tiện ích', 'Có hẹn giờ', NULL),
(268, 26, 'Kích thước lỗ đá', 'Ngang 56 cm - Dọc 49 cm', NULL),
(269, 26, 'Thương hiệu của', 'Ý', NULL),
(270, 26, 'Hãng', 'Smeg', NULL),
(271, 28, 'Số lò nấu', '2', NULL),
(272, 28, 'Hệ thống đánh lửa', 'Magneto', NULL),
(273, 28, 'Chất liệu mặt bếp', 'Kính cường lực', NULL),
(274, 28, 'Độ dày mặt bếp', '6 mm', NULL),
(275, 28, 'Kiềng bếp', 'Thép tráng men', NULL),
(276, 28, 'Điếu', 'Hợp kim nhôm', NULL),
(277, 28, 'Cảm ứng ngắt gas', 'Không', NULL),
(278, 28, 'Loại gas sử dụng', 'LPG', NULL),
(279, 28, 'Kích thước sản phẩm', '725 x 410 x 130 (mm)', NULL),
(280, 28, 'Trọng lượng', '7,2kg', NULL),
(285, 29, 'Số lò nấu', '2', NULL),
(286, 29, 'Hệ thống đánh lửa', 'Magneto', NULL),
(287, 29, 'Chất liệu mặt bếp', 'Kính cường lực', NULL),
(288, 29, 'Khung bếp', 'Inox', NULL),
(289, 29, 'Loại gas sử dụng', 'LPG', NULL),
(290, 29, 'Kích thước sản phẩm', '690 x 410 x 155 (mm)', NULL),
(291, 30, 'Điện áp:', '220-240V/50~60Hz', NULL),
(292, 30, 'Tổng công suất:', '4800W', NULL),
(293, 30, 'Lò trái:', '2000W – Booster 2400W', NULL),
(294, 30, 'Lò phải:', '2000W – Booster 2400W', NULL),
(295, 30, 'Kích thước mặt kính:', 'R730 x S420 x C60 (mm)', NULL),
(296, 30, 'Kích thước khoét đá:', 'R675 x S395 (mm)', NULL),
(297, 30, 'Bảo hành', '24 tháng', NULL),
(301, 31, 'Số vùng nấu: ', '2', NULL),
(302, 31, 'Chế độ nấu:', '4 chế độ', NULL),
(303, 31, 'Bảng điều khiển: ', 'Cảm ứng', NULL),
(304, 31, 'Hẹn giờ: ', 'Có', NULL),
(305, 31, 'Công suất: ', '3.200W', NULL),
(306, 31, 'Nguồn điện áp: ', '220V/50Hz', NULL),
(307, 31, 'Kích thước mặt kính: ', '70cm x 42cm (Dài x rộng)', NULL),
(308, 31, 'Kích thước lắp đặt: ', '68cm x 40cm (Dài x rộng)', NULL),
(309, 31, 'Kích thước: ', '70cm x 42cm x 5.5cm (Dài x rộng x dày)', NULL),
(310, 31, 'Bảo hành: ', '12 tháng theo chính sách Hãng', NULL),
(311, 32, 'Công suất vùng nấu:\r\n', '2000W', 'Max300 GB/s memory bandwidth'),
(312, 32, 'Điện áp:\r\n', '220V - 50 Hz\r\n', NULL),
(313, 32, 'Kích thước vùng nấu:\r\n', 'Ø19.5 cm\r\n', NULL),
(314, 32, 'Bảng điều khiển:\r\n', 'Cảm ứng\r\n', NULL),
(315, 32, 'Chất liệu mặt bếp:\r\n', 'Kính Crystal\r\n', NULL),
(316, 32, 'Chế độ nấu tự động:\r\n', 'Đun nước\r\nSúp\r\nNướng\r\nLẩu\r\nChiên xào', NULL),
(317, 32, 'Loại nồi nấu:\r\n', 'Tất cả loại nồi\r\n', NULL),
(318, 32, 'Tính năng an toàn:\r\n', 'Tự ngắt khi điện áp quá cao/thấp\r\nMạch bảo vệ IGBT\r\nTự ngắt khi bếp nóng quá tải\r\nCảnh báo khi không có nồi\r\nKhóa bảng điều khiển\r\nCảnh báo mặt bếp nóng', NULL),
(319, 32, 'Tiện ích:', 'Có hẹn giờ\r\nTặng kèm nồi', NULL),
(320, 32, 'Kích thước, khối lượng', 'Ngang 30.5 cm - Dọc 37.5 cm - Cao 6.2 cm - Nặng 2.4 kg\r\n', NULL),
(321, 33, 'Công suất vùng nấu:\r\n', '2200W\r\n', NULL),
(322, 33, 'Điện áp:\r\n', '220 - 240V, 50 - 60 Hz\r\n', NULL),
(323, 33, 'Kích thước vùng nấu:\r\n', 'Ø23 cm\r\n', NULL),
(324, 33, 'Bảng điều khiển:\r\n', 'Cảm ứng\r\n', NULL),
(325, 33, 'Chất liệu mặt bếp:\r\n', 'Kính Ceramic - Kanger (Trung Quốc)', NULL),
(326, 33, 'Chế độ nấu tự động:\r\n', 'Đun\r\nXào\r\nNướng\r\nLẩu\r\nHấp\r\nGiữ ấm\r\n', NULL),
(327, 33, 'Loại nồi nấu:\r\n\r\n', 'Tất cả loại nồi\r\n', NULL),
(328, 33, 'Tính năng an toàn:\r\n', 'Chức năng khóa trẻ em\r\nTự tắt bếp khi nước tràn đến bảng điều khiển\r\nTự ngắt khi không sử dụng\r\nTự ngắt khi bếp nóng quá tải\r\nCảnh báo mặt bếp nóng', NULL),
(329, 33, 'Tiện ích:\r\n', 'Có hẹn giờ\r\nCông nghệ Inverter tiết kiệm điện\r\nChức năng sôi liu riu', NULL),
(330, 33, 'Kích thước, khối lượng', 'Ngang 28 cm - Dọc 35.8 cm - Cao 6 cm - Nặng 3.16 kg\r\n', NULL),
(331, 34, 'Số vùng nấu: ', '1', NULL),
(332, 34, 'Chất liệu mặt bếp: ', 'Gang đúc', NULL),
(333, 34, 'Hệ thống đánh lửa: ', 'Magneto', NULL),
(334, 34, 'Xuất xứ thương hiệu: ', 'Việt Nam', NULL),
(335, 34, 'Bảo hành: ', '24 tháng theo chính sách Hãng', NULL),
(341, 35, 'Công suất:\r\n', '1500W', NULL),
(342, 35, 'Dung tích sử dụng', '1.8 lít\r\n', NULL),
(343, 35, 'Chất liệu ruột bình:\r\n', 'Ruột bình inox 304\r\n', NULL),
(344, 35, 'Chất liệu vỏ bình:\r\n', 'Vỏ bình nhựa PP\r\n', NULL),
(345, 35, 'Đế tiếp điện:\r\n', 'Zhongteng\r\n', NULL),
(346, 35, 'Chế độ an toàn:\r\n', 'Tự ngắt khi nước sôi và khi cạn nước\r\nTự ngắt khi quá nhiệt', NULL),
(347, 35, 'Tiện ích', 'Lọc bã trà\r\nĐèn hoạt động\r\nĐế xoay 360 độ\r\nRãnh cuốn dây', NULL),
(351, 36, 'Kiểu lắp đặt:\r\n', 'Tủ đứng\r\n', NULL),
(352, 36, 'Loại máy:\r\n', 'Máy lọc nước RO nóng nguội lạnh\r\n', NULL),
(353, 36, 'Công nghệ lọc:\r\n', 'Thẩm thấu ngược RO', NULL),
(354, 36, 'Kháng khuẩn:\r\n', 'Nano ', NULL),
(355, 36, 'Dung tích bình chứa:\r\n', 'Tổng 7.8 lít (Nước nóng 0.8 lít, nước lạnh 1 lít, nước thường 6 lít)\r\n', NULL),
(356, 36, 'Tỷ lệ lọc - thải:\r\n', 'Lọc 4.8 - Thải 5.2 (Tỷ lệ này phụ thuộc vào chất lượng nước đầu vào)\r\n', NULL),
(357, 36, 'Công suất lọc:\r\n', '18 lít/giờ\r\n', NULL),
(358, 36, 'Công suất tiêu thụ điện trung bình khoảng:', '0.628 kWh\r\n', NULL),
(359, 36, 'Nhiệt độ nước hãng công bố:\r\n', 'Nóng 80 - 90°C, Lạnh 10°C\r\n', NULL),
(360, 36, 'Nhiệt độ nước thực tế:\r\n', 'Nóng 80 - 90°C, Lạnh 10°C, Nhiệt độ nước thực tế sẽ phụ thuộc vào nhiệt độ môi trường và thể tích nước lấy ra\r\n', NULL),
(361, 37, 'Phạm vi làm mát:\r\n', 'Phòng 35m²\r\n', NULL),
(362, 37, 'Công suất:\r\n', '110W\r\n', NULL),
(363, 37, 'Dung tích bình nước:\r\n', '35 lít\r\n', NULL),
(364, 37, 'Độ ồn cao nhất:\r\n', '≤ 50 dB\r\n', NULL),
(365, 37, 'Bảng điều khiển:\r\n', 'Núm xoay\r\nNút nhấn', NULL),
(366, 37, 'Tốc độ gió:\r\n', '3 mức gió', NULL),
(367, 37, 'Chế độ gió:\r\n', 'Gió thường', NULL),
(368, 37, 'Lưu lượng gió:\r\n', '4500 m³/h\r\n', NULL),
(369, 37, 'Tiện ích:\r\n', 'Có hộp đá khô làm mát\r\nTự ngắt bơm khi cạn nước\r\nCó thang đo hiển thị mực nước\r\nĐảo gió tự động 2 chiều trái - phải\r\nCó bánh xe di chuyển', NULL),
(371, 38, 'Dung tích tổng', '6 lít', NULL),
(372, 38, 'Dung tích sử dụng', '5.5 lít', NULL),
(373, 38, 'Điều chỉnh', '100 - 200°C0 - 30 phút', NULL),
(374, 38, 'Phụ kiện chính', 'Rổ chiên', NULL),
(375, 38, 'Chất liệu nồi', 'Lòng nồi thép phủ chống dínhVỏ inox 304 và nhựa PP', NULL),
(376, 38, 'Công nghệ, công suất', 'Rapid Air1600W', NULL),
(377, 38, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(378, 38, 'Bảng điều khiển', 'Nút xoay', NULL),
(379, 38, 'Tiện ích', 'Có đèn báo hoạt động Tự ngắt khi quá nhiệt Tự động ngắt khi kéo lòng nồi', NULL),
(380, 38, 'Năm ra mắt', '2021', NULL),
(381, 39, 'Dung tích tổng', '9.5 lít', NULL),
(382, 39, 'Dung tích sử dụng', '9 lít', NULL),
(383, 39, 'Điều chỉnh', '100 - 200°C0 - 30 phút', NULL),
(384, 39, 'Phụ kiện chính', 'Vỉ tách dầu', NULL),
(385, 39, 'Chất liệu nồi', 'Lòng nồi thép phủ chống dínhVỏ inox và nhựa PP', NULL),
(386, 39, 'Công nghệ, công suất', 'Rapid Air1800W', NULL),
(387, 39, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(388, 39, 'Bảng điều khiển', 'Nút xoay', NULL),
(389, 39, 'Tiện ích', 'Có đèn báo hoạt động Quạt đối lưu Tự ngắt khi quá nhiệt', NULL),
(390, 39, 'Năm ra mắt', '2022', NULL),
(391, 40, 'Dung tích tổng', '6.5 lít', NULL),
(392, 40, 'Dung tích sử dụng', '5.5 lít', NULL),
(393, 40, 'Điều chỉnh', '80 - 200°C0 - 60 phút', NULL),
(394, 40, 'Phụ kiện chính', 'Rổ chiên', NULL),
(395, 40, 'Chất liệu nồi', 'Lòng nồi hợp kim nhôm phủ chống dính GreblonVỏ bằng nhựa PP', NULL),
(396, 40, 'Công nghệ, công suất', 'Rapid Air1700W', NULL),
(397, 40, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(398, 40, 'Bảng điều khiển', 'Cảm ứng có màn hình hiển thị', NULL),
(399, 40, 'Tiện ích', '8 chương trình cài đặt sẵn Có thể vệ sinh bằng máy rửa chén Ghi nhớ chương trình nấu Tự ngắt khi quá nhiệt Tự động ngắt khi kéo lòng nồi', NULL),
(400, 40, 'Năm ra mắt', '2020', NULL),
(401, 41, 'Dung tích tổng', '5 lít', NULL),
(402, 41, 'Dung tích sử dụng', '4.5 lít', NULL),
(403, 41, 'Điều chỉnh', '80 - 200°C0 - 60 phút', NULL),
(404, 41, 'Phụ kiện chính', 'Rổ chiên', NULL),
(405, 41, 'Chất liệu nồi', 'Lòng nồi kim loại phủ chống dínhVỏ nhựa chịu nhiệt cao cấp', NULL),
(406, 41, 'Công nghệ, công suất', 'Rapid Air2000W', NULL),
(407, 41, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(408, 41, 'Bảng điều khiển', 'Cảm ứng có màn hình hiển thị', NULL),
(409, 41, 'Tiện ích', '8 chương trình cài đặt sẵn Chân đế chống trượt Tay cầm bọc nhựa cách nhiệt Tính năng tạm dừng Tự ngắt khi quá nhiệt Tự động ngắt khi kéo lòng nồi', NULL),
(410, 41, 'Năm ra mắt', '2019', NULL),
(411, 42, 'Dung tích tổng', '5.5 lít', NULL),
(412, 42, 'Dung tích sử dụng', '5 lít', NULL),
(413, 42, 'Điều chỉnh', '80 - 200°C0 - 60 phút', NULL),
(414, 42, 'Phụ kiện chính', 'Rổ chiên', NULL),
(415, 42, 'Chất liệu nồi', 'Lòng nồi kim loại phủ chống dínhVỏ nhựa và inox', NULL),
(416, 42, 'Công nghệ, công suất', 'Rapid Air2000W', NULL),
(417, 42, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(418, 42, 'Bảng điều khiển', 'Cảm ứng có màn hình hiển thị', NULL),
(419, 42, 'Tiện ích', '8 chương trình cài đặt sẵn Chân đế chống trượt Quạt đối lưu Tự động ngắt khi kéo lòng nồiTự ngắt khi quá nhiệt', NULL),
(420, 42, 'Năm ra mắt', '2020', NULL),
(421, 43, 'Mã sản phẩm:', 'Paloma PA-S18H', NULL),
(422, 43, 'Xuất xứ:', 'Made in japan', NULL),
(423, 43, 'Kích thước bề mặt:', '307 x352 x 108 mm', NULL),
(424, 43, 'Số bếp nấu:', '01', NULL),
(425, 43, 'Kiềng:', 'Kiềng tráng men không rỉ', NULL),
(426, 43, 'Chất liệu/màu sắc:', 'Inox trắng', NULL),
(427, 43, 'Bảo hành', '12 tháng', NULL),
(430, 44, 'Loại:', 'Bếp gas dương\r\nBếp Gas Đơn', NULL),
(431, 44, 'Tiện ích', 'Mặt bếp dễ vệ sinh\r\nNấu nhanh không đen đáy nồi\r\nĐầu đốt tiết kiệm gas', NULL),
(432, 44, 'Kích thước:', '365 x 291 x 110 (mm)', NULL),
(433, 44, 'Bề mặt:', 'Bằng kính cường lực sáng bóng, chịu nhiệt tốt', NULL),
(434, 44, 'Đầu đốt:', 'Đầu đốt bếp gas bằng đồng thau bền bỉ, cho ngọn lửa xanh, tiết kiệm gas', NULL),
(435, 44, 'Hệ thống đánh lửa:', 'Đánh lửa Magneto điều khiển bằng núm vặn linh hoạt, tiện dụng', NULL),
(436, 44, 'Bảo hành', '12 Tháng', NULL),
(439, 45, 'Công suất vùng nấu:\r\n', '2100W', NULL),
(440, 45, 'Điện áp:\r\n', '220V/50 Hz\r\n', NULL),
(441, 45, 'Kích thước vùng nấu:\r\n', 'Ø21 cm\r\n', NULL),
(442, 45, 'Kiểu lắp đặt:\r\n', 'Lắp dương\r\n', NULL),
(443, 45, 'Bảng điều khiển:\r\n', 'Cảm ứng\r\n', NULL),
(444, 45, 'Chất liệu mặt bếp:\r\n', 'Kính Ceramic', NULL),
(445, 45, 'Chế độ nấu tự động:\r\n', '6 chế độ nấu cài đặt sẵn\r\n', NULL),
(446, 45, 'Loại nồi nấu:\r\n', 'Chỉ sử dụng loại nồi có đế nhiễm từ\r\n', NULL),
(447, 45, 'Tiện ích:\r\n', 'Có hẹn giờ\r\nBảng điều khiển cảm ứng trượt\r\nChức năng xào\r\nChức năng nấu canh\r\nChức năng đun nước\r\nChức năng hấp\r\nChức năng chiên\r\nChức năng nấu lẩu\r\nTặng kèm nồi', NULL),
(448, 46, 'Công suất vùng nấu:\r\n', '2000W\r\n', NULL),
(449, 46, 'Điện áp:\r\n', '220V/50 Hz\r\n', NULL),
(450, 46, 'Kích thước vùng nấu:\r\n', 'Ø 20 cm\r\n', NULL),
(451, 46, 'Kiểu lắp đặt:\r\n', 'Lắp dương\r\n', NULL),
(452, 46, 'Bảng điều khiển:\r\n', 'Cảm ứng\r\n', NULL),
(453, 46, 'Chất liệu mặt bếp:\r\n', 'Kính Ceramic', NULL),
(454, 46, 'Chế độ nấu tự động:\r\n\r\n', '5 chế độ nấu cài đặt sẵn\r\n', NULL),
(455, 46, 'Loại nồi nấu:\r\n', 'Chỉ sử dụng loại nồi có đế nhiễm từ\r\n', NULL),
(456, 46, 'Tiện ích:\r\n', 'Công nghệ Inverter tiết kiệm điện\r\nCó hẹn giờ\r\nBảng điều khiển cảm ứng trượt\r\nChức năng cháo/súp\r\nChức năng BBQ\r\nChức năng đun nước\r\nChức năng chiên\r\nChức năng nấu lẩu\r\nTặng kèm nồi', NULL),
(457, 47, 'Công suất vùng nấu:\r\n', '2000W\r\n', NULL),
(458, 47, 'Điện áp:\r\n\r\n', '220V/50 Hz\r\n', NULL),
(459, 47, 'Kích thước vùng nấu:\r\n', 'Ø 12 - 26 cm\r\n', NULL),
(460, 47, 'Kiểu lắp đặt:\r\n', 'Lắp dương\r\n', NULL),
(461, 47, 'Bảng điều khiển:\r\n', 'Cảm ứng\r\n', NULL),
(462, 47, 'Chất liệu mặt bếp:\r\n', 'Kính Ceramic', NULL),
(463, 47, 'Chế độ nấu tự động:\r\n', '7 chế độ nấu cài đặt sẵn\r\n', NULL),
(464, 47, 'Loại nồi nấu:\r\n', 'Chỉ sử dụng loại nồi có đế nhiễm từ\r\n', NULL),
(465, 47, 'Tiện ích:\r\n', 'Có hẹn giờ\r\nChức năng hâm nóng\r\nChức năng giữ ấm\r\nChức năng xào\r\nChức năng nấu sữa\r\nChức năng nướng\r\nChức năng cháo/súp\r\nChức năng nấu lẩu\r\nTặng kèm nồi', NULL),
(466, 48, 'Loại quạt:\r\n', 'Quạt trần - 66W - 5 mức gió\r\n', NULL),
(467, 48, 'Chế độ gió:\r\n', 'Gió thường\r\n', NULL),
(468, 48, 'Bảng điều khiển:\r\n', 'Điều khiển bằng hộp số gắn tường\r\n', NULL),
(469, 48, 'Loại motor:\r\n', 'Bạc đạn\r\n', NULL),
(470, 48, 'Ty quạt:\r\n', '45.7 cm\r\n', NULL),
(471, 48, 'Đường kính cánh quạt:\r\n', '3 cánh - 150 cm\r\n', NULL),
(472, 48, 'Chất liệu cánh quạt:\r\n', 'Kim loại\r\n', NULL),
(473, 48, 'Loại móc treo:\r\n', 'Móc chữ J (không kèm theo quạt)\r\n', NULL),
(474, 48, 'Lưu ý:\r\n', 'Chiều cao lắp đặt tối đa là 4m. Trên 4m cần khảo sát chiều cao (có tính phí) và phương án lắp đặt (chi phí thuê giàn giáo cho việc lắp đặt và các phát sinh khác khách hàng chịu)', NULL),
(475, 48, 'Kích thước:\r\n', 'Ngang 150 cm - Cao 45.7 cm (Không bao gồm phần cánh quạt) - Sâu 150 cm', NULL),
(476, 48, 'Hãng', 'Kangaro', NULL),
(477, 49, 'Loại bụi lọc được:\r\n', 'PM0.01\r\nPM0.02\r\nPM0.03\r\nPM0.1\r\nPM0.2\r\nPM0.3\r\nPM0.5\r\nPM1.0\r\nPM2.5\r\nPM10', NULL),
(478, 49, 'Phạm vi lọc hiệu quả:\r\n', 'Phòng 60m²\r\n', NULL),
(479, 49, 'Lượng gió thổi ra lớn nhất:\r\n', '468 m³/h\r\n', NULL),
(480, 49, 'Công suất hoạt động:\r\n', '41W\r\n', NULL),
(481, 49, 'Bộ lọc bụi cho máy:\r\n', 'Màng lọc HEPA H13\r\nMàng lọc than hoạt tính\r\nMàng lọc thô', NULL),
(482, 49, 'Bảng điều khiển:\r\n', 'Cảm ứng\r\n', NULL),
(483, 49, 'Độ ồn cao nhất:\r\n', '53 dB', NULL),
(484, 49, 'Công nghệ:\r\n', 'Inverter\r\nIonizer', NULL),
(485, 50, 'Loại bàn ủi:\r\n', 'Bàn ủi hơi nước cầm tay\r\n', NULL),
(486, 50, 'Công suất:\r\n', '1400W', NULL),
(487, 50, 'Bình nước:\r\n', '1 bình 120 ml, 1 bình 200 ml\r\n', NULL),
(488, 50, 'Mặt đế:\r\n', 'Kim loại\r\n', NULL),
(489, 50, 'Chức năng:\r\n', 'Phun hơi liên tục\r\nPhun hơi\r\nỦi hơi nước\r\nPhun tia\r\nPhun hơi thẳng đứng', NULL),
(490, 50, 'Tiện ích:\r\n', 'Ủi nằm\r\nỦi quần áo treo\r\nChế độ tiết kiệm điện\r\nKhông tạo vết cháy\r\nThiết kế nhỏ gọn, dễ mang đi du lịch\r\nCó đế ủi rời đi kèm', NULL),
(491, 50, 'Chế độ an toàn:\r\n', 'Tự ngắt khi quá nhiệt\r\n', NULL),
(492, 50, 'Kích thước - Khối lượng sản phẩm:\r\n', 'Ngang 9.5 cm - Cao 30.5 - 32 cm - Sâu 16 cm - Nặng 1.204 kg\r\n', NULL),
(493, 50, 'Chiều dài dây điện:\r\n', '197 cm\r\n', NULL),
(494, 51, 'Loại bàn ủi:\r\n', 'Bàn ủi hơi nước', NULL),
(495, 51, 'Công suất:\r\n', '2000W', NULL),
(496, 51, 'Bình nước:\r\n', '250 ml\r\n', NULL),
(497, 51, 'Mặt đế:\r\n', 'Ceramic chống dính\r\n', NULL),
(498, 51, 'Chức năng:\r\n', 'Ủi khô\r\nPhun hơi liên tục\r\nPhun hơi\r\nỦi hơi nước\r\nPhun tia\r\nPhun hơi tăng cường\r\nPhun hơi thẳng đứng', NULL),
(499, 51, 'Tiện ích:\r\n', 'Chế độ tiết kiệm điện\r\nTrang bị đèn báo tiện lợi\r\nNút trượt xả cặn\r\nChống nhỏ giọt\r\nCó rãnh cúc tiện lợi', NULL),
(500, 51, 'Chế độ an toàn:\r\n', 'Tự ngắt khi quá nhiệt\r\n', NULL),
(501, 51, 'Kích thước - Khối lượng sản phẩm:', 'Ngang 26.5 cm - Cao 13 cm - Sâu 11.5 cm - Nặng 1.16 kg\r\n', NULL),
(502, 51, 'Camera trước', '5 MP', NULL),
(503, 51, 'Pin, Sạc', '5000 mAh, 10 W', NULL),
(504, 52, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(505, 52, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(506, 52, 'Công suất', '835W', NULL),
(507, 52, 'Lòng nồi dày', '1.183 mm, Nhôm phủ chống dính', NULL),
(508, 52, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(509, 52, 'Tiện ích', 'Có xửng hấp, Giữ ấm 12 giờHẹn giờ 24 giờ', NULL),
(510, 52, 'Thương hiệu của', 'Nhật Bản', NULL),
(511, 52, 'Hãng', 'Sharp', NULL),
(512, 53, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(513, 53, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(514, 53, 'Công suất', '790W', NULL),
(515, 53, 'Lòng nồi dày', '2.2 mmHợp kim nhôm phủ chống dính', NULL),
(516, 53, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(517, 53, 'Tiện ích', 'Có xửng hấp, Giữ ấm 24 giờ, Hẹn giờ đến 15 giờ', NULL),
(518, 53, 'Thương hiệu của', 'Nhật Bản', NULL),
(519, 53, 'Hãng', 'Sharp', NULL),
(520, 54, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(521, 54, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(522, 54, 'Công suất', '800W', NULL),
(523, 54, 'Lòng nồi dày', '4 mm, Hợp kim nhôm phủ chống dính', NULL),
(524, 54, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(525, 54, 'Tiện ích', 'Có xửng hấp, Giữ ấm lên đến 30 giờ, Hẹn giờ 24 giờ', NULL),
(526, 54, 'Thương hiệu của', 'Nhật Bản', NULL),
(527, 54, 'Hãng', 'Toshiba', NULL),
(528, 55, 'Loại bếp', 'Bếp từ đôi, Bếp âm cần lắp CB', NULL),
(529, 55, 'Công suất vùng nấu', 'Trái: 2000W - Phải: 2000W', NULL),
(530, 55, 'Chất liệu mặt bếp', 'Kính Ceramic', NULL),
(531, 55, 'Bảng điều khiển', 'Cảm ứng', NULL),
(532, 55, 'Loại nồi nấu', 'Chỉ sử dụng loại nồi có đế nhiễm từ', NULL),
(533, 55, 'Tính năng an toàn', 'Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải', NULL),
(534, 55, 'Tiện ích', 'Có hẹn giờ', NULL),
(535, 55, 'Kích thước lỗ đá', 'Ngang 69.5 cm - Dọc 39.5 cm', NULL),
(536, 55, 'Thương hiệu của', 'Singapore', NULL),
(537, 55, 'Hãng', 'BlueStone', NULL),
(538, 56, 'Loại bếp', 'Bếp từ đôi, Bếp âm cần lắp CB', NULL),
(539, 56, 'Công suất vùng nấu', 'Trái: 2000/2200W - Phải: 2000/2200W', NULL),
(540, 56, 'Chất liệu mặt bếp', 'Kính Ceramic - Schott Ceran (Đức)', NULL),
(541, 56, 'Bảng điều khiển', 'Cảm ứng', NULL),
(542, 56, 'Loại nồi nấu', 'Chỉ sử dụng loại nồi có đế nhiễm từ', NULL),
(543, 56, 'Tính năng an toàn', 'Cảnh báo mặt bếp nóng, Cảnh báo nồi chảo không phù hợp, Khóa bảng điều khiển, Tự ngắt khi không có nồi, Tự nhận diện kích cỡ đáy nồi', NULL),
(544, 56, 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ, Công nghệ Inverter tiết kiệm điện', NULL),
(545, 56, 'Kích thước lỗ đá', 'Ngang 68 cm - Dọc 38 cm', NULL),
(546, 56, 'Thương hiệu của', 'Đức', NULL),
(547, 56, 'Hãng', 'Hafele', NULL),
(548, 57, 'Loại bếp', 'Bếp từ hồng ngoại, Bếp âm cần lắp CB', NULL),
(549, 57, 'Công suất vùng nấu', 'Trái (Từ): 2000/2400W - Phải (Hồng ngoại): 2000W', NULL),
(550, 57, 'Chất liệu mặt bếp', 'Mặt kính Crystal - Trung Quốc', NULL),
(551, 57, 'Bảng điều khiển', 'Cảm ứng', NULL),
(552, 57, 'Loại nồi nấu', 'Vùng từ sử dụng nồi có đáy nhiễm từ, vùng hồng ngoại không kén nồi', NULL),
(553, 57, 'Tính năng an toàn', 'Cảnh báo nồi chảo không phù hợp, Khóa bảng điều khiển, Tính năng dừng bếp tạm thời, Tự ngắt khi bếp nóng quá tải, Tự ngắt khi không có nồi, Tự nhận diện kích cỡ đáy nồi', NULL),
(554, 57, 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ', NULL),
(555, 57, 'Kích thước lỗ đá', 'Ngang 67.5 cm - Dọc 40.5 cm', NULL),
(556, 57, 'Thương hiệu của', 'Việt Nam', NULL),
(557, 57, 'Hãng', 'Kangaroo', NULL),
(571, 58, 'Tên sản     phẩm', 'Bếp từ TA-1008VN', NULL),
(572, 58, ' Mặt kính', 'Kanger chấm bi bo viền kim loại, vát cạnh', NULL),
(573, 58, ' Số vùng   nấu', '02', NULL),
(574, 58, ' Chức năng Hẹn giờ', 'Hẹn giờ độc lập từng vùng nấu 99 phút', NULL),
(575, 58, ' Khóa trẻ em', 'Có', NULL),
(576, 58, ' Chất liệu mâm từ', 'Đồng', NULL),
(577, 58, ' Công suất lò trái', '2000W-Booster 2400W', NULL),
(578, 58, ' Công suất lò phải', '2000W-Booster 2400W', NULL),
(579, 58, ' Kích thước sản phẩm', '730x420x60 mm', NULL),
(580, 58, 'Bảo hành', '24 tháng', NULL),
(581, 3, 'Bảo hành', '24 tháng\r\n', NULL),
(582, 28, 'Bảo hành', '24 tháng', NULL),
(583, 29, 'Trọng lượng', '6.7 kg', NULL),
(584, 29, 'Bảo hành', '18 tháng', NULL),
(587, 6, 'Chất Liệu\r\n\r\n', 'Thép sơn tĩnh điện\r\n\r\n', NULL),
(588, 6, 'Bảo Hành\r\n\r\n', '12 Tháng\r\n\r\n', NULL),
(589, 11, 'Kích thước lỗ đá:', 'Ngang 70 cm - Dọc 40 cm', NULL),
(590, 11, 'Công suất vùng nấu:', 'Trái: 1800/3100W - Phải: 1800/3100W', NULL),
(591, 11, 'Bảo hành', '36 tháng', NULL),
(592, 12, 'Khả năng chịu tải của bếp', '20kg', NULL),
(593, 12, 'Kích thước sản phẩm', '730 x 430 x 85 mm', NULL),
(594, 12, 'Kích thước mặt bếp', '730 x 430 mm', NULL),
(595, 12, 'Khối lượng', '9.5 kg', NULL),
(596, 12, 'Bảo hành', '36 tháng', NULL),
(597, 13, 'Bảo hành', '6 tháng', NULL),
(598, 14, 'Bảo hành:', '6 tháng', NULL),
(599, 45, 'Tính năng an toàn:\r\n', 'Tự ngắt khi điện áp quá cao/thấp\r\nTự ngắt khi bếp nóng quá tải\r\nCảnh báo mặt bếp nóng\r\nTự ngắt khi không có nồi\r\nCảnh báo khi không có nồi', NULL),
(600, 45, 'Bảo hành:', '6 tháng', NULL),
(601, 46, 'Tính năng an toàn:\r\n', 'Tự ngắt khi điện áp quá cao/thấp\r\nMạch bảo vệ IGBT\r\nTự tắt khi để quên\r\nTự ngắt khi bếp nóng quá tải\r\nCảnh báo mặt bếp nóng\r\nCảnh báo khi không có nồi\r\nCảnh báo nồi chảo không phù hợp\r\nTự tắt khi không sử dụng', NULL),
(602, 46, 'Bảo hành', '6 tháng', NULL),
(603, 47, 'Tính năng an toàn:\r\n', 'Tính năng dừng bếp tạm thời\r\nKhóa bảng điều khiển\r\nTự ngắt khi bếp nóng quá tải', NULL),
(604, 47, 'Bảo hành', '6 tháng', NULL),
(605, 59, 'Dung tích', '0,5 L', NULL),
(606, 59, 'Chức năng', 'Vắt cam, bưởi, chanh', NULL),
(607, 59, 'Chất liệu', 'Nhựa cao cấp', NULL),
(608, 59, 'Bảo hành', '24 Tháng', NULL),
(609, 60, 'Công suất:	\r\n', '500W', NULL),
(610, 60, 'Chất liệu cối xay:', 'Nhựa', NULL),
(611, 60, 'Dung tích cối:', '1.1L', NULL),
(612, 60, 'Bảo hành', '24 Tháng', NULL),
(613, 61, 'Dung tích:', '27 Lít', NULL),
(614, 61, 'Công suất nấu:', '900W', NULL),
(615, 61, 'Chất liệu khoang lò:', 'Thép không gỉ', NULL),
(616, 61, 'Chức năng chính:', 'Rã đông, hâm nóng, nướng thức ăn, chiên không dầu', NULL),
(617, 61, 'Tiện ích:', 'Thực đơn nấu tự động\r\nRã đông theo thời gian\r\nKhoang lò có đèn\r\nRã đông nhanh\r\nKhóa bảng điều khiển\r\n10 thực đơn cài đặt sẵn\r\nRã đông theo khối lượng\r\nNấu nhiều giai đoạn\r\nHẹn giờ lên tới 99 phút 99 giây\r\nNướng đối lưu\r\nNướng kết hợp vi sóng\r\nChiên không dầu', NULL),
(618, 61, 'Khối lượng:', '17 kg', NULL),
(619, 61, 'Kích thước:', 'Ngang 49.5 cm - Cao 29 cm - Sâu 43.5 cm', NULL),
(620, 61, 'Bảo hành', '12 tháng', NULL),
(621, 62, 'Dung tích:', '24 Lít', NULL),
(622, 62, 'Công suất nấu:	\r\n', '900W', NULL),
(623, 62, 'Công suất nướng:	\r\n', '1000W', NULL),
(624, 62, 'Bảng điều khiển:', 'Nút vặn', NULL),
(625, 62, 'Chất liệu khoang lò:', 'Thép không gỉ', NULL),
(626, 62, 'Chức năng chính:', 'Rã đông, hâm, nấu, nướng', NULL),
(627, 62, 'Tiện ích:', 'Hẹn giờ lên tới 35 phút, Khoang lò có đèn', NULL),
(628, 62, 'Kích thước:', '280 (H) x 469 (W) x 380 (D)', NULL),
(629, 62, 'Bảo hành', '12 tháng', NULL),
(630, 63, 'Đường Kính:', 'Nồi: 20 cm\r\nNồi: 24 cm\r\nQuánh: 16 cm', NULL),
(631, 63, 'Chất liệu:', 'Inox', NULL),
(632, 63, 'Sử dụng cho:', 'Bếp gas\r\nBếp từ\r\nBếp hồng ngoại', NULL),
(633, 64, 'Đường Kính chảo:', '24 cm', NULL),
(634, 64, 'Sử dụng được:', 'Bếp gas\r\nBếp hồng ngoại', NULL),
(635, 65, 'Đường Kính:', '24cm', NULL),
(636, 65, 'Chất liệu:', 'Inox', NULL),
(637, 65, 'Đặc điểm nổi bật:', 'Nồi lẻ Inox cao cấp', NULL),
(638, 65, 'Sử dụng cho:', 'Bếp gas\r\nBếp từ\r\nBếp hồng ngoại', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_imgs`
--

CREATE TABLE `product_imgs` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_imgs`
--

INSERT INTO `product_imgs` (`image_id`, `product_id`, `image_name`, `image_is_display`) VALUES
(1, 1, 'bep_ga_sunhouse_1.jpg', 1),
(2, 1, 'bep_ga_sunhouse_2.jpg', 1),
(3, 1, 'bep_ga_sunhouse_3.jpg', 1),
(4, 1, 'bep_ga_sunhouse_4.jpg', 1),
(6, 2, 'bep-gas-electrolux-1.jpg', 1),
(7, 2, 'bep-gas-electrolux-2.jpg', 1),
(8, 2, 'bep-gas-electrolux-3.jpg', 1),
(9, 2, 'bep-gas-electrolux-4.jpg', 1),
(11, 3, 'P3_avt_1.jpg', 1),
(12, 3, 'P3_avt_2.jpg', 1),
(13, 3, 'P3_avt_3.jpg', 1),
(14, 3, 'P3_avt_4.jpg', 1),
(16, 4, 'P4_1.jpg', 1),
(17, 4, 'P4_2.jpg', 1),
(18, 4, 'P4_3.jpg', 1),
(19, 4, 'P4_4.jpg', 1),
(21, 5, 'P5_1.jpg', 1),
(22, 5, 'P5_2.jpg', 1),
(23, 5, 'P5_3.jpg', 1),
(24, 5, 'P5_4.jpg', 1),
(26, 6, 'P6_1.jpg', 1),
(27, 6, 'P6_2.jpg', 1),
(28, 6, 'P6_3.jpg', 1),
(31, 7, 'P7_1.jpg', 1),
(32, 7, 'P7_2.jpg', 1),
(33, 7, 'P7_3.jpg', 1),
(34, 7, 'P7_4.jpg', 1),
(36, 8, 'P8_1.jpg', 1),
(37, 8, 'P8_2.jpg', 1),
(38, 8, 'P8_3.jpg', 1),
(41, 9, 'P9_1.jpg', 1),
(42, 9, 'P9_2.jpg', 1),
(43, 9, 'P9_3.jpg', 1),
(44, 9, 'P9_4.jpg', 1),
(45, 9, 'P9_5.jpg', 1),
(46, 10, 'P10_avt.jpg', 1),
(51, 11, 'P11_1.jpg', 1),
(52, 11, 'P11_2.jpg', 1),
(56, 12, 'P12_1.jpg', 1),
(57, 12, 'P12_2.jpg', 1),
(58, 12, 'P12_3.jpg', 1),
(59, 12, 'P12_4.jpg', 1),
(60, 12, 'P12_5.jpg', 1),
(61, 13, 'P13_1.jpg', 1),
(62, 13, 'P13_2.jpg', 1),
(63, 13, 'P13_3.jpg', 1),
(64, 13, 'P13_4.jpg', 1),
(66, 14, 'P14_1.jpg', 1),
(68, 14, 'P14_3.jpg', 1),
(69, 14, 'P14_4.jpg', 1),
(70, 14, 'P14_2.jpg', 1),
(71, 15, 'P15_1.jpg', 1),
(72, 15, 'P15_2.jpg', 1),
(73, 15, 'P15_3.jpg', 1),
(74, 15, 'P15_4.jpg', 1),
(76, 16, 'P16_1.jpg', 1),
(77, 16, 'P16_2.jpg', 1),
(78, 16, 'P16_3.jpg', 1),
(79, 16, 'P16_4.jpg', 1),
(81, 17, 'P17_1.jpg', 1),
(82, 17, 'P17_2.jpg', 1),
(83, 17, 'P17_3.jpg', 1),
(84, 17, 'P17_4.jpg', 1),
(86, 18, 'P18_1.jpg', 1),
(87, 18, 'P18_2.jpg', 1),
(88, 18, 'P18_3.jpg', 1),
(91, 19, 'P19_1.jpg', 1),
(92, 19, 'P19_2.jpg', 1),
(93, 19, 'P19_3.jpg', 1),
(94, 19, 'P19_4.jpg', 1),
(96, 20, 'P20_1.jpg', 1),
(97, 20, 'P20_2.jpg', 1),
(98, 20, 'P20_3.jpg', 1),
(99, 20, 'P20_4.jpg', 1),
(101, 21, 'P21_1.jpg', 1),
(102, 21, 'P21_2.gif', 1),
(103, 21, 'P21_3.jpg', 1),
(104, 21, 'P21_4.jpg', 1),
(105, 21, 'P21_5.jpg', 1),
(106, 22, 'P22_1.jpg', 1),
(107, 22, 'P22_2.gif', 1),
(108, 22, 'P22_3.jpg', 1),
(109, 22, 'P22_4.jpg', 1),
(110, 22, 'P22_5.jpg', 1),
(111, 23, 'P23_1.jpg', 1),
(112, 23, 'P23_2.jpg', 1),
(113, 23, 'P23_3.gif', 1),
(114, 23, 'P23_4.jpg', 1),
(115, 23, 'P23_5.jpg', 1),
(116, 24, 'P24_1.jpg', 1),
(117, 24, 'P24_2.jpg', 1),
(118, 24, 'P24_3.jpg', 1),
(119, 24, 'P24_4.jpg', 1),
(120, 24, 'P24_5.jpg', 1),
(121, 25, 'P25_1.jpg', 1),
(122, 25, 'P25_2.jpg', 1),
(123, 25, 'P25_3.jpg', 1),
(124, 25, 'P25_4.jpg', 1),
(125, 25, 'P25_5.jpg', 1),
(126, 26, 'P26_1.jpg', 1),
(127, 26, 'P26_2.gif', 1),
(128, 26, 'P26_3.jpg', 1),
(129, 26, 'P26_4.jpg', 1),
(130, 26, 'P26_5.jpg', 1),
(131, 27, 'P27_1.jpg', 1),
(132, 27, 'P27_2.jpg', 1),
(133, 27, 'P27_3.jpg', 1),
(134, 27, 'P27_4.jpg', 1),
(135, 27, 'P27_5.jpg', 1),
(136, 28, 'P28_1.jpg', 1),
(137, 28, 'P28_2.jpg', 1),
(138, 28, 'P28_3.jpg', 1),
(139, 28, 'P28_4.jpg', 1),
(141, 29, 'P29_1.jpg', 1),
(142, 29, 'P29_2.jpg', 1),
(143, 29, 'P29_3.jpg', 1),
(144, 29, 'P29_4.jpg', 1),
(146, 30, 'P30_1.jpg', 1),
(147, 30, 'P30_2.jpg', 1),
(148, 30, 'P30_3.jpg', 1),
(149, 30, 'P30_4.jpg', 1),
(151, 31, 'P31_1.jpg', 1),
(152, 31, 'P31_2.jpg', 1),
(153, 31, 'P31_3.jpg', 1),
(154, 31, 'P31_4.jpg', 1),
(155, 31, 'P31_5.jpg', 1),
(160, 58, 'P58_5.jpg', 1),
(161, 32, 'P32_1.jpg', 1),
(162, 32, 'P32_2.jpg', 1),
(163, 32, 'P32_3.jpg', 1),
(164, 32, 'P32_4.jpg', 1),
(166, 33, 'P33_1.jpg', 1),
(167, 33, 'P33_2.jpg', 1),
(168, 33, 'P33_3.jpg', 1),
(169, 33, 'P33_4.jpg', 1),
(171, 34, 'P34_1.jpg', 1),
(172, 34, 'P34_2.jpg', 1),
(173, 34, 'P34_3.jpg', 1),
(176, 35, 'P35_1.jpg', 1),
(177, 35, 'P35_2.jpg', 1),
(178, 35, 'P35_3.jpg', 1),
(179, 35, 'P35_4.jpg', 1),
(181, 36, 'P36_1.jpg', 1),
(182, 36, 'P36_2.jpg', 1),
(183, 36, 'P36_3.png', 1),
(186, 37, 'P37_1.jpg', 1),
(187, 37, 'P37_2.jpg', 1),
(188, 37, 'P37_3.jpg', 1),
(189, 37, 'P37_4.jpg', 1),
(191, 38, 'P38_1.jpg', 1),
(192, 38, 'P38_2.jpg', 1),
(193, 38, 'P38_3.jpg', 1),
(194, 38, 'P38_4.jpg', 1),
(195, 38, 'P38_5.jpg', 1),
(196, 39, 'P39_1.jpg', 1),
(197, 39, 'P39_2.jpg', 1),
(198, 39, 'P39_3.jpg', 1),
(199, 39, 'P39_4.jpg', 1),
(200, 39, 'P39_5.jpg', 1),
(201, 40, 'P40_1.jpg', 1),
(202, 40, 'P40_2.jpg', 1),
(203, 40, 'P40_3.jpg', 1),
(204, 40, 'P40_4.jpg', 1),
(205, 40, 'P40_5.jpg', 1),
(206, 41, 'P41_1.jpg', 1),
(207, 41, 'P41_2.jpg', 1),
(208, 41, 'P41_3.jpg', 1),
(209, 41, 'P41_4.jpg', 1),
(210, 41, 'P41_5.jpg', 1),
(211, 42, 'P42_1.jpg', 1),
(212, 42, 'P42_2.jpg', 1),
(213, 42, 'P42_3.jpg', 1),
(214, 42, 'P42_4.jpg', 1),
(215, 42, 'P42_5.jpg', 1),
(216, 43, 'P43_avt.jpg', 1),
(221, 44, 'P44_1.jpg', 1),
(222, 44, 'P44_2.jpg', 1),
(223, 44, 'P44_3.jpg', 1),
(224, 44, 'P44_4.jpg', 1),
(225, 44, 'P44_5.jpg', 1),
(226, 45, 'P45_1.jpg', 1),
(227, 45, 'P45_2.jpg', 1),
(230, 45, 'P45_3.jpg', 1),
(231, 46, 'P46_1.jpg', 1),
(232, 46, 'P46_2.jpg', 1),
(233, 46, 'P46_3.jpg', 1),
(236, 47, 'P47_1.jpg', 1),
(237, 47, 'P47_2.jpg', 1),
(238, 47, 'P47_3.jpg', 1),
(241, 48, 'P48_1.jpg', 1),
(242, 48, 'P48_2.jpg', 1),
(246, 49, 'P49_1.jpg', 1),
(247, 49, 'P49_2.jpg', 1),
(248, 49, 'P49_3.jpg', 1),
(249, 49, 'P49_4.jpg', 1),
(251, 50, 'P50_1.jpg', 1),
(252, 50, 'P50_2.jpg', 1),
(253, 50, 'P50_3.jpg', 1),
(254, 50, 'P50_4.jpg', 1),
(255, 50, 'P50_5.jpg', 1),
(256, 51, 'P51_1.jpg', 1),
(257, 51, 'P51_2.jpg', 1),
(258, 51, 'P51_3.jpg', 1),
(259, 51, 'P51_4.jpg', 1),
(260, 51, 'P51_5.jpg', 1),
(261, 52, 'P52_1.jpg', 1),
(262, 52, 'P52_2.jpg', 1),
(263, 52, 'P52_3.jpg', 1),
(264, 52, 'P52_4.jpg', 1),
(265, 52, 'P52_5.jpg', 1),
(266, 53, 'P53_1.jpg', 1),
(267, 53, 'P53_2.jpg', 1),
(268, 53, 'P53_3.jpg', 1),
(269, 53, 'P53_4.jpg', 1),
(270, 53, 'P53_5.jpg', 1),
(271, 54, 'P54_1.jpg', 1),
(272, 54, 'P54_2.jpg', 1),
(273, 54, 'P54_3.jpg', 1),
(274, 54, 'P54_4.jpg', 1),
(275, 54, 'P54_5.jpg', 1),
(276, 55, 'P55_1.jpg', 1),
(277, 55, 'P55_2.jpg', 1),
(278, 55, 'P55_3.jpg', 1),
(279, 55, 'P55_4.jpg', 1),
(280, 55, 'P55_5.jpg', 1),
(281, 56, 'P56_1.jpg', 1),
(282, 56, 'P56_2.jpg', 1),
(283, 56, 'P56_3.jpg', 1),
(284, 56, 'P56_4.jpg', 1),
(285, 56, 'P56_5.jpg', 1),
(286, 57, 'P57_1.jpg', 1),
(287, 57, 'P57_2.jpg', 1),
(288, 57, 'P57_3.jpg', 1),
(289, 57, 'P57_4.jpg', 1),
(290, 57, 'P57_5.jpg', 1),
(291, 58, 'P58_1.jpg', 1),
(292, 58, 'P58_2.jpg', 1),
(293, 58, 'P58_3.jpg', 1),
(294, 58, 'P58_4.jpg', 1),
(295, 59, 'P59_1.jpg', 1),
(296, 59, 'P59_2.jpg', 1),
(297, 59, 'P59_3.jpg', 1),
(298, 60, 'P60_1.jpg', 1),
(299, 60, 'P60_2.jpg', 1),
(300, 60, 'P60_3.jpg', 1),
(301, 61, 'P61_1.jpg', 1),
(302, 61, 'P61_2.jpg', 1),
(303, 61, 'P61_3.jpg', 1),
(304, 62, 'P61_1.jpg', 1),
(305, 62, 'P62_2.jpg', 1),
(306, 63, 'P63_1.jpg', 1),
(307, 63, 'P63_2.jpg', 1),
(308, 63, 'P63_3.jpg', 1),
(309, 64, 'P64_1.jpg', 1),
(310, 64, 'P64_2.jpg\r\n', 1),
(311, 65, 'P65_1.png', 1),
(312, 65, 'P65_3.png', 1),
(313, 54, 'P65_2.png', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `product_variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `product_variant_name` varchar(100) NOT NULL,
  `product_variant_price` float NOT NULL,
  `product_variant_available` int(11) NOT NULL,
  `product_variant_is_stock` tinyint(1) DEFAULT NULL,
  `product_variant_is_bestseller` tinyint(1) DEFAULT NULL,
  `product_variant_added_date` date NOT NULL DEFAULT current_timestamp(),
  `product_variant_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`product_variant_id`, `product_id`, `discount_id`, `product_variant_name`, `product_variant_price`, `product_variant_available`, `product_variant_is_stock`, `product_variant_is_bestseller`, `product_variant_added_date`, `product_variant_is_display`) VALUES
(1, 1, 1, '1 SP', 1059000, 100, 1, 1, '2026-04-22', 1),
(2, 2, 1, '1 SP', 890000, 200, 1, 0, '2026-04-22', 1),
(3, 3, 1, '1 SP\r\n', 1700000, 100, 1, 1, '2026-04-22', 1),
(4, 4, 5, '1 SP', 1390000, 200, 1, 0, '2026-05-30', 1),
(5, 5, 1, '1 SP', 1750000, 100, 1, 1, '2026-04-23', 1),
(6, 6, 2, '1 SP', 549000, 100, 1, 1, '2026-05-07', 1),
(7, 7, 2, '1 SP', 500000, 100, 1, 1, '2026-05-07', 1),
(8, 8, 6, '1 SP', 419000, 100, 1, 1, '2026-05-08', 1),
(9, 9, 6, '1 SP', 649000, 100, 1, 1, '2026-05-08', 1),
(10, 10, 2, '1 SP', 500000, 100, 1, 1, '2026-05-08', 1),
(11, 11, 3, '1 SP', 10000000, 100, 1, 1, '2026-05-08', 1),
(12, 12, 3, '1 SP', 7890000, 100, 1, 1, '2026-05-08', 1),
(14, 13, 4, '1 SP', 1100000, 100, 1, 1, '2026-05-09', 1),
(15, 14, 4, '1 SP', 1250000, 100, 1, 0, '2026-05-09', 1),
(17, 15, 5, '1 SP', 1550000, 100, 1, 1, '2026-05-09', 1),
(18, 16, 5, '1 SP', 1200000, 100, 1, 1, '2026-05-09', 1),
(20, 17, 6, '1 SP', 1050000, 100, 1, 1, '2026-05-11', 1),
(22, 18, 6, '1 SP', 790000, 100, 1, 1, '2026-05-11', 1),
(24, 27, 6, '1 SP', 2100000, 100, 1, 0, '2026-05-11', 1),
(25, 19, 7, '1 SP', 280000, 100, 1, 1, '2026-05-11', 1),
(26, 20, 7, '1 SP', 340000, 100, 1, 1, '2026-05-11', 1),
(27, 21, 8, 'Trắng', 1485000, 100, 1, 1, '2026-05-11', 1),
(28, 22, 8, 'Vàng đồng', 600000, 100, 1, 1, '2026-05-11', 1),
(29, 23, 9, 'Đen', 1590000, 100, 1, 1, '2026-05-11', 1),
(30, 24, 9, 'Đen', 1290000, 100, 1, 1, '2026-05-11', 1),
(32, 25, 10, '1 SP', 13450000, 100, 1, 1, '2026-05-08', 1),
(33, 26, 10, 'Bếp từ ba', 23190000, 100, 1, 1, '2026-05-11', 1),
(34, 28, 1, '1 SP', 1250000, 120, 1, 0, '2026-04-23', 1),
(36, 29, 5, '1 SP', 1490000, 100, 1, 1, '2026-04-23', 1),
(38, 30, 6, '1 SP', 8990000, 10, 1, 1, '2026-05-08', 1),
(41, 31, 6, '1 SP', 15650000, 4, 1, 1, '2026-05-08', 1),
(43, 32, 11, '1 SP', 1130000, 10, 1, 1, '2026-05-09', 1),
(44, 33, 2, '1 SP', 1650000, 10, 1, 1, '2026-05-10', 1),
(46, 43, 1, '10Kg', 9900000, 100, 1, 1, '2023-11-19', 1),
(47, 43, 1, '1 SP', 789000, 100, 1, 1, '2026-05-08', 1),
(48, 44, 1, '1 SP', 890000, 100, 1, 1, '2026-05-08', 1),
(51, 50, 3, '1 SP', 1290000, 100, 1, 1, '2026-05-11', 1),
(52, 52, 4, '1 lít', 690000, 100, 1, 1, '2026-05-11', 1),
(53, 52, 4, '1.8 lít', 990000, 100, 1, 1, '2026-05-11', 1),
(54, 53, 4, '1 lít', 1090000, 100, 1, 1, '2026-05-11', 1),
(55, 53, 4, '1.8 lít', 1490000, 100, 1, 1, '2026-05-11', 1),
(56, 55, 5, '1 SP', 6570000, 50, 1, 1, '2026-05-08', 1),
(58, 45, 2, '1 SP', 1000000, 100, 1, 1, '2026-05-09', 1),
(59, 46, 2, '1 SP', 890000, 100, 1, 1, '2026-05-09', 1),
(60, 47, 2, '1 SP', 1290000, 100, 1, 1, '2026-05-09', 1),
(61, 48, 3, '3 cánh trắng', 1200000, 100, 1, 1, '2026-05-11', 1),
(62, 49, 3, '1 SP', 5990000, 100, 1, 1, '2026-05-11', 1),
(63, 51, 3, '1 SP', 860000, 100, 1, 1, '2026-05-11', 1),
(64, 54, 4, '1.8 lít', 2835000, 100, 1, 1, '2026-05-11', 1),
(65, 56, 5, 'Bếp từ đôi', 7490000, 50, 1, 1, '2026-05-11', 1),
(66, 57, 5, 'Bếp từ hồng ngoại', 5190000, 50, 1, 1, '2026-05-11', 1),
(67, 34, 11, '1 SP', 1089000, 100, 1, 1, '2026-05-10', 1),
(68, 35, 11, '1 SP', 340000, 100, 1, 0, '2026-05-11', 1),
(71, 36, 2, 'Máy lọc nước', 9500000, 10, 1, 0, '2026-05-11', 1),
(72, 37, 2, '1100 kW - Trắng', 2590000, 10, 1, 1, '2026-05-11', 1),
(73, 38, 11, '6 lít - Đen', 1550000, 100, 1, 0, '2026-05-11', 1),
(74, 39, 11, '9 lít -  Đen ', 1780000, 20, 1, 1, '2026-05-11', 1),
(75, 40, 11, '6.5 lít - Bạc ', 1790000, 30, 1, 1, '2026-05-11', 1),
(76, 41, 11, '5 lít - Đen', 2086000, 40, 1, 0, '2026-05-11', 1),
(77, 42, 11, '5.5 lít - Bạc ', 5590000, 44, 1, 1, '2026-05-11', 0),
(78, 58, 11, '1 SP', 8700000, 100, 1, 0, '2026-05-08', 1),
(79, 48, 6, '3 cánh - Đen', 1400000, 100, 1, 0, '2026-05-11', 1),
(80, 59, 1, 'Trắng', 650000, 100, 1, 0, '2026-06-04', 1),
(81, 60, 1, 'Trắng', 590000, 100, 1, 1, '2026-06-04', 1),
(82, 60, 1, 'Đen', 550000, 100, 1, 1, '2026-06-04', 1),
(83, 61, 1, 'Đen', 4490000, 100, 1, 1, '2026-06-04', 1),
(84, 62, 6, 'Đen', 2990000, 100, 1, 0, '2026-06-04', 1),
(85, 63, 6, '1 Bộ - 3 món', 1290000, 100, 1, 1, '2026-06-04', 1),
(86, 64, 7, '1 SP', 300000, 100, 1, 1, '2026-06-04', 1),
(87, 65, 12, '1 SP', 459000, 100, 1, 1, '2026-06-04', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `staff_role` varchar(100) NOT NULL,
  `staff_description` text DEFAULT NULL,
  `staff_added_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `staffs`
--

INSERT INTO `staffs` (`staff_id`, `user_id`, `staff_role`, `staff_description`, `staff_added_date`) VALUES
(1, 11, 'Giám đốc', 'Chịu trách nhiệm quản lý chung công ty', '2026-03-09'),
(2, 12, 'Trưởng phòng kinh doanh', 'Chịu trách nhiệm quản lý hoạt động kinh doanh của công ty', '2026-03-09'),
(3, 13, 'Nhân viên kinh doanh', 'Chịu trách nhiệm bán hàng và phát triển khách hàng', '2026-03-09'),
(4, 14, 'Nhân viên kỹ thuật', 'Chịu trách nhiệm hỗ trợ kỹ thuật cho khách hàng', '2026-03-09'),
(5, 15, 'Nhân viên chăm sóc khách hàng', 'Chịu trách nhiệm chăm sóc khách hàng và giải quyết các vấn đề của khách hàng', '2026-03-09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_logo`) VALUES
(3, 'LG', 'lg.png'),
(6, 'Sharp', 'sharp.png'),
(7, 'TOSHIBA', 'toshiba.png'),
(10, 'Panasonic', 'panasonic.png'),
(12, 'BOSCH', 'bosch.png'),
(13, 'BlueStone', 'blustone.png'),
(14, 'Kangaroo', 'kangaroo.png'),
(15, 'Philips', 'philips.png'),
(16, 'Pramie', 'pramie.png'),
(19, 'Ferroli', 'ferroli.png'),
(20, 'Smeg', 'smeg.png'),
(24, 'SunHouse', 'sunhouse.png'),
(30, 'LOCK&LOCK', 'lockvslock.png'),
(31, 'CUCKOO', 'cuckoo.png'),
(40, 'Hafele', 'hafele.png'),
(44, 'Electrolux', 'electrolux.png'),
(45, 'Namilux', 'namilux.png\r\n'),
(46, 'Paloma', 'paloma.png'),
(47, 'Rinnai', 'rinnai.png'),
(48, 'Lorcal', 'lorcal.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_login_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_birth` date DEFAULT NULL,
  `user_sex` enum('Nữ','Nam') DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` char(10) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_register_date` date NOT NULL DEFAULT current_timestamp(),
  `user_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_login_name`, `user_password`, `user_name`, `user_birth`, `user_sex`, `user_email`, `user_phone`, `user_address`, `user_register_date`, `user_active`) VALUES
(1, '0987654321', '$2a$08$v4pA/AZEYCidCoKy4JARaubFmovlp8NhLrvUH2fnKz3SmUqCbk6Vi', 'Nguyễn Hải Anh', '2004-06-04', 'Nữ', 'haianh@gmail.com', '0987654321', 'Thái Nguyên', '2023-08-01', 1),
(2, '0987654322', '$2a$08$Nz1suzHzccVt6ZlO6ATcKO0kWrwsIB0TdVSg7MVP2rfGG1o7k7ZZW', 'Trần Thị Nhung', '0000-00-00', 'Nữ', 'nhung@gmail.com', '0987654322', 'TP. Hồ Chí Minh', '2023-01-01', 1),
(3, '0987654323', '$2a$08$qpgiHuQ32dyAcO3Tf6OnBOeJBpY7Y5ZC7zk/gSKCuUQ07bx2AfaEG', 'Thắng Trịnh', '0000-00-00', 'Nữ', 'thang@example.com', '0987654323', 'Hà Nội', '2023-01-01', 1),
(4, '0987654324', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lộc', '1990-01-01', 'Nam', 'user4@example.com', '0987654324', 'Hải Dương', '2023-01-01', 1),
(5, '0987654325', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trần Minh', '1990-01-01', 'Nam', 'user5@example.com', '0987654325', 'Hà Nội', '2023-01-01', 1),
(6, '0987654326', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Phong', '1999-03-03', 'Nam', 'user6@example.com', '0987654326', 'Đà Nẵng', '2023-01-01', 1),
(7, '0987654327', '$2a$08$Rc6y5p2uHxB0/ssPRktfbejiIAQGg.rw4VhbCOSuM3v5AjI1K8Lo2', 'Trang Đoàn', '1999-03-03', 'Nam', 'user7@example.com', '0987654327', 'Đồng Nai', '2023-01-01', 1),
(8, '0987654328', '$2a$08$jQQKQXKX3uivvRmccahg5ufWAyXh1zP4FWB8l5SqBqXnag/7z1lqy', 'Mai Hồng vũ', '1999-03-03', 'Nam', 'user8@example.com', '0987654328', 'Đà Nẵng', '2023-01-01', 1),
(9, '0987654329', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Mai Anh', '1999-03-03', 'Nam', 'user9@example.com', '0987654329', 'Bình Phước', '2023-01-01', 1),
(10, '0987654330', '$2a$08$0m1GOBy9KMKNCW4hdvXSs.xPQgBqfN7.sg3L/GCX/jSoUQLixEdNu', 'Ngọc Ngà', '1999-03-03', 'Nam', 'user10@example.com', '0987654330', 'Cần Thơ', '2023-01-01', 1),
(11, '0987654331', '$2a$08$vkZsW.Lo8ZOYbR6HBvABAOd9Nct77buFwGy6zz5AAIh2o.Boh5Xji', 'Hiền Lê', '1999-03-03', 'Nam', 'user11@example.com', '0987654331', '', '2023-01-01', 1),
(12, '0987654332', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Bích Trâm', '1999-03-03', 'Nữ', 'user12@example.com', '0987654332', 'Bình Dương', '2023-01-01', 1),
(13, '0987654333', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Diệu Huyền', '1999-03-03', 'Nữ', 'user13@example.com', '0987654333', 'Bình Dương', '2023-01-01', 1),
(14, '0987654334', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trần Trí', '1999-03-03', 'Nữ', 'user14@example.com', '0987654334', 'Bình Dương', '2023-01-01', 1),
(15, '0987654335', '$2a$08$xu1si4Gmcx21/xTKaAAktepQh0RjtDZpPSyULUR9Rfpix3ihhLgRm', 'Nguyễn Hoàng PHương Linh', '1999-03-03', 'Nữ', 'user15@example.com', '0987654335', 'Bình Dương', '2023-01-01', 1),
(31, '0987296708', '$2a$08$YzCffpozMPsdIMzoZ21M7.lbdOBdOgCobDdKZaZpU8u6RgUeb9zUm', 'Hồng Nhung', NULL, NULL, NULL, '0987296708', NULL, '2023-12-15', 1),
(32, '0997654321', '$2a$08$m34kubjtYr2Hd5YufiNuUOTkGX92FjTKJ6dklXfgFKiWdCA7fRc.e', 'Hồng Nhung', NULL, NULL, NULL, '0997654321', NULL, '2023-12-15', 1),
(33, '0887654321', '$2a$08$EX.tL8w9RDCIXlHXR8/yIuzFkaUFqPDiNuE7vZJCNxzD5u1f5KzcK', 'Linh Phương', NULL, NULL, NULL, '0887654321', NULL, '2023-12-15', 1),
(34, '0945404959', '$2a$08$PXj1h/982Fm0h6lhM/94POlYCEQTBIA9YggG//QK3z2zd4CGKbMmu', 'trang', NULL, NULL, NULL, '0945404959', NULL, '2026-04-22', 1),
(35, '0912345789', '$2a$08$0/0l7SHCSxuOLPvyXoEGzu0goCsus0WscS5.NGNqqIDk3q4HrftYe', 'Nguyễn Thu Hiền', NULL, NULL, NULL, '0912345789', NULL, '2026-05-11', 1),
(36, '0365749221', '$2a$08$RTgsK43nGc.L3HxvKcrpYO2IDp3.WadY0qhplB8Ymk0o35TvdP48.', 'NGUYEN THI HUONG GIANG', '2004-04-03', 'Nữ', '', '0365749221', '', '2026-05-14', 1),
(37, '0325507844', '$2a$08$2GnLV1ND0ZAKxJi6IA/90uMd7acLDOU9.9bX7yVvrowpQ99mwdG5S', 'Giang Na Mấn', NULL, NULL, NULL, '0325507844', NULL, '2026-06-03', 1),
(38, '0986060281', '$2a$08$SKnxb3t3OJnGfrP4BqaGkewsmKATr8fRMtjx9o9pGDyOwqPr.gtrS', 'Nguyễn Thu Hiền', NULL, NULL, NULL, '0986060281', NULL, '2026-06-03', 1),
(39, '0986060285', '$2a$08$wCLEY3Ho21nH7sVS.D1ji.Yh15ElYlCtcHwrszGmwSDlevuvJOS3u', 'Trần Hoài An', NULL, NULL, NULL, '0986060285', NULL, '2026-06-03', 1),
(40, '0986060283', '$2a$08$SBiHuCkZ0qVuyADmsmnpT.Mu2BEJ6G0ijzpvinjWfcVm40yUioyGi', 'Trần Bảo Ngọc', NULL, NULL, NULL, '0986060283', NULL, '2026-06-03', 1),
(41, '0912345678', '$2a$08$gt8CJBhRDfhaOV0eQlGA4OIBG4l0hi5nY5lxYe0BPs0HWbPCOvdGy', 'Trần Tuấn Anh', NULL, NULL, NULL, '0912345678', NULL, '2026-06-03', 1),
(42, '0912345679', '$2a$08$GB7/h2B6BiNjQqejcIgcUO/rX.VXwn47x./A2ujFCe7N3V9tF06cq', 'Nguyễn Thị Bích Phượng', NULL, NULL, NULL, '0912345679', NULL, '2026-06-03', 1),
(43, '0912345677', '$2a$08$ed/G8TKQIcrz21Drz.chiOCahApFEgemE/BCrg/ofq1I4KAN1C4ES', 'Trần Văn A', NULL, NULL, NULL, '0912345677', NULL, '2026-06-03', 1),
(44, '0912345666', '$2a$08$jDUvDkkJzRLPum2u7HkYCeVMAM8R682e3V0vwsEC4bb3iGOy32nsi', 'Trần Văn B', NULL, NULL, NULL, '0912345666', NULL, '2026-06-03', 1),
(45, '0912345688', '$2a$08$021lwn/flflpCcvaiPu28OW/8PXjQVTenXuIVPUNGKOLlN9BC0Crq', 'Trần Ngọc An', NULL, NULL, NULL, '0912345688', NULL, '2026-06-03', 1),
(46, '0912345555', '$2a$08$Jj3.Xrwimuh9xJ857hQSKe7zIF2vM98R6z/46KCHWp2DA1zuGi2m2', 'Phạm Hương Giang', NULL, NULL, NULL, '0912345555', NULL, '2026-06-03', 1),
(47, '0912345668', '$2a$08$HsH0JacpKWs.SIRgtapOWOMsXMxatDy/JWBMnF1M.ENQVsdsy8tc2', 'Phạm Bảo Ngọc', NULL, NULL, NULL, '0912345668', NULL, '2026-06-03', 1),
(48, '0912345444', '$2a$08$z5sguC1nGFTDmDUPrlJOu.amJj2cWWKGBxZaUflpkSOCUZ2Y5lk4u', 'Phạm Hoài An', NULL, NULL, NULL, '0912345444', NULL, '2026-06-03', 1),
(49, '0912345333', '$2a$08$ZLgvmXBFu.TXGt2RtD5TkeY6ut/gvqzJ/UXvWkUfajRdj/sUYAdSe', 'Lê Văn', NULL, NULL, NULL, '0912345333', NULL, '2026-06-03', 1),
(50, '0912345111', '$2a$08$bBXMykFfgySTtP0UfjTXX.A2uyJolig2oWcvpjWD7PYwseykzo41G', 'Ngô Giang', NULL, NULL, NULL, '0912345111', NULL, '2026-06-03', 1),
(51, '0912345888', '$2a$08$R3Yl2Vtcv3kCMwIQZnyLzuuYLnOy/X7aZ3EOZYGZoXQv7vetg88Re', 'Ngô Trang', '0000-00-00', 'Nữ', '', '0912345888', '', '2026-06-03', 1),
(52, '0912345876', '$2a$08$CPwX1qm17I0uU5u/nm.b6uv/rl9nevEt5wrNXbIohD6wqW2o5h1Si', 'Ngô An', NULL, NULL, NULL, '0912345876', NULL, '2026-06-03', 1),
(53, '0912345768', '$2a$08$tPtsJtYxx1JYCrV696oSO.l7VjBaASn9/UFEKHQdkGKJe.GbWI/1e', 'Hoài Linh', NULL, NULL, NULL, '0912345768', NULL, '2026-06-03', 1),
(54, '0912345543', '$2a$08$.r48byMtnFwGjt1oFuzFKOdRt4BVpoV4kBVjdO3ntpJj60HS4yH66', 'Ngọc Anh', NULL, NULL, NULL, '0912345543', NULL, '2026-06-03', 1),
(55, '0912345123', '$2a$08$tfGOrSuxXq/iWCWYvroDyunbf.oqRN/GAw2ivXxXJQ8CYS/t6mkIW', 'Ngọc Linh', NULL, NULL, NULL, '0912345123', NULL, '2026-06-03', 1),
(56, '0988123123', '$2a$08$K/0rDHYnEcCPuFdNpFBspO96z8rZzYaWUpGpNS5HvgHZcNuLAjJnu', 'Hương Anh', NULL, NULL, NULL, '0988123123', NULL, '2026-06-03', 1),
(57, '0912333444', '$2a$08$yb9Vbvi04eoLDjU/Xc99JOGAAx5zWPPzycWkcqNLhFXT8pL1cSU3i', 'Thiên Hương', NULL, NULL, NULL, '0912333444', NULL, '2026-06-03', 1),
(58, '0986555444', '$2a$08$hMm9tPiTyAVDMjyMkO9Tg.ijVLXHchrPrXS83JV59Qk03cPukW0zG', 'Hoài Anh', NULL, NULL, NULL, '0986555444', NULL, '2026-06-03', 1),
(59, '0987555123', '$2a$08$BUlD52HdsBoYtMx.o8em4eyjMTbhFVt2sbgTT019f78AR9s0Jq5UC', 'Lệ', NULL, NULL, NULL, '0987555123', NULL, '2026-06-03', 1),
(60, '0987222444', '$2a$08$Nc/KHwCDwtIA..9r8jge8u7W3wfWxJORvYFFIgUfo.Mp48AKW7DDS', 'Trần T', NULL, NULL, NULL, '0987222444', NULL, '2026-06-03', 1),
(61, '0965888777', '$2a$08$EL0Ij7XUfkJescj.HP2.RezhboKf6h1ADIDhQ30EOW948bdF/nhsq', 'Khanh', NULL, NULL, NULL, '0965888777', NULL, '2026-06-03', 1),
(62, '0988777666', '$2a$08$LCnKJ9TFj0VP2u8yYGc4neyM2xAQnAjEhRT/YsVuItEm69aaEoMMG', 'Khoa', NULL, NULL, NULL, '0988777666', NULL, '2026-06-03', 1),
(63, '0912335678', '$2a$08$JFjdE.1/W3pDR.x0RtM87e5SCA0xJ3lW7jh4R7TfZLiDTIlg9.IEu', 'Huyền', NULL, NULL, NULL, '0912335678', NULL, '2026-06-03', 1),
(64, '0945404999', '$2a$08$oAjdqO5mA8J3mIU646tTPuzeHj7JPo7MKeBCEJ6zdSx5FUPX8WJgG', 'Hoài', NULL, NULL, NULL, '0945404999', NULL, '2026-06-03', 1),
(65, '0945404567', '$2a$08$7IQBdGOceFNR5JMbbBHlcuXr6ldgKLvOVjBjQwK6dMgmQdhfVoWx6', 'Bống', NULL, NULL, NULL, '0945404567', NULL, '2026-06-03', 1),
(66, '0934456789', '$2a$08$vNd/vCHxg8VQ4gmk1YmoZ.Yut.6gwauHil2JnHUc793jqnrMyWl2m', 'Bông', NULL, NULL, NULL, '0934456789', NULL, '2026-06-03', 1),
(67, '0981777666', '$2a$08$fa8BYJjzM.hPiLYqSd5bT.e0SCQkOaf1vA3PpjGYyiaiuDM1LYuyW', 'Linh Anh', NULL, NULL, NULL, '0981777666', NULL, '2026-06-03', 1),
(68, '0912876543', '$2a$08$4j77wUjZz.VgdSPj3TAVF.7TuQlAm7RhoGP3jp0y3/Ptf1Pxdtvm.', 'Ngọc Ánh', NULL, NULL, NULL, '0912876543', NULL, '2026-06-03', 1),
(69, '0325716426', '$2a$08$NNru/DkW7xKoGYuffStYxOP8KCFutTw2rTDrsAENZ4dGISoNc0bBa', 'Hoa', NULL, NULL, NULL, '0325716426', NULL, '2026-06-03', 1),
(70, '0925717825', '$2a$08$/Ph3PrZTigjphpEIbmJ6sulUYU4i2oBy6sKyxSR748bW8kmdA1klW', 'Mai', NULL, NULL, NULL, '0925717825', NULL, '2026-06-03', 1),
(71, '0325672875', '$2a$08$o1ZDXMv5qHGCbtB1RQ9qVO/RLXTNShMaKE.atCuormWR8F/Zlq.Qm', 'Linh', NULL, NULL, NULL, '0325672875', NULL, '2026-06-03', 1),
(72, '0923517725', '$2a$08$7qTd1JssmtYmuCZ2iqluH.ZUxcoDSQGJizwPxDXYpPNCTj0BQp4oa', 'Lan', NULL, NULL, NULL, '0923517725', NULL, '2026-06-03', 1),
(73, '0342571838', '$2a$08$y.8eAsJk7Hlq37V3Q6j8EOowW.OCe1OtuRgvsE3Ns4sb.PamKuaqW', 'Thảo', NULL, NULL, NULL, '0342571838', NULL, '2026-06-03', 1),
(74, '0342571927', '$2a$08$Xeza2O/U96k8y/kb54gcMe2dQytPuom9gINxvFne5PnMv.Et2PGny', 'Nhi', NULL, NULL, NULL, '0342571927', NULL, '2026-06-03', 1),
(75, '0845345864', '$2a$08$qDF6orIyxRADbRsPeT1n2OMDM4i1ya.FWxGxI0BeMyreEwKl6z.u2', 'DƯA HẤU', NULL, NULL, NULL, '0845345864', NULL, '2026-06-03', 1),
(76, '0865453246', '$2a$08$du4bAWOgzTV.YcSpcV/WYenHwOrO3q3QobSp2I6gQsQSc5AlYhIXO', 'Ngọc', NULL, NULL, NULL, '0865453246', NULL, '2026-06-03', 1),
(77, '0324617384', '$2a$08$HumvhDyhiIhO9y5N0q4KreiMWBrceLqq0aFIUtFXi2Cc8zkxSAQTu', 'Hà', NULL, NULL, NULL, '0324617384', NULL, '2026-06-03', 1),
(78, '0987252612', '$2a$08$/PuZnvAjS/b03hCkG5iZ2ef0wZVjS3RIm7AeZwqAfeKy2Sxn75Si2', 'Huyền', NULL, NULL, NULL, '0987252612', NULL, '2026-06-03', 1),
(79, '0987524517', '$2a$08$v35k6rHQCwzDC06lQt98VuRQyG6TKo/dqJQj53pTCYA47RoPwzpjW', 'Oanh', NULL, NULL, NULL, '0987524517', NULL, '2026-06-03', 1),
(80, '0926426812', '$2a$08$vuFp2Rfe94kP7Bi2GS/un.pL3PmPAcmWXoFlLVD9.jwuoZFeiqJAy', 'Uyên', NULL, NULL, NULL, '0926426812', NULL, '2026-06-03', 1),
(81, '0987654346', '$2a$08$0tr/brNa9OuptYZrPd3GFuukvumcWxhNyReoxYCdtOQehsWg3eddW', 'Yến', NULL, NULL, NULL, '0987654346', NULL, '2026-06-03', 1),
(82, '0976543627', '$2a$08$NGsjq2Wqlgj/SQ2Lw4o14OQNq7IYNq4iyPAoaPl.g.gI8TH9s84aa', 'Thuỷ', NULL, NULL, NULL, '0976543627', NULL, '2026-06-03', 1),
(83, '0987526342', '$2a$08$TmSnFwxbf76aaklISgbtr.1wBfE7i407yhlluY20rr6HUY.5OF/46', 'Thuý', NULL, NULL, NULL, '0987526342', NULL, '2026-06-03', 1),
(84, '0342576512', '$2a$08$zeL8TSBVSkZ/k8p9E.izsOzA8BmZIXOgH3jAb.uTFrM8Tcja04HvC', 'Chi', NULL, NULL, NULL, '0342576512', NULL, '2026-06-03', 1),
(85, '0342567183', '$2a$08$OKzIOU6JO8mvbGWaiAQq3O8eAzTLjz7nR8Nzh0fR2uxOUH04XeG3q', 'Phương', NULL, NULL, NULL, '0342567183', NULL, '2026-06-03', 1),
(86, '0987263512', '$2a$08$s73uUIux4GMxhNTCcyl.VeIyLXqRvyYCzXcMdvaHmrLa1mDPEnmdW', 'Ánh', NULL, NULL, NULL, '0987263512', NULL, '2026-06-03', 1),
(87, '0983647281', '$2a$08$jUh02kMRdpYEkxweYfjHP.CcQJdM3i7BAJx9.78LyVDZZX/NeW3Vu', 'Quyên', NULL, NULL, NULL, '0983647281', NULL, '2026-06-03', 1),
(88, '0987354712', '$2a$08$HuTwMGbUgXUxXQJRJzpFm.D6qpFq1cB2Jyp00sJrKpgJ6IxlApBca', 'Thư', NULL, NULL, NULL, '0987354712', NULL, '2026-06-03', 1),
(89, '0342561782', '$2a$08$4QV6Gh1tQpadTF/Kzudr7OcrE/lXrQxP241Cxz7U6Vqu/l6FlOTKa', 'Trang', NULL, NULL, NULL, '0342561782', NULL, '2026-06-03', 1),
(90, '0362781923', '$2a$08$vzCe3hcoJd8.4thdngeNhOue8tV8Mvyxu6cOwpaZkqEoEgUYGe3BK', 'măng cụt', NULL, NULL, NULL, '0362781923', NULL, '2026-06-03', 1),
(91, '0987126332', '$2a$08$L2j1hvQHtB/kf5aXJMhWautK58XYgBjUuIi6tc0lrdbYsAblpT9wi', 'nhi', NULL, NULL, NULL, '0987126332', NULL, '2026-06-03', 1),
(92, '0837527391', '$2a$08$teDpTmKCh8HMcZ1PvSQgEesoUJChLqwiNuF/lZvOR.I1JzFAl2I9K', 'hiền', NULL, NULL, NULL, '0837527391', NULL, '2026-06-03', 1),
(93, '0937427423', '$2a$08$yl.lOyA4q6iDJvkTp6KYC.Qdxld7YyvQXYCMypqwBbpJ/Oyf9vSZu', 'hậu', NULL, NULL, NULL, '0937427423', NULL, '2026-06-03', 1),
(94, '0374628193', '$2a$08$MHENoEYQdPKB/Dyxyih8N.G3iEQ24V9eT8ofPXEFFpbsKdiOQdGaW', 'ly', NULL, NULL, NULL, '0374628193', NULL, '2026-06-03', 1),
(95, '0394623864', '$2a$08$QAM8ZKVVJXaqjcf32FwWd.7a3En4.LIiez.fQus0svI9DLsl42pQG', 'diễm', NULL, NULL, NULL, '0394623864', NULL, '2026-06-03', 1),
(96, '0987635426', '$2a$08$LIbIp3a.FUgwljmWrzzVluEsQFafA7nHW54UYFNAhLNN9ySbCVVYa', 'cam', NULL, NULL, NULL, '0987635426', NULL, '2026-06-03', 1),
(97, '0983752734', '$2a$08$PmjhLovzYHyEd8gq21XvQ.VsFOOmpE.PnTTcjFhGSEKN0rusxfav.', 'quýt', NULL, NULL, NULL, '0983752734', NULL, '2026-06-03', 1),
(98, '0965342517', '$2a$08$EyPJET5Ng0dsmM9dtYqiH.1t.MQuNTPeOt1Whi.kSs9vSFxVtKCzy', 'gấu', NULL, NULL, NULL, '0965342517', NULL, '2026-06-03', 1),
(99, '0325637635', '$2a$08$fCep1xJ2tgYCH2lYcNJ4QOfXcmiNdM7vPqKmbMqQ38OBLFrqHnSjO', 'linh', NULL, NULL, NULL, '0325637635', NULL, '2026-06-03', 1),
(100, '0937517393', '$2a$08$nzXS24xWDleoyBKFEyOdCe.5/7GpjsCvHW7w3nQ6ZN9Zqx0kzsvTm', 'My', NULL, NULL, NULL, '0937517393', NULL, '2026-06-03', 1),
(101, '0937527391', '$2a$08$a5JG/vsya0GDryqQprM2J.gIAHr4uE/fGbOiRiVdA6JxVvYKdyqG2', 'phượng', NULL, NULL, NULL, '0937527391', NULL, '2026-06-03', 1),
(102, '0342571837', '$2a$08$p/zME0711Pr7qi9W7DHwmu2V6YxKoYsxBFr4afH.0j7UtIEvu.1va', 'nguyệt', NULL, NULL, NULL, '0342571837', NULL, '2026-06-03', 1),
(103, '0384725183', '$2a$08$JtSlVsQAGN9cv1albsPAMejfUi2gszMK1vpWtTVrZ3mchwwNWH29W', 'nga', NULL, NULL, NULL, '0384725183', NULL, '2026-06-03', 1),
(104, '0983753617', '$2a$08$kB6uw2eWo2tr86HjmssTIuWwxJ28kfoBm.M7NZEq6dvB1eDmlQhwe', 'lan anh', NULL, NULL, NULL, '0983753617', NULL, '2026-06-03', 1),
(105, '0983753622', '$2a$08$8KMyt2Kr24ynRi1os5GpS.wLNHw0MMD/.BxC2x/kns5Y0T/R/irM6', 'trinh', NULL, NULL, NULL, '0983753622', NULL, '2026-06-03', 1),
(106, '0982736762', '$2a$08$mTiL/ncYieKFE7fDwp7UcupFytL5kHomJNFA1N2mmopF7snhhMLvS', 'Phương', NULL, NULL, NULL, '0982736762', NULL, '2026-06-03', 1),
(107, '0938635274', '$2a$08$K2C6letJCnFSOxzwRmGacekS6vF14lvTT4.qCaMst1bUOWLvRS/DK', 'trà', NULL, NULL, NULL, '0938635274', NULL, '2026-06-03', 1),
(108, '0983627823', '$2a$08$BPgoPYQgOYF3mxAOZam1/uFG97o9Fhi4MHBdedMWWald2OVs9Uch6', 'xuân', NULL, NULL, NULL, '0983627823', NULL, '2026-06-03', 1),
(109, '0928362732', '$2a$08$Ts9yHICN.3/SIJD8nL8tceXS8URHOj3Dd/FBlaC2NE8xP0P1nUo1e', 'thư', NULL, NULL, NULL, '0928362732', NULL, '2026-06-03', 1),
(110, '0938362738', '$2a$08$8H4TsFz01D7m1r76G2YIVeO/o07anL2rYZ/Sz5HZTF228IlCH09le', 'huệ', NULL, NULL, NULL, '0938362738', NULL, '2026-06-03', 1),
(111, '0947368294', '$2a$08$DMw3bFhVK4bRRsDXF4FCTOhIlH53DfqbFF0iCMBotfTNeFXVEHOL.', 'THUỲ DƯƠNG', NULL, NULL, NULL, '0947368294', NULL, '2026-06-03', 1),
(112, '0937462742', '$2a$08$gYCB3Jl494jrHjpcVP9NYufu55ss.8fIocundnw398ZO6MEM3QOOG', 'MAI ANH', NULL, NULL, NULL, '0937462742', NULL, '2026-06-03', 1),
(113, '0342517333', '$2a$08$lw4ql6seqOB1RoN/.M0u3Oe1pUYO7QN8ni0XrKleK/xutGk9zDJne', 'VÂN ANH', NULL, NULL, NULL, '0342517333', NULL, '2026-06-03', 1),
(114, '0394629263', '$2a$08$Nh7Emfu4GQMn5ZGQlKNoqehdw8QXEHZFLQXfcViTFk/TgpEp7NsQS', 'VY', NULL, NULL, NULL, '0394629263', NULL, '2026-06-03', 1),
(115, '0987363426', '$2a$08$WxEmh2nLpi.EaRXjFTkHEetWD2O6P2Z477TeUbTDOJF5qSL/AmYsy', 'Ngọc', NULL, NULL, NULL, '0987363426', NULL, '2026-06-03', 1);

--
-- Bẫy `users`
--
DELIMITER $$
CREATE TRIGGER `trg_users_after_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO customers (user_id)
    VALUES (NEW.user_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_notification`
--

CREATE TABLE `user_notification` (
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `user_notification_is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user_notification`
--

INSERT INTO `user_notification` (`user_id`, `notification_id`, `user_notification_is_read`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 6, 0),
(3, 6, 0),
(4, 6, 0),
(5, 6, 0),
(6, 6, 0),
(7, 6, 0),
(8, 6, 0),
(9, 6, 0),
(10, 6, 0);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_cart`
-- (See below for the actual view)
--
CREATE TABLE `view_cart` (
`customer_id` int(11)
,`cart_quantity` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_cate_admin`
-- (See below for the actual view)
--
CREATE TABLE `view_cate_admin` (
`category_id` int(11)
,`category_name` varchar(100)
,`category_img` varchar(100)
,`categorry_type` varchar(50)
,`category_added_date` date
,`category_is_display` tinyint(1)
,`product_count` bigint(21)
,`revenue` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_count_cart`
-- (See below for the actual view)
--
CREATE TABLE `view_count_cart` (
`customer_id` int(11)
,`user_id` int(11)
,`count_cart` bigint(21)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_dashboard`
-- (See below for the actual view)
--
CREATE TABLE `view_dashboard` (
`customer_count` bigint(21)
,`quantity_sold` bigint(21)
,`revenue` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_discounts`
-- (See below for the actual view)
--
CREATE TABLE `view_discounts` (
`discount_id` int(11)
,`discount_name` varchar(100)
,`discount_description` text
,`discount_start_date` date
,`discount_end_date` date
,`discount_amount` float
,`discount_is_display` tinyint(1)
,`discount_img` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_getchart_revenue`
-- (See below for the actual view)
--
CREATE TABLE `view_getchart_revenue` (
`year` int(4)
,`month` int(2)
,`order_success` bigint(21)
,`revenue` decimal(32,0)
,`order_cancel` bigint(21)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_getchart_top5_product`
-- (See below for the actual view)
--
CREATE TABLE `view_getchart_top5_product` (
`product_variant_id` int(11)
,`quantity_sold` decimal(32,0)
,`revenue` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_notifications`
-- (See below for the actual view)
--
CREATE TABLE `view_notifications` (
`notification_id` int(11)
,`notification_type_id` int(11)
,`notification_title` varchar(100)
,`notification_subtitle` text
,`notification_content` text
,`notification_date` date
,`notification_is_display` tinyint(1)
,`user_id` int(11)
,`user_notification_is_read` tinyint(1)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_order`
-- (See below for the actual view)
--
CREATE TABLE `view_order` (
`order_id` int(11)
,`customer_id` int(11)
,`staff_id` int(11)
,`order_name` varchar(100)
,`order_phone` varchar(10)
,`order_date` date
,`order_delivery_date` date
,`order_delivery_address` varchar(100)
,`order_note` text
,`order_total_before` int(11)
,`order_total_after` int(11)
,`paying_method_id` int(11)
,`order_paying_date` date
,`order_is_paid` tinyint(1)
,`order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy')
,`paying_method_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_orders`
-- (See below for the actual view)
--
CREATE TABLE `view_orders` (
`order_id` int(11)
,`customer_id` int(11)
,`staff_id` int(11)
,`order_name` varchar(100)
,`order_phone` varchar(10)
,`order_date` date
,`order_delivery_date` date
,`order_delivery_address` varchar(100)
,`order_note` text
,`order_total_before` int(11)
,`order_total_after` int(11)
,`paying_method_id` int(11)
,`order_paying_date` date
,`order_is_paid` tinyint(1)
,`order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy')
,`paying_method_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_order_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_order_detail` (
`order_id` int(11)
,`product_variant_id` int(11)
,`order_detail_quantity` int(11)
,`order_detail_price_before` int(11)
,`order_detail_price_after` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_variant_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_products_admin`
-- (See below for the actual view)
--
CREATE TABLE `view_products_admin` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
,`product_count` bigint(21)
,`quantity_sold` decimal(42,0)
,`revenue` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_products_info`
-- (See below for the actual view)
--
CREATE TABLE `view_products_info` (
`product_id` int(11)
,`category_id` int(11)
,`product_name` varchar(100)
,`supplier_id` int(11)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_description` text
,`product_period` int(11)
,`product_view_count` int(11)
,`product_is_display` tinyint(1)
,`product_variant_id` int(11)
,`discount_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_products_resume`
-- (See below for the actual view)
--
CREATE TABLE `view_products_resume` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`product_variant_price` float
,`product_lastdate_added` date
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_product_feedbacks`
-- (See below for the actual view)
--
CREATE TABLE `view_product_feedbacks` (
`product_variant_name` varchar(100)
,`product_id` int(11)
,`feedback_id` int(11)
,`product_variant_id` int(11)
,`customer_id` int(11)
,`order_id` int(11)
,`feedback_date` date
,`feedback_rate` int(11)
,`feedback_content` text
,`feedback_is_display` tinyint(1)
,`feedback_img_id` int(11)
,`feedback_img_name` varchar(100)
,`user_name` varchar(100)
,`user_avt_img` binary(0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_product_variants`
-- (See below for the actual view)
--
CREATE TABLE `view_product_variants` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_product_variant_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_product_variant_detail` (
`product_variant_id` int(11)
,`product_id` int(11)
,`discount_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_stock` tinyint(1)
,`product_variant_is_bestseller` tinyint(1)
,`product_variant_added_date` date
,`product_variant_is_display` tinyint(1)
,`discount_name` varchar(100)
,`discount_description` text
,`discount_start_date` date
,`discount_end_date` date
,`discount_amount` float
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`user_id` int(11)
,`user_login_name` varchar(100)
,`user_password` varchar(100)
,`user_name` varchar(100)
,`user_birth` date
,`user_sex` enum('Nữ','Nam')
,`user_email` varchar(100)
,`user_phone` char(10)
,`user_address` varchar(255)
,`user_register_date` date
,`user_active` tinyint(1)
,`customer_id` int(11)
,`user_avt_img` binary(0)
);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_cart`
--
DROP TABLE IF EXISTS `view_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cart`  AS SELECT `carts`.`customer_id` AS `customer_id`, `carts`.`cart_quantity` AS `cart_quantity`, `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_rate` AS `product_rate`, `view_product_variants`.`product_view_count` AS `product_view_count`, `view_product_variants`.`product_period` AS `product_period`, `view_product_variants`.`category_id` AS `category_id`, `view_product_variants`.`category_name` AS `category_name`, `view_product_variants`.`product_variant_id` AS `product_variant_id`, `view_product_variants`.`product_variant_name` AS `product_variant_name`, `view_product_variants`.`product_variant_price` AS `product_variant_price`, `view_product_variants`.`product_variant_available` AS `product_variant_available`, `view_product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_product_variants`.`discount_amount` AS `discount_amount`, `view_product_variants`.`discount_description` AS `discount_description` FROM (`carts` left join `view_product_variants` on(`carts`.`product_variant_id` = `view_product_variants`.`product_variant_id`)) ORDER BY `carts`.`cart_added_date` DESC ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_cate_admin`
--
DROP TABLE IF EXISTS `view_cate_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cate_admin`  AS SELECT `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `categories`.`category_img` AS `category_img`, `categories`.`categorry_type` AS `categorry_type`, `categories`.`category_added_date` AS `category_added_date`, `categories`.`category_is_display` AS `category_is_display`, coalesce(`product_counts`.`product_count`,0) AS `product_count`, coalesce(sum(`order_details`.`order_detail_price_after`),0) AS `revenue` FROM ((`categories` left join (select `products`.`category_id` AS `category_id`,count(0) AS `product_count` from `products` group by `products`.`category_id`) `product_counts` on(`categories`.`category_id` = `product_counts`.`category_id`)) left join `order_details` on(`order_details`.`product_variant_id` in (select `view_products_resume`.`product_variant_id` from (`view_products_resume` join `orders`) where `view_products_resume`.`category_id` = `categories`.`category_id` and `orders`.`order_id` = `order_details`.`order_id` and `orders`.`order_is_paid` = 1 and `orders`.`order_status` = 'Hoàn thành'))) GROUP BY `categories`.`category_id`, `categories`.`category_name` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_count_cart`
--
DROP TABLE IF EXISTS `view_count_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_count_cart`  AS SELECT `customers`.`customer_id` AS `customer_id`, `users`.`user_id` AS `user_id`, count(`carts`.`product_variant_id`) AS `count_cart` FROM ((`users` left join `customers` on(`users`.`user_id` = `customers`.`customer_id`)) left join `carts` on(`carts`.`customer_id` = `customers`.`customer_id`)) GROUP BY `customers`.`customer_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_dashboard`
--
DROP TABLE IF EXISTS `view_dashboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_dashboard`  AS SELECT (select count(0) from `customers`) AS `customer_count`, (select count(0) from `orders` where `orders`.`order_status` <> 'Đã hủy') AS `quantity_sold`, (select coalesce(sum(`od`.`order_detail_quantity` * `od`.`order_detail_price_after`),0) from (`orders` `o` join `order_details` `od` on(`o`.`order_id` = `od`.`order_id`)) where `o`.`order_is_paid` = 1 and `o`.`order_status` <> 'Đã hủy') AS `revenue` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_discounts`
--
DROP TABLE IF EXISTS `view_discounts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_discounts`  AS SELECT `discounts`.`discount_id` AS `discount_id`, `discounts`.`discount_name` AS `discount_name`, `discounts`.`discount_description` AS `discount_description`, `discounts`.`discount_start_date` AS `discount_start_date`, `discounts`.`discount_end_date` AS `discount_end_date`, `discounts`.`discount_amount` AS `discount_amount`, `discounts`.`discount_is_display` AS `discount_is_display`, `discounts`.`discount_img` AS `discount_img` FROM `discounts` WHERE cast(`discounts`.`discount_end_date` as date) > current_timestamp() AND cast(`discounts`.`discount_start_date` as date) < current_timestamp() AND `discounts`.`discount_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_getchart_revenue`
--
DROP TABLE IF EXISTS `view_getchart_revenue`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_getchart_revenue`  AS SELECT `success`.`year` AS `year`, `success`.`month` AS `month`, `success`.`order_success` AS `order_success`, `success`.`revenue` AS `revenue`, `cancel`.`order_cancel` AS `order_cancel` FROM ((select year(`orders`.`order_date`) AS `year`,month(`orders`.`order_date`) AS `month`,count(`orders`.`order_id`) AS `order_success`,sum(`orders`.`order_total_after`) AS `revenue` from `orders` where `orders`.`order_is_paid` = 1 group by year(`orders`.`order_date`),month(`orders`.`order_date`)) `success` left join (select year(`orders`.`order_date`) AS `year`,month(`orders`.`order_date`) AS `month`,count(`orders`.`order_id`) AS `order_cancel` from `orders` where `orders`.`order_status` = 'Đã hủy' group by year(`orders`.`order_date`),month(`orders`.`order_date`)) `cancel` on(`cancel`.`year` = `success`.`year` and `cancel`.`month` = `success`.`month`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_getchart_top5_product`
--
DROP TABLE IF EXISTS `view_getchart_top5_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_getchart_top5_product`  AS SELECT `order_details`.`product_variant_id` AS `product_variant_id`, sum(`order_details`.`order_detail_quantity`) AS `quantity_sold`, sum(`order_details`.`order_detail_price_after` * `order_details`.`order_detail_quantity`) AS `revenue` FROM (`orders` left join `order_details` on(`order_details`.`order_id` = `orders`.`order_id`)) WHERE `orders`.`order_status` = 'Hoàn thành' GROUP BY `order_details`.`product_variant_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_notifications`
--
DROP TABLE IF EXISTS `view_notifications`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_notifications`  AS SELECT `notifications`.`notification_id` AS `notification_id`, `notifications`.`notification_type_id` AS `notification_type_id`, `notifications`.`notification_title` AS `notification_title`, `notifications`.`notification_subtitle` AS `notification_subtitle`, `notifications`.`notification_content` AS `notification_content`, `notifications`.`notification_date` AS `notification_date`, `notifications`.`notification_is_display` AS `notification_is_display`, `user_notification`.`user_id` AS `user_id`, `user_notification`.`user_notification_is_read` AS `user_notification_is_read` FROM (`notifications` left join `user_notification` on(`notifications`.`notification_id` = `user_notification`.`notification_id`)) WHERE `notifications`.`notification_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_order`
--
DROP TABLE IF EXISTS `view_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`customer_id` AS `customer_id`, `orders`.`staff_id` AS `staff_id`, `orders`.`order_name` AS `order_name`, `orders`.`order_phone` AS `order_phone`, `orders`.`order_date` AS `order_date`, `orders`.`order_delivery_date` AS `order_delivery_date`, `orders`.`order_delivery_address` AS `order_delivery_address`, `orders`.`order_note` AS `order_note`, `orders`.`order_total_before` AS `order_total_before`, `orders`.`order_total_after` AS `order_total_after`, `orders`.`paying_method_id` AS `paying_method_id`, `orders`.`order_paying_date` AS `order_paying_date`, `orders`.`order_is_paid` AS `order_is_paid`, `orders`.`order_status` AS `order_status`, `paying_methods`.`paying_method_name` AS `paying_method_name` FROM (`orders` left join `paying_methods` on(`orders`.`paying_method_id` = `paying_methods`.`paying_method_id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_orders`
--
DROP TABLE IF EXISTS `view_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_orders`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`customer_id` AS `customer_id`, `orders`.`staff_id` AS `staff_id`, `orders`.`order_name` AS `order_name`, `orders`.`order_phone` AS `order_phone`, `orders`.`order_date` AS `order_date`, `orders`.`order_delivery_date` AS `order_delivery_date`, `orders`.`order_delivery_address` AS `order_delivery_address`, `orders`.`order_note` AS `order_note`, `orders`.`order_total_before` AS `order_total_before`, `orders`.`order_total_after` AS `order_total_after`, `orders`.`paying_method_id` AS `paying_method_id`, `orders`.`order_paying_date` AS `order_paying_date`, `orders`.`order_is_paid` AS `order_is_paid`, `orders`.`order_status` AS `order_status`, `paying_methods`.`paying_method_name` AS `paying_method_name` FROM (`orders` left join `paying_methods` on(`orders`.`paying_method_id` = `paying_methods`.`paying_method_id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_order_detail`
--
DROP TABLE IF EXISTS `view_order_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order_detail`  AS SELECT `order_details`.`order_id` AS `order_id`, `order_details`.`product_variant_id` AS `product_variant_id`, `order_details`.`order_detail_quantity` AS `order_detail_quantity`, `order_details`.`order_detail_price_before` AS `order_detail_price_before`, `order_details`.`order_detail_price_after` AS `order_detail_price_after`, `products`.`product_id` AS `product_id`, `products`.`product_name` AS `product_name`, `products`.`product_avt_img` AS `product_avt_img`, `product_variants`.`product_variant_name` AS `product_variant_name` FROM ((`order_details` left join `product_variants` on(`order_details`.`product_variant_id` = `product_variants`.`product_variant_id`)) left join `products` on(`product_variants`.`product_id` = `products`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_products_admin`
--
DROP TABLE IF EXISTS `view_products_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_admin`  AS SELECT `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_rate` AS `product_rate`, `view_product_variants`.`product_view_count` AS `product_view_count`, `view_product_variants`.`product_period` AS `product_period`, `view_product_variants`.`category_id` AS `category_id`, `view_product_variants`.`category_name` AS `category_name`, `view_product_variants`.`product_variant_id` AS `product_variant_id`, `view_product_variants`.`product_variant_name` AS `product_variant_name`, `view_product_variants`.`product_variant_price` AS `product_variant_price`, `view_product_variants`.`product_variant_available` AS `product_variant_available`, `view_product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_product_variants`.`discount_amount` AS `discount_amount`, `view_product_variants`.`discount_description` AS `discount_description`, count(`view_product_variants`.`product_variant_id`) AS `product_count`, sum(`r`.`quantity_sold`) AS `quantity_sold`, sum(`r`.`revenue`) AS `revenue` FROM (`view_product_variants` left join (select `order_details`.`product_variant_id` AS `product_variant_id`,count(`order_details`.`product_variant_id`) AS `quantity_sold`,sum(`order_details`.`order_detail_price_after`) AS `revenue` from (`orders` left join `order_details` on(`orders`.`order_id` = `order_details`.`order_id`)) where `orders`.`order_is_paid` <> 0 and `orders`.`order_status` = 'Hoàn thành' group by `order_details`.`product_variant_id`) `r` on(`view_product_variants`.`product_variant_id` = `r`.`product_variant_id`)) GROUP BY `view_product_variants`.`product_id` ORDER BY sum(`r`.`revenue`) DESC ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_products_info`
--
DROP TABLE IF EXISTS `view_products_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_info`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`category_id` AS `category_id`, `products`.`product_name` AS `product_name`, `products`.`supplier_id` AS `supplier_id`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_description` AS `product_description`, `products`.`product_period` AS `product_period`, `products`.`product_view_count` AS `product_view_count`, `products`.`product_is_display` AS `product_is_display`, `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`discount_id` AS `discount_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available` FROM (`products` join `product_variants`) WHERE `products`.`product_id` = `product_variants`.`product_id` AND `product_variants`.`product_variant_is_stock` = 1 AND `product_variants`.`product_variant_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_products_resume`
--
DROP TABLE IF EXISTS `view_products_resume`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_resume`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`product_name` AS `product_name`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_view_count` AS `product_view_count`, `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `a`.`product_variant_id` AS `product_variant_id`, `c`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `a`.`min_price` AS `product_variant_price`, `b`.`max_date` AS `product_lastdate_added`, `view_discounts`.`discount_amount` AS `discount_amount`, `view_discounts`.`discount_description` AS `discount_description` FROM (((select `product_variants`.`product_id` AS `product_id`,max(`product_variants`.`product_variant_added_date`) AS `max_date` from `product_variants` group by `product_variants`.`product_id`) `b` left join (((`products` left join (select `product_variants`.`product_id` AS `product_id`,`product_variants`.`discount_id` AS `discount_id`,`product_variants`.`product_variant_id` AS `product_variant_id`,min(`product_variants`.`product_variant_price`) AS `min_price` from `product_variants` group by `product_variants`.`product_id`) `a` on(`products`.`product_id` = `a`.`product_id`)) left join `view_discounts` on(`a`.`discount_id` = `view_discounts`.`discount_id`)) left join `categories` on(`categories`.`category_id` = `products`.`category_id`)) on(`products`.`product_id` = `b`.`product_id`)) left join (select `product_variants`.`product_id` AS `product_id`,`product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller` from `product_variants` where `product_variants`.`product_variant_is_bestseller` = 1 group by `product_variants`.`product_id`) `c` on(`products`.`product_id` = `c`.`product_id`)) WHERE `products`.`product_is_display` = 1 GROUP BY `products`.`product_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_product_feedbacks`
--
DROP TABLE IF EXISTS `view_product_feedbacks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_feedbacks`  AS SELECT `pv`.`product_variant_name` AS `product_variant_name`, `pv`.`product_id` AS `product_id`, `f`.`feedback_id` AS `feedback_id`, `f`.`product_variant_id` AS `product_variant_id`, `f`.`customer_id` AS `customer_id`, `f`.`order_id` AS `order_id`, `f`.`feedback_date` AS `feedback_date`, `f`.`feedback_rate` AS `feedback_rate`, `f`.`feedback_content` AS `feedback_content`, `f`.`feedback_is_display` AS `feedback_is_display`, `fi`.`feedback_img_id` AS `feedback_img_id`, `fi`.`feedback_img_name` AS `feedback_img_name`, `vu`.`user_name` AS `user_name`, `vu`.`user_avt_img` AS `user_avt_img` FROM (((`product_variants` `pv` left join `feedbacks` `f` on(`pv`.`product_variant_id` = `f`.`product_variant_id`)) left join `feedback_imgs` `fi` on(`f`.`feedback_id` = `fi`.`feedback_id`)) left join `view_user` `vu` on(`vu`.`customer_id` = `f`.`customer_id`)) WHERE `f`.`feedback_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_product_variants`
--
DROP TABLE IF EXISTS `view_product_variants`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_variants`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`product_name` AS `product_name`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_view_count` AS `product_view_count`, `products`.`product_period` AS `product_period`, `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available`, `product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_discounts`.`discount_amount` AS `discount_amount`, `view_discounts`.`discount_description` AS `discount_description` FROM (((`products` left join `product_variants` on(`products`.`product_id` = `product_variants`.`product_id`)) left join `view_discounts` on(`product_variants`.`discount_id` = `view_discounts`.`discount_id`)) left join `categories` on(`categories`.`category_id` = `products`.`category_id`)) WHERE `categories`.`category_id` = `products`.`category_id` AND `products`.`product_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_product_variant_detail`
--
DROP TABLE IF EXISTS `view_product_variant_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_variant_detail`  AS SELECT `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`product_id` AS `product_id`, `product_variants`.`discount_id` AS `discount_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available`, `product_variants`.`product_variant_is_stock` AS `product_variant_is_stock`, `product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `product_variants`.`product_variant_added_date` AS `product_variant_added_date`, `product_variants`.`product_variant_is_display` AS `product_variant_is_display`, `view_discounts`.`discount_name` AS `discount_name`, `view_discounts`.`discount_description` AS `discount_description`, `view_discounts`.`discount_start_date` AS `discount_start_date`, `view_discounts`.`discount_end_date` AS `discount_end_date`, `view_discounts`.`discount_amount` AS `discount_amount` FROM (`product_variants` left join `view_discounts` on(`product_variants`.`discount_id` = `view_discounts`.`discount_id`)) WHERE `product_variants`.`product_variant_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS SELECT `u`.`user_id` AS `user_id`, `u`.`user_login_name` AS `user_login_name`, `u`.`user_password` AS `user_password`, `u`.`user_name` AS `user_name`, `u`.`user_birth` AS `user_birth`, `u`.`user_sex` AS `user_sex`, `u`.`user_email` AS `user_email`, `u`.`user_phone` AS `user_phone`, `u`.`user_address` AS `user_address`, `u`.`user_register_date` AS `user_register_date`, `u`.`user_active` AS `user_active`, `c`.`customer_id` AS `customer_id`, NULL AS `user_avt_img` FROM (`users` `u` left join `customers` `c` on(`u`.`user_id` = `c`.`user_id`)) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_login_name` (`admin_login_name`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`customer_id`,`product_variant_id`),
  ADD KEY `fk_carts_product_variants` (`product_variant_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customers_users` (`user_id`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`);

--
-- Chỉ mục cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `fk_order_id` (`order_id`),
  ADD KEY `fk_customer_id` (`customer_id`),
  ADD KEY `fk_product_variant_id` (`product_variant_id`);

--
-- Chỉ mục cho bảng `feedback_imgs`
--
ALTER TABLE `feedback_imgs`
  ADD PRIMARY KEY (`feedback_img_id`),
  ADD KEY `fk_feedback_id` (`feedback_id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_notifications_notification_types` (`notification_type_id`);

--
-- Chỉ mục cho bảng `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`notification_type_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orders_customers` (`customer_id`),
  ADD KEY `fk_orders_staffs` (`staff_id`),
  ADD KEY `fk_paying_method_id` (`paying_method_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_variant_id`),
  ADD KEY `fk_order_details_product_variants` (`product_variant_id`);

--
-- Chỉ mục cho bảng `paying_methods`
--
ALTER TABLE `paying_methods`
  ADD PRIMARY KEY (`paying_method_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_products_categories` (`category_id`),
  ADD KEY `fk_products_suppliers` (`supplier_id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_detail_id`,`product_id`),
  ADD KEY `fk_product_details_products` (`product_id`);

--
-- Chỉ mục cho bảng `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `fk_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`product_variant_id`,`product_id`) USING BTREE,
  ADD KEY `fk_product_variants_products` (`product_id`),
  ADD KEY `fk_products_variants_discounts` (`discount_id`);

--
-- Chỉ mục cho bảng `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `fk_staffs_users` (`user_id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`user_id`,`notification_id`),
  ADD KEY `fk_user_notification_notifications` (`notification_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=762;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `notification_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT cho bảng `paying_methods`
--
ALTER TABLE `paying_methods`
  MODIFY `paying_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=639;

--
-- AUTO_INCREMENT cho bảng `product_imgs`
--
ALTER TABLE `product_imgs`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `product_variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_carts_product_variants` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Các ràng buộc cho bảng `feedback_imgs`
--
ALTER TABLE `feedback_imgs`
  ADD CONSTRAINT `fk_feedback_id` FOREIGN KEY (`feedback_id`) REFERENCES `feedbacks` (`feedback_id`);

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_notification_types` FOREIGN KEY (`notification_type_id`) REFERENCES `notification_types` (`notification_type_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_orders_staffs` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `fk_paying_method_id` FOREIGN KEY (`paying_method_id`) REFERENCES `paying_methods` (`paying_method_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_order_details_product_variants` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `fk_products_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Các ràng buộc cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `fk_product_details_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `fk_product_variants_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `fk_products_variants_discounts` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`);

--
-- Các ràng buộc cho bảng `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `fk_staffs_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `user_notification`
--
ALTER TABLE `user_notification`
  ADD CONSTRAINT `fk_user_notification_notifications` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `fk_user_notification_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
