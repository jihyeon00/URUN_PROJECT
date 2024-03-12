<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.urun.config.*"%>
<%@page import="kr.co.urun.dto.*"%>
<%@page import="kr.co.urun.mapper.*"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>header</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="/resources/js/jquery-3.7.1.min.js"></script>
        <script src="/resources/js/main.js"></script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<header>
	<div class="header">
		<div class="header-inner">
			<div>
				<div class="logoBox"><a href="./main.jsp">URUN</a></div>
				<div class="loginInfo">
				    <span>11111111</span>(OOO)님 안녕하세요.
                	<input type="button" class="btn btn-light" value="로그아웃" onclick='location.href="./logOut"'/>
				</div>
			</div>
		</div>
	</div>
</header>
</body>
</html>