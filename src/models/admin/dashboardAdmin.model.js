const db = require('../../config/db/connect');
const util = require('node:util');
const query = util.promisify(db.query).bind(db);
const indexAdmin = require('./indexAdmin.model');

const dashboard = function () { }


// ================= SUMMARY CARD =================
// Card tổng quan: khách hàng, đơn hợp lệ, tổng doanh thu
// Doanh thu = tổng order_total_after của đơn đã thanh toán HOẶC đã hoàn thành, không tính đơn đã hủy

dashboard.getSummary = async (req, res) => {
    let getSummary = `
        SELECT
            (
                SELECT COUNT(*)
                FROM customers
            ) AS customer_count,

            (
                SELECT COUNT(*)
                FROM orders
                WHERE order_status <> 'Đã hủy'
                  AND (
                        order_is_paid = 1
                        OR order_status = 'Hoàn thành'
                  )
            ) AS quantity_sold,

            (
                SELECT COALESCE(SUM(order_total_after), 0)
                FROM orders
                WHERE order_status <> 'Đã hủy'
                  AND (
                        order_is_paid = 1
                        OR order_status = 'Hoàn thành'
                  )
            ) AS revenue
    `;

    let summary = await query(getSummary);

    if (!summary[0]) {
        return {
            customer_count: 0,
            quantity_sold: 0,
            revenue: '0'
        };
    }

    summary[0].customer_count = Number(summary[0].customer_count || 0);
    summary[0].quantity_sold = Number(summary[0].quantity_sold || 0);
    summary[0].revenue = await indexAdmin.toCurrency(Number(summary[0].revenue || 0));

    return summary[0];
}


// ================= TOP 5 PRODUCT =================
// Top 5 sản phẩm bán chạy

dashboard.getChartTop5 = async (req, res) => {
    let getChartTop5 = `
        SELECT *
        FROM view_getchart_top5_product
        ORDER BY quantity_sold DESC
        LIMIT 5
    `;

    let chartTop5 = await query(getChartTop5);
    return chartTop5;
}


// ================= CHART REVENUE =================
// Biểu đồ doanh thu theo tháng
// Doanh thu = tổng order_total_after của đơn đã thanh toán HOẶC đã hoàn thành, không tính đơn đã hủy

dashboard.getChartRevenue = async (req, res) => {
    let getChartRevenue = `
        SELECT
            YEAR(order_date) AS year,
            MONTH(order_date) AS month,

            COUNT(
                CASE 
                    WHEN order_status <> 'Đã hủy'
                     AND (
                            order_is_paid = 1
                            OR order_status = 'Hoàn thành'
                     )
                    THEN 1
                END
            ) AS order_success,

            COALESCE(SUM(
                CASE
                    WHEN order_status <> 'Đã hủy'
                     AND (
                            order_is_paid = 1
                            OR order_status = 'Hoàn thành'
                     )
                    THEN order_total_after
                    ELSE 0
                END
            ), 0) AS revenue,

            COUNT(
                CASE 
                    WHEN order_status = 'Đã hủy'
                    THEN 1
                END
            ) AS order_cancel

        FROM orders
        GROUP BY YEAR(order_date), MONTH(order_date)
        ORDER BY YEAR(order_date), MONTH(order_date)
    `;

    let chartRevenue = await query(getChartRevenue);
    return chartRevenue;
}


// ================= CHART CATEGORY =================
// Biểu đồ donut: số lượng sản phẩm theo nhóm danh mục

dashboard.getChartCategory = async (req, res) => {
    let getChartCategory = `
        SELECT
            categories.categorry_type AS category_name,
            COUNT(products.product_id) AS product_count
        FROM categories
        LEFT JOIN products
            ON products.category_id = categories.category_id
            AND products.product_is_display = 1
        WHERE categories.category_is_display = 1
        GROUP BY categories.categorry_type
        ORDER BY product_count DESC
    `;

    let chartCategory = await query(getChartCategory);
    return chartCategory;
}


module.exports = dashboard;