<%@page import="java.util.List"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String noticeMemberId = request.getParameter("MEMBER_ID");
String noticeTitle = request.getParameter("NoticeTitle");
String noticeContent = request.getParameter("NoticeContent");

NoticeDTO noticeDTO = new NoticeDTO();
noticeDTO.setNOTICE_MEMBER_ID(noticeMemberId);
noticeDTO.setNOTICE_TITLE(noticeTitle);
noticeDTO.setNOTICE_CONTENT(noticeContent);

NoticeDAO nDAO = new NoticeDAO();
int insertNotice = nDAO.noticeInsert(noticeMemberId, noticeDTO);

if(insertNotice>0){
%>
<script type="text/javascript">
	alert("공지가 등록되었습니다.");
	location.href="./NoticeList.jsp";
</script>
<%} else { %>
<script type="text/javascript">
	alert("공지 등록을 실패하였습니다.");
	location.href="./NoticeInsertForm.jsp";
</script>
<%} %>
</body>
</html>