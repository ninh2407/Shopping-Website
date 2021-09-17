<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="./css/style-product.css">
</head>

<body>

	<div class="container-fluid px-0">
		<!-- Header -->
		<jsp:include page="header.jsp" />

		<!--Product info-->
		<div class="flex-container info">
			<div class="title">
				<p>Thông tin sản phẩm</p>
			</div>
			<div class="info-content">
				<div class="product-img">
					<img src="${product.src}" alt="">
				</div>
				<div class="product-info">
					<p class="name-product">${product.name}</p>
					<p class="price">${product.price}</p>
					<p>${product.description}</p>
					<a href = "AddToCartController?id=${product.id}&action=add"><button type="submit">Thêm vào giỏ hàng</button></a>			
				</div>
			</div>
		</div>

		<!-- Footer -->
		<jsp:include page="footer.jsp" />

	</div>

</body>

</html>