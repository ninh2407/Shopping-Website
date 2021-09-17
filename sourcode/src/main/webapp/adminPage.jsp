<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- External css -->
    <link rel="stylesheet" href="./css/style-admin.css">
    <!-- Import Icon library -->
    <script src="https://kit.fontawesome.com/5375cbd5e7.js" crossorigin="anonymous"></script>
    <!--Import Boottrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
        crossorigin="anonymous"></script>
</head>

<body>
    <div class="flex box">
        <div class="flex menu">
            <div class = "logo">
                <img src="./img/pngegg.png" alt="">
            </div>
            <p class = "shop">CNN SHOP</p>
            <div>
            	<p class = "admin">Admin: ${admin.getUserName()}</p>
            </div>
            <ul>
                <li><a href ="#">Dashboard</a></li>
                <li><a href ="#">Quản lý nhân viên</a></li>
                <li><a href ="#">Quản lý sản phẩm</a></li>
                <li><a href ="#">Đơn hàng</a></li>
                <li><a href ="#">Thống kê doanh thu</a></li>
                <li><a href ="LogoutServlet">Đăng xuất</a></li>
            </ul>
        </div>
        <div class="flex content">
            <div class="banner">
                <img src="./img/dash-board.jpg" alt="">
            </div>
            <div>
                
            </div>
        </div>
    </div>
</body>

</html>