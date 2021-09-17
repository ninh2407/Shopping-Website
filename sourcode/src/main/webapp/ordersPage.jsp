<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- Import Icon library -->
<script src="https://kit.fontawesome.com/5375cbd5e7.js"
	crossorigin="anonymous"></script>
<!--Import Boottrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>

<!-- External css -->
<link rel="stylesheet" href="./css/style-home.css">
<link rel="stylesheet" href="./css/style-cart.css">
</head>

<body>

	<div class="container-fluid px-0">
		<!-- Header -->
		<jsp:include page="header.jsp" />

		<!--Cart -->
		<div class="cart-box">
			<div class="title-cart">
				<p>Hóa đơn của bạn</p>
				<a href="homeController">Tiếp tục mua hàng</a>
			</div>
			<c:if test="${listOrder != null && !listOrder.isEmpty()}">
				<div class="flex-container cart-info">
					<table class="table table-striped">
						<tr>
							<th>#</th>
							<th>Ngày đặt hàng</th>
							<th>Danh sách sản phẩm</th>
							<th>Mã giảm giá</th>
							<th>Tổng tiền</th>
						</tr>
						<c:forEach items="${listOrder}" var="o" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${o.getOrderDate()}</td>
								<td><c:forEach items="${o.getLp()}" var="e">
										<div>
											<span>${e.getNameProduct()}, số lượng:
												${e.getAmountProduct()}</span>
										</div>
									</c:forEach></td>
								<td>${o.getDiscount()}</td>
								<td>${o.getTotal()}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
			<c:if test="${listOrder == null || listOrder.isEmpty()}">
				<div class="error">
					<p>Bạn hiện không có đơn hàng nào</p>
					<a href="homeController">Quay lại trang mua hàng</a>
				</div>
			</c:if>
		</div>

		<!-- Footer -->
		<jsp:include page="footer.jsp" />

	</div>

</body>

</html>