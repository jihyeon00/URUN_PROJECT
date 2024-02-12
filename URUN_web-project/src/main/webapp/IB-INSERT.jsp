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

int IB_Company_ID = Integer.parseInt(request.getParameter("IB_Company_ID"));
int IB_MATERIAL_ID = Integer.parseInt(request.getParameter("IB_MATERIAL_ID"));
int IB_Quantity = Integer.parseInt(request.getParameter("IB_Quantity"));
String IB_Expected_Date = request.getParameter("IB_Expected_Date");

Connection conn = null;
PreparedStatement pstmt = null;

String sql = null;

try {
	sql= "INSERT INTO IB(IB_Company_ID, IB_MATERIAL_ID, IB_Quantity, IB_Expected_Date) VALUES (?, ?, ?, to_date(?,'YYYY-MM-DD'))";
	conn = DBManager.getConnection();
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, IB_Company_ID); 
	pstmt.setInt(2, IB_MATERIAL_ID); 
	pstmt.setInt(3, IB_Quantity); 
	pstmt.setString(4, IB_Expected_Date);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	System.out.println("DAO1 오류입니다." + e);
}
try {
	sql = "INSERT INTO	INVENTORY(INVENTORY_IB_ID, INVENTORY_MATERIAL_ID, INVENTORY_Quantity)" +
			" SELECT  IB_ID, IB_MATERIAL_ID, IB_Quantity" +
			" FROM IB" +
			" WHERE IB_Company_ID = ?" +
				" AND IB_MATERIAL_ID = ?" +
				" AND IB_Quantity = ?" +
				" AND IB_Expected_Date = to_date(?,'YYYY-MM-DD')";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, IB_Company_ID); 
	pstmt.setInt(2, IB_MATERIAL_ID); 
	pstmt.setInt(3, IB_Quantity); 
	pstmt.setString(4, IB_Expected_Date);
	
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