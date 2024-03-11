<%@page import="util.DBManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	int WORK_PROCESS_ID = Integer.parseInt(request.getParameter("PROCESS_ID"));
	int WORK_Plan_Quantity = Integer.parseInt(request.getParameter("WORK_Plan_Quantity"));
	int WORK_ITEM_Quantity = Integer.parseInt(request.getParameter("WORK_ITEM_Quantity"));
	int WORK_Defective_Quantity = Integer.parseInt(request.getParameter("WORK_Defective_Quantity"));
	String WORK_Defective_Reason = request.getParameter("WORK_Defective_Reason");
	
	Connection conn = null; 		
	PreparedStatement pstmt = null;
	Exception exception = null;
	
	try {
	 	conn=DBManager.getConnection();
		
		String sql = "INSERT INTO WORK (WORK_PROCESS_ID, WORK_Plan_Quantity, WORK_ITEM_Quantity, WORK_Defective_Quantity, WORK_Defective_Reason)"
				+" VALUES (?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, WORK_PROCESS_ID); 
		pstmt.setInt(2, WORK_Plan_Quantity); 
		pstmt.setInt(3, WORK_ITEM_Quantity); 
		pstmt.setInt(4, WORK_Defective_Quantity); 
		pstmt.setString(5, WORK_Defective_Reason);
		
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		System.out.println("DAO1 오류입니다." + e);
		e.printStackTrace();
	} 
	
	try {
	 	conn=DBManager.getConnection();
		
	 	String sql = "INSERT INTO INVENTORY (INVENTORY_ITEM_ID, INVENTORY_WORK_ID, INVENTORY_Quantity)"
				+" SELECT p.PROCESS_ITEM_ID, w.WORK_ID, w.WORK_ITEM_Quantity"
				+" FROM WORK w"
				+" INNER JOIN PROCESS p"
				+	" ON w.WORK_PROCESS_ID = p.PROCESS_ID"
				+" WHERE w.WORK_Plan_Quantity = ?"
				+	" AND w.WORK_ITEM_Quantity = ?"
				+	" AND w.WORK_Defective_Quantity = ?"
				+	" AND w.WORK_Defective_Reason = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, WORK_Plan_Quantity); 
		pstmt.setInt(2, WORK_ITEM_Quantity); 
		pstmt.setInt(3, WORK_Defective_Quantity); 
		pstmt.setString(4, WORK_Defective_Reason);
		
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		System.out.println("DAO2 오류입니다." + e);
		e.printStackTrace();
	} 
	
	try {
	 	conn=DBManager.getConnection();
		
		String sql = "UPDATE WORK"
				+" SET WORK_INVENTORY_ID = ( SELECT i.INVENTORY_ID"
										+" FROM WORK w, INVENTORY i"
										+" WHERE w.WORK_ID =  i.INVENTORY_WORK_ID"
										+	" AND w.WORK_Plan_Quantity = ?"
										+	" AND w.WORK_ITEM_Quantity = ?"
										+	" AND w.WORK_Defective_Quantity = ?"
										+	" AND w.WORK_Defective_Reason = ?)"
				+" WHERE WORK_Plan_Quantity = ?"
				+	" AND WORK_ITEM_Quantity = ?"
				+	" AND WORK_Defective_Quantity = ?"
				+	" AND WORK_Defective_Reason = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, WORK_Plan_Quantity); 
		pstmt.setInt(2, WORK_ITEM_Quantity); 
		pstmt.setInt(3, WORK_Defective_Quantity); 
		pstmt.setString(4, WORK_Defective_Reason);
		pstmt.setInt(5, WORK_Plan_Quantity); 
		pstmt.setInt(6, WORK_ITEM_Quantity); 
		pstmt.setInt(7, WORK_Defective_Quantity); 
		pstmt.setString(8, WORK_Defective_Reason);
		
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		System.out.println("DAO3 오류입니다." + e);
		e.printStackTrace();
	} 
	
  	DBManager.IUDClose(conn, pstmt);
  
	%>

	<%
		if (exception == null) {	// 공지사항 글 삭제가 성공할 경우
			
	%>		
		<!-- 성공 케이스-->
		<script>
			alert('성공적으로 추가되었습니다.');	// 1
			location.href = '<%= request.getContextPath() %>/PROCESS_management.jsp';
		</script>
	<%
		} else {	// 공지사항 글 삭제가 실패할 경우
	%>
		<!-- 실패 케이스 -->
		alert('추가를 실패하였습니다. 시스템 관리자에게 문의하세요. 오류내용: <%= exception.getMessage() %>');
		location.href = '<%= request.getContextPath() %>/PROCESS_management.jsp';
		
		
		
	<%	
		}
	%>