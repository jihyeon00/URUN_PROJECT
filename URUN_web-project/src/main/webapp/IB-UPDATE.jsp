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
String IB_Test_Quantity = "";
String IB_Defective_Quantity = "";
String IB_Defective_Date = "";
String IB_Complete_Date = "";
String IB_Status = "";
String IB_Note = "";

Connection conn = null;
PreparedStatement pstmt = null;

String sql = null;
try {
	num = request.getParameter("num");
	
	IB_Test_Quantity = request.getParameter("IB_Test_Quantity");
	IB_Defective_Quantity = request.getParameter("IB_Defective_Quantity");
	IB_Defective_Date = request.getParameter("IB_Defective_Date");
	IB_Complete_Date = request.getParameter("IB_Complete_Date-date")+request.getParameter("IB_Complete_Date-time");
	IB_Status = request.getParameter("IB_Status");
	IB_Note = request.getParameter("IB_Note");
	
	sql = "UPDATE IB"
		+ " SET IB_Test_Quantity = ?,"
		+ " IB_Defective_Quantity = ?,"
		+ " IB_Defective_Date = to_date(?,'YYYY-MM-DD'),"
		+ " IB_Complete_Date = to_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),"
		+ " IB_Status = ?,"
		+ " IB_Note = ?"
		+ " WHERE IB_ID ="+num;
	conn = DBManager.getConnection();
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(IB_Test_Quantity)); 
	pstmt.setInt(2, Integer.parseInt(IB_Defective_Quantity)); 
	pstmt.setString(3, IB_Defective_Date); 
	pstmt.setString(4, IB_Complete_Date);
	pstmt.setString(5, IB_Status);
	pstmt.setString(6, IB_Note);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	System.out.println("DAO2 오류입니다." + e);
} 
	DBManager.IUDClose(conn, pstmt);

%>
<script>
	location.href = './main.jsp';
</script>

</body>
</html>