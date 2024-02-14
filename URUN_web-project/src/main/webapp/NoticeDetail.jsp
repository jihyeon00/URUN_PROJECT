<%@page import="dto.NoticeDTO"%>
<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
</head>
<body>
<%@ include file="./sidebar.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String num = request.getParameter("num");
	NoticeDAO nDAO = new NoticeDAO();
	List<NoticeDTO> oneNotice = nDAO.selectOneNotice(num);
%>
<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> 
			<span style="font-weight: 800;">공지사항 상세</span>
		</div>
		<div class="noticeDetail">
			<div class="noticeTitle">
				<div><%=oneNotice.get(0).getNOTICE_TITLE() %></div>
				<div><%=oneNotice.get(0).getEMPLOYEE_NAME() %> / <%=oneNotice.get(0).getNOTICE_REGDATE().substring(0, 10)%></div>
			</div>
			<div class="noticeDiv">
				<div class="noticeContent">
					<%=oneNotice.get(0).getNOTICE_CONTENT() %>
				</div>
				<div class="upDownNotice">
					<div class="upNotice">
						<div>윗글</div> 
						<div>글제목</div> 
					</div>
					<div class="downNotice">
						<div>아랫글</div> 
						<div>글제목</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>