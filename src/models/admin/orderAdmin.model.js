const db = require('../../config/db/connect')
const util = require('node:util')
const query = util.promisify(db.query).bind(db)

const orderAdmin = function () { }

const ORDER_STATUSES = ['Chờ thanh toán', 'Đang giao hàng', 'Hoàn thành', 'Đã hủy']

function toInt(value, defaultValue = 1) {
    const number = parseInt(value, 10)
    return Number.isNaN(number) ? defaultValue : number
}

function normalizeDate(value, fallback = '0000-00-00') {
    if (!value || value === 'Invalid Date') return fallback
    if (value instanceof Date && !Number.isNaN(value.getTime())) {
        const year = value.getFullYear()
        const month = `${value.getMonth() + 1}`.padStart(2, '0')
        const day = `${value.getDate()}`.padStart(2, '0')
        return `${year}-${month}-${day}`
    }

    const str = String(value).trim()
    if (!str || str === '0000-00-00') return fallback

    const matched = str.match(/^\d{4}-\d{2}-\d{2}/)
    return matched ? matched[0] : fallback
}

function isValidRealDate(value) {
    const date = normalizeDate(value, '')
    return !!date && date !== '0000-00-00'
}

function buildWhere(filters = {}) {
    const conditions = []
    const params = []

    if (filters.searchKey) {
        const keyword = `%${filters.searchKey}%`
        conditions.push(`(
            view_orders.order_id LIKE ?
            OR view_orders.order_name LIKE ?
            OR view_orders.order_phone LIKE ?
            OR view_orders.order_delivery_address LIKE ?
            OR view_orders.paying_method_name LIKE ?
        )`)
        params.push(keyword, keyword, keyword, keyword, keyword)
    }

    if (filters.status && ORDER_STATUSES.includes(filters.status)) {
        conditions.push('view_orders.order_status = ?')
        params.push(filters.status)
    }

    if (filters.paid === '1' || filters.paid === 1) {
        conditions.push('view_orders.order_is_paid = 1')
    }

    if (filters.paid === '0' || filters.paid === 0) {
        conditions.push('view_orders.order_is_paid = 0')
    }

    if (filters.fromDate) {
        conditions.push('view_orders.order_date >= ?')
        params.push(filters.fromDate)
    }

    if (filters.toDate) {
        conditions.push('view_orders.order_date <= ?')
        params.push(filters.toDate)
    }

    return {
        where: conditions.length ? `WHERE ${conditions.join(' AND ')}` : '',
        params,
    }
}

orderAdmin.getStatuses = () => ORDER_STATUSES

orderAdmin.getOrders = async (filters = {}) => {
    const limit = toInt(filters.limit, 10)
    let page = toInt(filters.page, 1)

    const { where, params } = buildWhere(filters)

    const countRows = await query(
        `SELECT COUNT(*) AS totalRow FROM view_orders ${where}`,
        params
    )

    const totalRow = countRows[0] ? Number(countRows[0].totalRow) : 0
    const totalPage = totalRow > 0 ? Math.ceil(totalRow / limit) : 1

    page = page > 0 ? page : 1
    page = page <= totalPage ? page : totalPage

    const start = (page - 1) * limit

    const orders = await query(
        `SELECT *
        FROM view_orders
        ${where}
        ORDER BY view_orders.order_id DESC
        LIMIT ?, ?`,
        [...params, start, limit]
    )

    return {
        orders,
        searchKey: filters.searchKey || '',
        status: filters.status || '',
        paid: filters.paid || '',
        fromDate: filters.fromDate || '',
        toDate: filters.toDate || '',
        totalRow,
        totalPage,
        page,
        limit,
    }
}

orderAdmin.getSummary = async (filters = {}) => {
    const { where, params } = buildWhere(filters)

    const rows = await query(
        `SELECT
            COUNT(*) AS total_order,
            SUM(CASE WHEN order_status = 'Chờ thanh toán' THEN 1 ELSE 0 END) AS waiting_count,
            SUM(CASE WHEN order_status = 'Đang giao hàng' THEN 1 ELSE 0 END) AS shipping_count,
            SUM(CASE WHEN order_status = 'Hoàn thành' THEN 1 ELSE 0 END) AS completed_count,
            SUM(CASE WHEN order_status = 'Đã hủy' THEN 1 ELSE 0 END) AS canceled_count,
            SUM(CASE WHEN order_is_paid = 1 THEN 1 ELSE 0 END) AS paid_count,
            SUM(CASE WHEN order_is_paid = 0 THEN 1 ELSE 0 END) AS unpaid_count,
            SUM(CASE WHEN order_is_paid = 1 AND order_status = 'Hoàn thành' THEN order_total_after ELSE 0 END) AS completed_revenue
        FROM view_orders
        ${where}`,
        params
    )

    const summary = rows[0] || {}

    return {
        total_order: Number(summary.total_order || 0),
        waiting_count: Number(summary.waiting_count || 0),
        shipping_count: Number(summary.shipping_count || 0),
        completed_count: Number(summary.completed_count || 0),
        canceled_count: Number(summary.canceled_count || 0),
        paid_count: Number(summary.paid_count || 0),
        unpaid_count: Number(summary.unpaid_count || 0),
        completed_revenue: Number(summary.completed_revenue || 0),
    }
}

orderAdmin.getOrderById = async (order_id) => {
    const rows = await query(
        `SELECT
            orders.*,
            paying_methods.paying_method_name,
            users.user_name AS customer_account_name,
            users.user_email AS customer_email,
            users.user_phone AS customer_account_phone,
            users.user_address AS customer_account_address,
            staff_users.user_name AS staff_name,
            staffs.staff_role
        FROM orders
        LEFT JOIN paying_methods
            ON orders.paying_method_id = paying_methods.paying_method_id
        LEFT JOIN customers
            ON orders.customer_id = customers.customer_id
        LEFT JOIN users
            ON customers.user_id = users.user_id
        LEFT JOIN staffs
            ON orders.staff_id = staffs.staff_id
        LEFT JOIN users AS staff_users
            ON staffs.user_id = staff_users.user_id
        WHERE orders.order_id = ?`,
        [order_id]
    )

    return rows[0] || null
}

orderAdmin.getOrderDetails = async (order_id) => {
    return query(
        `SELECT
            view_order_detail.*,
            product_variants.product_variant_price,
            (view_order_detail.order_detail_quantity * view_order_detail.order_detail_price_before) AS line_total_before,
            (view_order_detail.order_detail_quantity * view_order_detail.order_detail_price_after) AS line_total_after
        FROM view_order_detail
        LEFT JOIN product_variants
            ON view_order_detail.product_variant_id = product_variants.product_variant_id
        WHERE view_order_detail.order_id = ?
        ORDER BY view_order_detail.product_variant_id`,
        [order_id]
    )
}

orderAdmin.getPayingMethods = async () => {
    return query(
        `SELECT *
        FROM paying_methods
        WHERE paying_method_is_display = 1
        ORDER BY paying_method_id`
    )
}

orderAdmin.updateOrder = async (order_id, data = {}) => {
    const currentOrder = await orderAdmin.getOrderById(order_id)
    if (!currentOrder) return null

    const nextStatus = ORDER_STATUSES.includes(data.order_status)
        ? data.order_status
        : currentOrder.order_status

    const nextIsPaid = data.order_is_paid === '1' || data.order_is_paid === 1 ? 1 : 0

    let nextPayingDate = normalizeDate(data.order_paying_date)
    if (nextIsPaid === 1 && !isValidRealDate(nextPayingDate)) {
        nextPayingDate = normalizeDate(currentOrder.order_paying_date)
        if (!isValidRealDate(nextPayingDate)) {
            nextPayingDate = normalizeDate(new Date())
        }
    }
    if (nextIsPaid === 0) {
        nextPayingDate = '0000-00-00'
    }

    let nextDeliveryDate = normalizeDate(data.order_delivery_date)
    if (nextStatus === 'Hoàn thành' && !isValidRealDate(nextDeliveryDate)) {
        nextDeliveryDate = normalizeDate(currentOrder.order_delivery_date)
        if (!isValidRealDate(nextDeliveryDate)) {
            nextDeliveryDate = normalizeDate(new Date())
        }
    }

    const note = data.order_note !== undefined ? data.order_note : currentOrder.order_note
    const payingMethodId = toInt(data.paying_method_id, currentOrder.paying_method_id)

    const result = await query(
        `UPDATE orders
        SET
            order_status = ?,
            order_is_paid = ?,
            order_paying_date = ?,
            order_delivery_date = ?,
            paying_method_id = ?,
            order_note = ?
        WHERE order_id = ?`,
        [
            nextStatus,
            nextIsPaid,
            nextPayingDate,
            nextDeliveryDate,
            payingMethodId,
            note,
            order_id,
        ]
    )

    return result
}

orderAdmin.cancelOrder = async (order_id) => {
    return query(
        `UPDATE orders
        SET order_status = 'Đã hủy'
        WHERE order_id = ?`,
        [order_id]
    )
}

module.exports = orderAdmin
