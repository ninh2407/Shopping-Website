<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Header bar-->
<div class="flex-container header">

	<button class="btn btn0" type="button" data-bs-toggle="collapse"
		data-bs-target="#collapseExample" aria-expanded="false"
		aria-controls="collapseExample">
		<i class="fas fa-bars" style="color: white;"></i>
	</button>

	<div class="flex-items logo-box">
		<img class="logo" src="./img/pngegg.png" alt="onepice"
			style="width: 60%">
		<p class="logo-text">CNN SHOP</p>
	</div>

	<form action="SearchController2" method="get" class="block-items">
		<div class="input-group">
			<input type="text" class="form-control form-control" name="s"
				placeholder="Nhập tên điện thoại, máy tính cần tìm"
				style="border: none; width: 80%;">
			<div class="input-group-append">
				<button class="btn btn-warning" type="submit">
					<i class="fas fa-search" style="color: white;"></i>
				</button>
			</div>
		</div>
	</form>

	<div class="flex-items cart">
		<a href="cartPage.jsp"><i class="fas fa-shopping-cart icon"
			style="color: white;"></i> <span style="margin-right: 15px;">Giỏ
				hàng</span> </a>
	</div>

	<div class="flex-items acount" style="display: ${formDisplay};">
		<i class="far fa-user-circle icon" style="color: white;"></i>
		<div class="flex-items login">
			<a href="login.jsp">Đăng nhập</a>
		</div>
		<div class="flex-items logout">
			<a href="register.jsp">Đăng ký</a>
		</div>
	</div>

	<div class="flex-items acc" style="display: ${accDisplay};">
		<div class="flex-items logo-acc">
			<i class="far fa-user-circle icon" style="color: white;"></i>
			<p>${acc.getUserName()}</p>
		</div>
		<div class="flex-items login">
			<a href="showOrderController">Đơn hàng</a>
		</div>
		<div class="flex-items logout">
			<a href="LogoutServlet">Đăng xuất</a>
		</div>
	</div>

	<button class="btn btn0" type="button" data-bs-toggle="collapse"
		data-bs-target="#collapseExample1" aria-expanded="false"
		aria-controls="collapseExample">
		<i class="fas fa-search" style="color: white;"></i>
	</button>
</div>

<div class="collapse" id="collapseExample1"
	style="background-color: #ff5e00;">
	<form action="SearchController2" method="get"
		class="block-items-moblie">
		<div class="input-group">
			<input type="text" class="form-control form-control" name="s"
				placeholder="Nhập tên điện thoại, máy tính cần tìm"
				style="border: none; width: 80%;">
			<button class="btn btn-warning" type="submit">
				<i class="fas fa-search" style="color: white;"></i>
			</button>
		</div>
	</form>
</div>

<div class="collapse" id="collapseExample"
	style="background-color: #ff5e00;">
	<div class="flex-items cart-mobile">
		<a href="cartPage.jsp"><i class="fas fa-shopping-cart icon"
			style="color: white;"></i> <span style="margin-right: 15px;">Giỏ
				hàng</span> </a>
	</div>

	<div class="flex-items" style="display: ${formDisplay};">
		<i class="far fa-user-circle icon" style="color: white;"></i>
		<div class="flex-items login">
			<a href="login.jsp">Đăng nhập</a>
		</div>
		<div class="flex-items logout">
			<a href="register.jsp">Đăng ký</a>
		</div>
	</div>

	<div class="flex-items acc-moblie" style="display: ${accDisplay};">
		<div class="flex-items logo-acc">
			<i class="far fa-user-circle icon" style="color: white;"></i>
			<p>${acc.getUserName()}</p>
		</div>
		<div class="flex-items login">
			<a href="showOrderController">Đơn hàng</a>
		</div>
		<div class="flex-items logout">
			<a href="LogoutServlet">Đăng xuất</a>
		</div>
	</div>

</div>

<!--Banner-->
<div class="banner">
	<div id="carouselExampleFade" class="carousel slide carousel-fade"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="https://mdbootstrap.com/img/Photos/Others/ecommerce3.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="https://mdbootstrap.com/img/Photos/Others/ecommerce1.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="https://mdbootstrap.com/img/Photos/Others/ecommerce2.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<!--Menu-->
<div class="flex-container menu">
	<ul class="flex-items">
		<li><a href="#"><i class="fas fa-mobile-alt icon"></i><span>Điện
					thoại</span></a></li>
		<li><a href="#"><i class="fas fa-laptop icon"></i><span>Laptop</span></a></li>
		<li><a href="#"><i class="fas fa-tablet-alt icon"></i><span>Tablet</span></a></li>
		<li><a href="#"><i class="fas fa-headphones-alt icon"></i><span>Phụ
					kiện</span></a></li>
	</ul>
</div>