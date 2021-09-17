<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="./css/style-register.css">
</head>

<body>
	<div class="flex box">
		<div class="flex login">
			<div class="flex items1">
				<h4>Đăng ký</h4>
				<form class="form-login" action="registerController" method="post">
					<div>
						<label for="name">Họ và tên</label> <input class='form-control'
							type='text' name='name' id='name' placeholder='Nhập tên của bạn'
							required>
					</div>
					<div>
						<label for="address">Địa chỉ</label> <input class='form-control'
							type='text' name='address' id='address'
							placeholder='Nhập địa chỉ của bạn' required>
					</div>
					<div>
						<label for="phone">Số điện thoại</label> <input
							class='form-control' type='tel' name='phone' id='phone'
							placeholder='Nhập số điện thoại của bạn'
							pattern="^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$"
							required>
					</div>
					<div>
						<label for="user">Tài khoản/Email</label> <input
							class='form-control' type='email' name='usermail' id='user'
							placeholder='Nhập email của bạn' required>
					</div>
					<div>
						<label for="password">Mật khẩu</label> <input class="form-control"
							type="password" name="password" id="password"
							placeholder="Mật khẩu" required>
					</div>
					<button type="submit">Đăng ký</button>
				</form>
				<div class="arlet">
					<p>${mess}</p>
				</div>
			</div>
			<div class="flex items2">
				<h4>Chào mừng bạn tới CNN SHOP</h4>
				<a href="login.jsp"><button>Đăng nhập</button></a> <a
					href="homeController">Quay lại trang chủ</a>
			</div>
		</div>
	</div>
</body>

</html>