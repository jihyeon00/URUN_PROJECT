<%@page import="util.DBManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO" %>
<%@ page import="dto.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String signUpMemberId = request.getParameter("signUpMemberId");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	List<MemberDTO> list = new ArrayList<>();
	
	String sql = null;
	
	
	try {
		sql = "SELECT m.MEMBER_ID , m.MEMBER_PW FROM MEMBER WHERE e.EMPLOYEE_ID = " + signUpMemberId;
		
		conn = DBManager.getConnection();
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMEMBER_ID(rs.getString("MEMBER_ID"));
			memberDTO.setMEMBER_PW(rs.getString("MEMBER_PW"));
			list.add(memberDTO);
		}
	} catch (Exception e) {
		System.out.println("DAO 오류입니다." + e);
	} 
	
	DBManager.selectClose(conn, pstmt, rs);

%>

</body>
</html>