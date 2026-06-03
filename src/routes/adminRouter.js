const express = require('express')
const router = express.Router();

// import controller
const authAdminController = require('../controllers/admin/authAdminController.js')
const dashboardAdminController = require('../controllers/admin/dashboardAdminController.js')
const cateAdminController = require('../controllers/admin/cateAdminController.js')
const orderAdminController = require('../controllers/admin/orderAdminController.js')

// import middleware
const adminMiddleware = require('../middleware/adminMiddleware.js')

// admin auth
router.get('/login', adminMiddleware.checkAuth, authAdminController.getLogin)
router.post('/login', adminMiddleware.checkAuth, authAdminController.postLogin)
router.get('/logout', adminMiddleware.checkUnAuth, authAdminController.getLogout)

// admin dashboard
router.get('/dashboard', adminMiddleware.isLoggedIn, dashboardAdminController.getDashboard)
router.get('/dashboard/getChart', adminMiddleware.isLoggedIn, dashboardAdminController.getChart)
router.get('/', adminMiddleware.isLoggedIn, dashboardAdminController.getDashboard)

// admin cate management
router.get('/categories_admin/add', adminMiddleware.isLoggedIn, cateAdminController.addCategories)
router.get('/categories_admin', adminMiddleware.isLoggedIn, cateAdminController.getCategories)

// admin product management
router.get('/products_admin/add', adminMiddleware.isLoggedIn, cateAdminController.addProducts)
router.get('/products_admin', adminMiddleware.isLoggedIn, cateAdminController.getProducts)
router.get('/orders_admin', adminMiddleware.isLoggedIn, orderAdminController.getOrders)
router.get('/orders_admin/:order_id', adminMiddleware.isLoggedIn, orderAdminController.getOrderDetail)
router.post('/orders_admin/:order_id/update', adminMiddleware.isLoggedIn, orderAdminController.updateOrder)
router.post('/orders_admin/:order_id/cancel', adminMiddleware.isLoggedIn, orderAdminController.cancelOrder)

module.exports = router