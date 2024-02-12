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

int OB_Company_ID = Integer.parseInt(request.getParameter("OB_Company_ID"));
int OB_ITEM_ID = Integer.parseInt(request.getParameter("OB_ITEM_ID"));
int OB_Quantity = Integer.parseInt(request.getParameter("OB_Quantity"));
String OB_Expected_Date = request.getParameter("OB_Expected_Date");

Connection conn = null;
PreparedStatement pstmt = null;

String sql = null;

try {
	sql= "INSERT INTO OB(OB_Company_ID, OB_ITEM_ID, OB_Quantity, OB_Expected_Date) VALUES (?,?,?,to_date(?,'YYYY-MM-DD'))";
	conn = DBManager.getConnection();
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, OB_Company_ID); 
	pstmt.setInt(2, OB_ITEM_ID); 
	pstmt.setInt(3, OB_Quantity); 
	pstmt.setString(4, OB_Expected_Date);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	System.out.println("DAO1 오류입니다." + e);
}
try {
	sql = "INSERT INTO INVENTORY(INVENTORY_OB_ID, INVENTORY_ITEM_ID, INVENTORY_Quantity)" +
			" SELECT OB_ID, OB_ITEM_ID, OB_Quantity" +
			" FROM OB" +
			" WHERE OB_Company_ID = ?" +
				" AND OB_ITEM_ID = ?" +
				" AND OB_Quantity = ?" +
				" AND OB_Expected_Date = to_date(?,'YYYY-MM-DD')";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, OB_Company_ID); 
	pstmt.setInt(2, OB_ITEM_ID); 
	pstmt.setInt(3, OB_Quantity); 
	pstmt.setString(4, OB_Expected_Date);
	
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