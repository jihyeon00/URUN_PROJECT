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
String OB_Complete_Date = "";
String OB_Status = "";
String OB_Note = "";

Connection conn = null;
PreparedStatement pstmt = null;

String sql = null;
try {
	num = request.getParameter("num");
	
	OB_Complete_Date = request.getParameter("OB_Complete_Date-date")+request.getParameter("OB_Complete_Date-time");
	OB_Status = request.getParameter("OB_Status");
	OB_Note = request.getParameter("OB_Note");
	
	sql = "UPDATE OB"
		+ " SET OB_Status = ? ,"
			+ " OB_Complete_Date = to_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),"
			+ " OB_Note = ?"
		+ " WHERE OB_ID = "+ num ;
	conn = DBManager.getConnection();
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, OB_Status);
	pstmt.setString(2, OB_Complete_Date);
	pstmt.setString(3, OB_Note);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	System.out.println("DAO2 오류입니다." + e);
} 
	DBManager.IUDClose(conn, pstmt);

%>
<script>
	location.href = './OBSelect.jsp';
</script>

</body>
</html>