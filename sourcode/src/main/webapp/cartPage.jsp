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
				<p>Giỏ hàng của bạn</p>
				<a href="homeController">Tiếp tục mua hàng</a>
			</div>
			<c:if test="${cart != null && !cart.items.isEmpty()}">
			<div class="flex-container cart-info">
				<table class="table table-striped">
					<tr>
						<th>#</th>
						<th>Sản phẩm</th>
						<th>Giá</th>
						<th>Số lượng</th>
						<th>Thành tiền</th>
						<th>Xóa</th>
					</tr>
					<c:forEach items="${cart.items}" var="o" varStatus="i">
						<tr>
							<td>${i.count}</td>
							<td>${o.name}</td>
							<td>${o.price}</td>
							<td>
								<div class="amount">
									<a href="changeNumber?id=${o.id}&action=increase"><i class="fas fa-plus-square"></i></a>
									<span>${o.number}</span>
									<a href="changeNumber?id=${o.id}&action=decrease"><i class="fas fa-minus-square"></i></a>
								</div>
							</td>
							<td><fmt:formatNumber type="number" maxIntegerDigits="3"
									value="${o.price*o.number}" /></td>
							<td><a href="AddToCartController?id=${o.id}&action=delete"><i
									class="fas fa-trash-alt"></i></a></td>

						</tr>
					</c:forEach>
					<tr>
						<td colspan="4">Tổng cộng:</td>
						<td>${cart.getAmount()}</td>
						<td></td>
					</tr>
				</table>
				<p>Thông tin khách hàng</p>
				<form class="form-cart" action="PayController" method="post">
					<div>
						<label for="customer-name">Email đặt hàng: </label> <input
							class="form-control" type="text" name="name" id="customer-name"
							required>
					</div>
					<div>
						<label for="customer-address">Địa chỉ: </label> <input
							class="form-control" type="text" name="address"
							id="customer-address" required>
					</div>
					<div>
						<label for="discount">Mã giảm giá (nếu có): </label> <input
							class="form-control" type="text" name="discount" id="discount">
					</div>
					<div class="submit-box">
						<button type="submit">Đặt hàng</button>
					</div>
				</form>
			</div>
			</c:if>
			<c:if test="${cart.items.isEmpty() || cart == null}">
				<div class = "error">
					<p>Hiện không có sản phẩm nào trong giỏ hàng</p>
					<a href="homeController">Quay lại trang mua hàng</a>
				</div>
			</c:if>		
		</div>
		
		<!-- Footer -->
		<jsp:include page="footer.jsp" />

	</div>

</body>

</html>