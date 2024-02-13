<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String MEMBER_ID = request.getParameter("MEMBER_ID");
	String MEMBER_PW = request.getParameter("MEMBER_PW");
	
	MemberDAO mDao = new MemberDAO();
	List<MemberDTO> selectMember = mDao.selectMemberInfo(MEMBER_ID);
	
	String memberId = selectMember.get(0).getMEMBER_ID();
	String memberPw = selectMember.get(0).getMEMBER_PW();
	
	String employeeName= selectMember.get(0).getEMPLOYEE_NAME();
	
	if(MEMBER_ID !=null && MEMBER_ID.equals(memberId) && MEMBER_PW.equals(memberPw)){
		session.setAttribute("MEMBER_ID", MEMBER_ID);
		session.setAttribute("employeeName", employeeName);
		
		response.sendRedirect("./main.jsp");
 	} 
%>
<script type="text/javascript">
alert("로그인에 실패하였습니다.");
location.href='./signIn.jsp';
</script>
</body>
</html>