<%@page import="util.DBManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String bomNum = request.getParameter("bomNum");
	String deleteMaterialNum = request.getParameter("deleteMaterialNum");
	
	Connection conn = null; 		// 디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
	Exception exception = null;
	
  try {
		// 0.
	 	conn=DBManager.getConnection();
		
		// 2.테이블에 화면 폼으로부터 가져온 데이터 입력
		String sql = "DELETE FROM BOM b WHERE b.bom_item_id = " + bomNum
				+ " AND b.bom_material_id = " + deleteMaterialNum;
		
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
			alert('성공적으로 삭제되었습니다.');	// 1
			location.href = '<%= request.getContextPath() %>/bomRegistration.jsp?search='+<%=bomNum %>;
		</script>
	<%
		} else {	// 공지사항 글 삭제가 실패할 경우
	%>
		<!-- 실패 케이스 -->
		alert('삭제를 실패하였습니다. 시스템 관리자에게 문의하세요. 오류내용: <%= exception.getMessage() %>');
		location.href = '<%= request.getContextPath() %>/bomRegistration.jsp?search='+<%=bomNum %>;
		
		
		
	<%	
		}
	%>