const general = require('../../models/general.model')
const orderAdmin = require('../../models/admin/orderAdmin.model')

const orderAdminController = () => { }

function parseOrderId(order_id) {
    const id = parseInt(order_id, 10)
    return Number.isNaN(id) || id <= 0 ? 0 : id
}

function normalizeFilter(query = {}) {
    return {
        searchKey: query.searchKey ? String(query.searchKey).trim() : '',
        status: query.status ? String(query.status).trim() : '',
        paid: query.paid === '0' || query.paid === '1' ? query.paid : '',
        fromDate: query.fromDate ? String(query.fromDate).trim() : '',
        toDate: query.toDate ? String(query.toDate).trim() : '',
        page: query.page || 1,
        limit: 10,
    }
}

function formatDate(value) {
    if (!value || value === '0000-00-00') return 'Chưa có'

    if (value instanceof Date && !Number.isNaN(value.getTime())) {
        const day = `${value.getDate()}`.padStart(2, '0')
        const month = `${value.getMonth() + 1}`.padStart(2, '0')
        const year = value.getFullYear()
        return `${day}/${month}/${year}`
    }

    const str = String(value)
    const matched = str.match(/^(\d{4})-(\d{2})-(\d{2})/)
    if (!matched || matched[0] === '0000-00-00') return 'Chưa có'
    return `${matched[3]}/${matched[2]}/${matched[1]}`
}

function dateForInput(value) {
    if (!value || value === '0000-00-00') return ''

    if (value instanceof Date && !Number.isNaN(value.getTime())) {
        const year = value.getFullYear()
        const month = `${value.getMonth() + 1}`.padStart(2, '0')
        const day = `${value.getDate()}`.padStart(2, '0')
        return `${year}-${month}-${day}`
    }

    const str = String(value)
    const matched = str.match(/^\d{4}-\d{2}-\d{2}/)
    return matched && matched[0] !== '0000-00-00' ? matched[0] : ''
}

function buildQueryString(params = {}, overwrite = {}) {
    const query = new URLSearchParams()
    const data = { ...params, ...overwrite }

    Object.keys(data).forEach((key) => {
        if (data[key] !== undefined && data[key] !== null && data[key] !== '') {
            query.set(key, data[key])
        }
    })

    const value = query.toString()
    return value ? `?${value}` : ''
}

// [GET] /admin/orders_admin
orderAdminController.getOrders = async (req, res) => {
    try {
        const title = 'QUẢN LÝ ĐƠN HÀNG'
        const admin = req.admin
        const filters = normalizeFilter(req.query)

        const data = await orderAdmin.getOrders(filters)
        const summary = await orderAdmin.getSummary(filters)
        const formatFunction = await general.formatFunction()

        res.status(200).render('admin/pages/order_admin', {
            title,
            admin,
            data,
            summary,
            statuses: orderAdmin.getStatuses(),
            formatFunction,
            helpers: {
                formatDate,
                buildQueryString,
            },
        })
    } catch (error) {
        console.error(error)
        res.status(500).redirect('/error')
    }
}

// [GET] /admin/orders_admin/:order_id
orderAdminController.getOrderDetail = async (req, res) => {
    try {
        const order_id = parseOrderId(req.params.order_id)
        if (!order_id) return res.status(404).redirect('/error')

        const title = 'CHI TIẾT ĐƠN HÀNG'
        const admin = req.admin
        const order = await orderAdmin.getOrderById(order_id)

        if (!order) return res.status(404).redirect('/error')

        const orderDetails = await orderAdmin.getOrderDetails(order_id)
        const payingMethods = await orderAdmin.getPayingMethods()
        const formatFunction = await general.formatFunction()

        res.status(200).render('admin/pages/order_view_admin', {
            title,
            admin,
            order,
            orderDetails,
            payingMethods,
            statuses: orderAdmin.getStatuses(),
            formatFunction,
            message: req.query.message || '',
            error: req.query.error || '',
            helpers: {
                formatDate,
                dateForInput,
            },
        })
    } catch (error) {
        console.error(error)
        res.status(500).redirect('/error')
    }
}

// [POST] /admin/orders_admin/:order_id/update
orderAdminController.updateOrder = async (req, res) => {
    try {
        const order_id = parseOrderId(req.params.order_id)
        if (!order_id) return res.status(404).redirect('/error')

        const result = await orderAdmin.updateOrder(order_id, req.body)
        if (!result) {
            return res.redirect(`/admin/orders_admin/${order_id}?error=Không tìm thấy đơn hàng`)
        }

        res.redirect(`/admin/orders_admin/${order_id}?message=Cập nhật đơn hàng thành công`)
    } catch (error) {
        console.error(error)
        res.redirect(`/admin/orders_admin/${req.params.order_id}?error=Cập nhật đơn hàng thất bại`)
    }
}

// [POST] /admin/orders_admin/:order_id/cancel
orderAdminController.cancelOrder = async (req, res) => {
    try {
        const order_id = parseOrderId(req.params.order_id)
        if (!order_id) return res.status(404).redirect('/error')

        await orderAdmin.cancelOrder(order_id)
        res.redirect(`/admin/orders_admin/${order_id}?message=Đã chuyển đơn hàng sang trạng thái Đã hủy`)
    } catch (error) {
        console.error(error)
        res.redirect(`/admin/orders_admin/${req.params.order_id}?error=Không thể hủy đơn hàng`)
    }
}

module.exports = orderAdminController
