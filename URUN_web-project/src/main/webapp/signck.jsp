<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	int MEMBER_ID = 0;
 
	String MEMBER_PW = "";
	

	


	String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522/ORCL";
	String USER = "semi_project4";
	String PASSWORD = "123454";
		
	Connection conn = null; //디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
	
	Exception exception = null;
	

  try {
	  			
	  MEMBER_ID = Integer.parseInt(request.getParameter("MEMBERID"));
	  MEMBER_PW = request.getParameter("MEMBERPW");
	 
	  	 		 	  
	  // 0.
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	// System.out.println("오라클 접속 성공");
	  
		// 2. SEMI_PROJECT4 MEMBER 테이블에 화면 폼으로부터 가져온 데이터 입력
		String insertQuery = "INSERT INTO MEMBER(MEMBER_ID, MEMBER_PW) VALUES (?,?)";
		pstmt = conn.prepareStatement(insertQuery);
		pstmt.setInt(1, MEMBER_ID);
		pstmt.setString(2, MEMBER_PW);

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
		// 1. 성공 팝업 생성
		// 2. 메인페이지 이동
%>		
<!-- 성공 케이스 html/css/js -->
<script>
	alert('회원가입이 성공적으로 등록되었습니다.');	// 1
	location.href = '<%= request.getContextPath() %>./login.jsp';
</script>
<%
	} else {									// 공지사항 글 등록이 실패할 경우
		// 1. 실패글
		// 2. 오류내용 표시
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




