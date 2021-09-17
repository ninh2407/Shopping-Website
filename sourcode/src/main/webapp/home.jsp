<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>

<body>

	<div class="container-fluid px-0">
		<!-- Header -->
		<jsp:include page="header.jsp" />
		<!-- Body -->

		<!--List product-->
		<div class="topic">
			<h2>DANH SÁCH SẢN PHẨM</h2>
		</div>
		<div class="flex-container list">
			<c:forEach items="${listProduct}" var="o">
				<a class="product" href="InfomationProductController?id=${o.id}">
					<img class="product-pic" src="${o.src}" alt="a12">
					<section>
						<p>${o.getName()}</p>
						<p>${o.price}</p>
					</section>
				</a>
			</c:forEach>
		</div>
		<div class="page-number">
			<c:forEach begin="1" end="${endP}" var="i">
				<a class="${tag==i?'active':''}" href="homeController?index=${i}"><button type="button" class="btn">${i}</button></a>
			</c:forEach>
		</div>
		<!-- Footer -->
		<jsp:include page="footer.jsp" />
	</div>

</body>

</html>