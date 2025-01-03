<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subway Header</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.header {
	background-color: rgb(31, 147, 98);
	color: white;
	padding: 20px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header .logo {
	font-size: 24px;
	font-weight: bold;
}

.header .logo img {
	width: 150px;
	height: auto;
}

.header nav {
	display: flex;
	gap: 200px;
	position: relative;
}

.header nav a {
	color: white;
	text-decoration: none;
	font-size: 18px;
	position: relative;
}

.header nav a:hover {
	text-decoration: underline;
}

.dropdown {
	display: none; /* 기본적으로 숨김 */
	position: absolute; /* 드롭다운 위치 조정 */
	background-color: rgb(31, 147, 98);
	padding: 10px;
	/* margin-top: 10px; */ /* 드롭다운 아래쪽 여백 추가 */
	z-index: 5000;
}

.menu-item {
	position: relative; /* 드롭다운을 포함할 부모 요소 */
}

.menu-item:hover .dropdown {
	display: block; /* 부모 링크에 마우스가 올라가면 드롭다운 보임 */
}

.dropdown a {
	display: block; /* 드롭다운 항목을 블록으로 설정 */
	padding: 5px 0;
}

.auth-links {
	display: flex;
	gap: 20px;
}

.auth-links a {
	color: white;
	text-decoration: none;
	font-size: 18px;
}

.auth-links a:hover {
	text-decoration: underline;
}

</style>
</head>
<body>
	<header class="header">
		<div class="logo">
			<img src="../image/logo.jpg"
					alt="햄버거 이미지">
		</div>
		<nav>
			<div class="menu-item">
				<a href="#">Home</a>
				<div class="dropdown">
					<a href="#">Home Submenu 1</a> <a href="#">Home Submenu 2</a>
				</div>
			</div>
			<div class="menu-item">
				<a href="#">Menu</a>
				<div class="dropdown">
					<a href="#">Submenu 1</a> <a href="#">Submenu 2</a> <a href="#">Submenu
						3</a>
				</div>
			</div>
			<div class="menu-item">
				<a href="#">Order</a>
				<div class="dropdown">
					<a href="#">Order Submenu 1</a> <a href="#">Order Submenu 2</a>
				</div>
			</div>
			<div class="menu-item">
				<a href="#">Contact</a>
				<div class="dropdown">
					<a href="#">Contact Submenu 1</a> <a href="#">Contact Submenu 2</a>
				</div>
			</div>
		</nav>
		<div class="auth-links">
			<c:if test="${ empty user_id }">
				<a href="http://localhost:8080/240930subKingProject/api/v1/tempLogIn">로그인</a>
				<a href="../jsp/newjoin.jsp">회원가입</a>
			</c:if>
			<c:if test="${ not empty user_id }">
				<a href="http://localhost:8080/240930subKingProject/api/v1/tempLogOut">로그아웃</a>
				<a href="../html/orders.html">주문내역</a>
			</c:if>
		</div>
		<div class="auth-links">
		<c:if test="${ not empty user_id }">
				<a href="http://localhost:8080/240930subKingProject/api/v1/tempExit" id="userDelete">회원탈퇴</a>
			</c:if>
			</div>
	</header>
</body>
</html>
