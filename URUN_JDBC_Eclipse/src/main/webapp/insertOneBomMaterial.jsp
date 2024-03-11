<%@page import="util.DBManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String bomNum = request.getParameter("bomNum");
	String quantity = request.getParameter("quantity");
	String insertMaterialNum = request.getParameter("insertMaterialNum");
	
		Connection conn = null; 		
		PreparedStatement pstmt = null;
		Exception exception = null;
	
  try {
	 	conn=DBManager.getConnection();
		
		String sql = "INSERT INTO BOM (BOM_ID , BOM_MATERIAL_ID, BOM_ITEM_ID , BOM_MATERIAL_QUANTITY)"
				+" VALUES ("+ bomNum + ", " + insertMaterialNum + ", " + bomNum + ", "+ quantity + ")";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
	  } catch(Exception e) {
		  exception = e;
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
			location.href = '<%= request.getContextPath() %>/bomRegistration.jsp?search='+<%=bomNum %>;
		</script>
	<%
		} else {	// 공지사항 글 삭제가 실패할 경우
	%>
		<!-- 실패 케이스 -->
		alert('추가를 실패하였습니다. 시스템 관리자에게 문의하세요. 오류내용: <%= exception.getMessage() %>');
		location.href = '<%= request.getContextPath() %>/bomRegistration.jsp?search='+<%=bomNum %>;
		
		
		
	<%	
		}
	%>