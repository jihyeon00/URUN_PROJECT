<%@page import="dto.headerDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>header</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/main.css">
    <script src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
<header>
	<div class="header">
		<div class="header-inner">
			<form action="./main.jsp">
				<div class="logoBox"><a href="./main.jsp">URUN</a></div>
				<div class="loginInfo">
				<%
					request.setCharacterEncoding("UTF-8");
					headerDAO hDao = new headerDAO();
					List<headerDTO> list = hDao.selectMemberInfo();
					int memberId = list.get(0).getMEMBER_ID();
					String employeeName= list.get(0).getEmployee_Name();
				%>
					<span><%= memberId%></span>(<%=employeeName %>)님 안녕하세요.
							<input type="button" class="btn btn-light" value="로그아웃"/>
					
				</div>
			</form>
			
			
		</div>
	</div>
</header>
</body>
</html>