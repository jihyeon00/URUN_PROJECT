<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.DBManager"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
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
				<%
					if(session.getAttribute("MEMBER_ID") == null){
						out.println("<a href='./signIn.jsp'>로그인</a>");
					} else {
						String MEMBER_ID = (String)session.getAttribute("MEMBER_ID");
						String employeeName = (String)session.getAttribute("employeeName");
				%>
						<span><%=MEMBER_ID%></span>(<%=employeeName %>)님 안녕하세요.
							<input type="button" class="btn btn-light" value="로그아웃" onclick='location.href="./logOut.jsp"'/>
				<%
					}
				%>
				</div>
			</div>
		</div>
	</div>
</header>
</body>
</html>