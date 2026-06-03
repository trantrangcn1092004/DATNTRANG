// ACTIVE SIDEBAR
const sidebarListItems = document.querySelectorAll('.admin-sidebar__list-item');
if (sidebarListItems.length > 0) {
    sidebarListItems[0].classList.add('active');
}

Apex.grid = {
    padding: {
        right: 0,
        left: 0
    }
};

Apex.dataLabels = {
    enabled: false
};

// MÀU BIỂU ĐỒ
var colorPalette = ['#00D8B6', '#008FFB', '#FEB019', '#FF4560', '#775DD0'];

function formatMoney(value) {
    return Number(value || 0).toLocaleString('vi-VN') + 'đ';
}

function showNoData(selector, message) {
    const element = document.querySelector(selector);
    if (element) {
        element.innerHTML = `<p style="text-align:center; padding:40px 0; color:#777;">${message}</p>`;
    }
}

function getMonthLabel(item) {
    return 'T' + item.month + '/' + item.year;
}

function renderDashboardCharts(chartRevenueData, chartCategoryData) {
    const revenueLabels = chartRevenueData.map(getMonthLabel);
    const revenueData = chartRevenueData.map(item => Number(item.revenue || 0));

    const orderLabels = chartRevenueData.map(getMonthLabel);
    const orderSuccessData = chartRevenueData.map(item => Number(item.order_success || 0));
    const orderCancelData = chartRevenueData.map(item => Number(item.order_cancel || 0));

    const categoryLabels = chartCategoryData.map(item => item.category_name);
    const categoryData = chartCategoryData.map(item => Number(item.product_count || 0));

    // ================= AREA CHART =================
    // THỐNG KÊ DOANH THU THẬT TỪ MYSQL

    if (document.querySelector('#area')) {
        if (revenueData.length === 0) {
            showNoData('#area', 'Chưa có dữ liệu doanh thu');
        } else {
            var optionsArea = {
                series: [{
                    name: 'Doanh thu',
                    data: revenueData
                }],
                chart: {
                    height: 350,
                    type: 'area',
                    zoom: {
                        enabled: true
                    }
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'smooth',
                    width: 4
                },
                xaxis: {
                    categories: revenueLabels
                },
                yaxis: {
                    labels: {
                        formatter: function (val) {
                            return formatMoney(val);
                        }
                    }
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            return formatMoney(val);
                        }
                    }
                }
            };

            var chartArea = new ApexCharts(
                document.querySelector('#area'),
                optionsArea
            );

            chartArea.render();
        }
    }

    // ================= BAR CHART =================
    // ĐƠN HÀNG THẬT TỪ MYSQL

    if (document.querySelector('#bar')) {
        if (orderLabels.length === 0) {
            showNoData('#bar', 'Chưa có dữ liệu đơn hàng');
        } else {
            var optionsBar = {
                series: [{
                    name: 'Đơn thành công',
                    data: orderSuccessData
                }, {
                    name: 'Đơn hủy',
                    data: orderCancelData
                }],
                chart: {
                    type: 'bar',
                    height: 350
                },
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: '55%',
                        endingShape: 'rounded'
                    },
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    show: true,
                    width: 2,
                    colors: ['transparent']
                },
                xaxis: {
                    categories: orderLabels
                },
                yaxis: {
                    title: {
                        text: 'Số đơn hàng'
                    }
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            return Number(val || 0) + ' đơn';
                        }
                    }
                },
                fill: {
                    opacity: 1
                }
            };

            var chartBar = new ApexCharts(
                document.querySelector('#bar'),
                optionsBar
            );

            chartBar.render();
        }
    }

    // ================= DONUT CHART =================
    // DANH MỤC SẢN PHẨM THẬT TỪ MYSQL

    var donut = null;

    if (document.querySelector('#donut')) {
        if (categoryData.length === 0 || categoryData.every(item => Number(item) === 0)) {
            showNoData('#donut', 'Chưa có dữ liệu danh mục sản phẩm');
        } else {
            var optionDonut = {
                chart: {
                    type: 'donut',
                    width: '100%',
                    height: 400
                },
                dataLabels: {
                    enabled: false,
                },
                plotOptions: {
                    pie: {
                        customScale: 0.8,
                        donut: {
                            size: '75%',
                        },
                        offsetY: 20,
                    },
                    stroke: {
                        colors: undefined
                    }
                },
                colors: colorPalette,

                series: categoryData,

                labels: categoryLabels,

                legend: {
                    position: 'left',
                    offsetY: 80
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            return Number(val || 0) + ' sản phẩm';
                        }
                    }
                }
            };

            donut = new ApexCharts(
                document.querySelector('#donut'),
                optionDonut
            );

            donut.render();
        }
    }

    // ================= RESPONSIVE DONUT =================

    var mobileDonut = function () {
        if (!donut) return;

        if (window.innerWidth < 768) {
            donut.updateOptions({
                plotOptions: {
                    pie: {
                        offsetY: -15,
                    }
                },
                legend: {
                    position: 'bottom'
                }
            }, false, false)
        } else {
            donut.updateOptions({
                plotOptions: {
                    pie: {
                        offsetY: 20,
                    }
                },
                legend: {
                    position: 'left'
                }
            }, false, false)
        }
    }

    window.addEventListener('resize', mobileDonut);
    mobileDonut();
}

fetch('/admin/dashboard/getChart')
    .then(response => response.json())
    .then(data => {
        if (data.status !== 'success') {
            throw new Error('Không lấy được dữ liệu dashboard');
        }

        renderDashboardCharts(
            data.chartRevenueData || [],
            data.chartCategoryData || []
        );
    })
    .catch(error => {
        console.error(error);
        showNoData('#area', 'Không tải được dữ liệu doanh thu');
        showNoData('#bar', 'Không tải được dữ liệu đơn hàng');
        showNoData('#donut', 'Không tải được dữ liệu danh mục sản phẩm');
    });
