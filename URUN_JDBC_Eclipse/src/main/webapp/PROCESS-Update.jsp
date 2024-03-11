<%@ page import="util.*" %>  
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.Exception" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./js/jquery-3.7.1.min.js"></script>
<title>URUN</title>
</head>
<body>
<%
//한글 처리
request.setCharacterEncoding("UTF-8");

String num = "";
String PROCESS_Status = "";
String PROCESS_END_DATE = "";

Connection conn = null;
PreparedStatement pstmt = null;

String sql = null;
try {
	num = request.getParameter("num");
	
	PROCESS_Status = request.getParameter("PROCESS_Status");
	PROCESS_END_DATE = request.getParameter("PROCESS_END_DATE");
	
	sql = "UPDATE PROCESS"
		+ " SET PROCESS_Status = ? ,"
			+ " PROCESS_END_DATE = to_date(?,'YYYY-MM-DD HH24:MI:SS')"
		+ " WHERE PROCESS_ID = "+ num ;
	conn = DBManager.getConnection();
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, PROCESS_Status);
	pstmt.setString(2, PROCESS_END_DATE);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	System.out.println("DAO2 오류입니다." + e);
} 
	DBManager.IUDClose(conn, pstmt);

%>
<script>
	location.href = './PROCESS_management.jsp';
</script>

</body>
</html>