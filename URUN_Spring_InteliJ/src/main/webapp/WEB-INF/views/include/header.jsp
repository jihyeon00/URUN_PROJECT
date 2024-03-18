<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<% request.setCharacterEncoding("UTF-8"); 
	String MEMBER_ID = request.getParameter("MEMBER_ID");
    String EMPLOYEE_NAME = request.getParameter("EMPLOYEE_NAME");
%>
<header>
	<div class="header">
		<div class="header-inner">
			<div>
				<div class="logoBox"><a href="./main">URUN</a></div>
				<div class="loginInfo">
				    <span><%=MEMBER_ID%></span>(<%=EMPLOYEE_NAME%>)님 안녕하세요.
                	<input type="button" class="btn btn-light" value="로그아웃" onclick='location.href="./logOut"'/>
				</div>
			</div>
		</div>
	</div>
</header>
</body>
</html>