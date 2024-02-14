<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.DBManager"%>
<%@page import="dto.NoticeDTO"%>
<%@page import="dao.NoticeDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<%@ include file="./sidebar.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");
	NoticeDAO nDAO = new NoticeDAO();
	List<NoticeDTO> listNotice = nDAO.selectNoticeAll();
%>

<!-- 메인화면 -->
	<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> 
			<span style="font-weight: 800; padding-top:-20px;">공지사항</span>
		</div>
		<div class="noticeList">
			<table>
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 75%" />
					<col style="width: 15%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i=0;i<listNotice.size();i++) {%>
					<tr>
						<td><%=listNotice.get(i).getNOTICE_ID()%></td>
						<td><a style="color:black;" href="./NoticeDetail.jsp?num=<%=listNotice.get(i).getNOTICE_ID()%>"><%=listNotice.get(i).getNOTICE_TITLE()%></a></td>
						<td><%=listNotice.get(i).getNOTICE_REGDATE().substring(0, 10) %></td>
					</tr>
					<%} %>
				</tbody>			
			</table>
			<input type="button" value="등록" onclick="javascript: insertNotice()"/>
		</div>
	</div>
<script>
	function insertNotice() {
		
	}
</script>
</body>
</html>