<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 체크</title>
</head>
<body>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null; //디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
	
	Exception exception = null;
	int MEMBER_ID = Integer.parseInt(request.getParameter("signUpMemberId"));
	String MEMBER_PW = request.getParameter("signUpPassword");
	
  try {
	  System.out.println(MEMBER_ID);
	  System.out.println(MEMBER_PW);
	  	 		 	  
	  conn = DBManager.getConnection();
	  
		// 2. SEMI_PROJECT4 MEMBER 테이블에 화면 폼으로부터 가져온 데이터 입력
		String sql = "INSERT INTO MEMBER(MEMBER_ID, MEMBER_PW, MEMBER_EMPLOYEE_ID) VALUES (?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, MEMBER_ID);
		pstmt.setString(2, MEMBER_PW);
		pstmt.setInt(3, MEMBER_ID);

		pstmt.executeUpdate();
		
		
  } catch(Exception e) {
	  exception = e;
	  e.printStackTrace();
	  
  } finally {
	  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
	  
  }
  
  
%>

<%
	if (exception == null) {	// 회원가입 등록이 성공할 경우
%>		
<!-- 성공 케이스 html/css/js -->
<script>
	alert('회원가입이 성공적으로 등록되었습니다.');	// 1
	location.href = '<%= request.getContextPath() %>/signIn.jsp';
</script>
<%
	} else {
%>
<!-- 실패 케이스 html/css/js -->
회원가입이 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
오류내용: <%= exception.getMessage() 
%>
<%= MEMBER_ID%>
<%= MEMBER_PW %>


<%	
	}
%>
	
</body>
</html>
