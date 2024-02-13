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
request.setCharacterEncoding("UTF-8");

int PROCESS_ITEM_ID = Integer.parseInt(request.getParameter("PROCESS_ITEM_ID"));
int PROCESS_Plan_Quantity = Integer.parseInt(request.getParameter("PROCESS_Plan_Quantity"));
String PROCESS_START_DATE = request.getParameter("PROCESS_START_DATE");
String PROCESS_LINE = request.getParameter("PROCESS_LINE");

Connection conn = null;
PreparedStatement pstmt = null;

String sql = null;

try {
	sql= "INSERT INTO PROCESS(PROCESS_ITEM_ID, PROCESS_Plan_Quantity, PROCESS_START_DATE, PROCESS_LINE) VALUES (?, ?, to_date(?,'YYYY-MM-DD'), ?)";
	conn = DBManager.getConnection();
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, PROCESS_ITEM_ID); 
	pstmt.setInt(2, PROCESS_Plan_Quantity); 
	pstmt.setString(3, PROCESS_START_DATE); 
	pstmt.setString(4, PROCESS_LINE);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	System.out.println("DAO1 오류입니다." + e);
}
	DBManager.IUDClose(conn, pstmt);

%>	
<script>
	location.href = './main.jsp';
</script>

</body>
</html>