document.addEventListener("DOMContentLoaded", function () {
	// Mặc định hiển thị thông tin của Vietinbank
	document.getElementById("bank-vietinbank").style.borderColor =
		"var(--primary-color-1)";
	document.getElementById("pay_info-vietinbank").style.display = "block";
	document.getElementById("pay_info-mb").style.display = "none";

	// Xử lý sự kiện khi chọn Vietinbank
	document
		.getElementById("bank-vietinbank")
		.addEventListener("click", function () {
			document.getElementById("pay_info-vietinbank").style.display = "block";
			document.getElementById("pay_info-mb").style.display = "none";
			document.getElementById("bank-vietinbank").style.borderColor =
				"var(--primary-color-1)";
			document.getElementById("bank-mb").style.borderColor =
				"var(--outline-gray)";
		});

	// Xử lý sự kiện khi chọn MB
	document.getElementById("bank-mb").addEventListener("click", function () {
		document.getElementById("pay_info-vietinbank").style.display = "none";
		document.getElementById("pay_info-mb").style.display = "block";
		document.getElementById("bank-mb").style.borderColor =
			"var(--primary-color-1)";
		document.getElementById("bank-vietinbank").style.borderColor =
			"var(--outline-gray)";
	});

	// Thêm xử lý sự kiện khi nhấn nút Xác nhận
	document.getElementById("btn-submit").addEventListener("click", function () {
		// Thêm logic xác nhận đơn hàng tại đây (nếu cần)
		alert("Xác nhận đơn hàng thành công!");
	});

	// Thêm xử lý sự kiện khi nhấn nút Trở lại trang chủ
	document
		.getElementById("btn-home-page")
		.addEventListener("click", function () {
			// Chuyển hướng về trang chủ tại đây
			window.location.href = "/";
		});

});

const btnHomePage = document.querySelector("#btn-home-page");

btnHomePage.addEventListener("click", function () {
	window.location.href = "/account/purchase?order_status=Ch%E1%BB%9D%20thanh%20to%C3%A1n";
});    