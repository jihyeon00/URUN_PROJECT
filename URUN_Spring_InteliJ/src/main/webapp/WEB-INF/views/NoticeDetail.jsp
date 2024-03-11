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
<%@ include file="../include/sidebar.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String num = request.getParameter("num");
	NoticeDAO nDAO = new NoticeDAO();
	List<NoticeDTO> oneNotice = nDAO.selectOneNotice(num);
	List<NoticeDTO> minNotice = nDAO.selectMinNotice(num);
	List<NoticeDTO> maxNotice = nDAO.selectMaxNotice(num);
	
%>
<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> 
			<span style="font-weight: 800;">공지사항 상세</span>
		</div>
		<div class="noticeDetail">
			<div class="noticeTitleDiv">
				<div class="noticeTitle"><%=oneNotice.get(0).getNOTICE_TITLE() %></div>
				<div class="noticeInfo"><%=oneNotice.get(0).getEMPLOYEE_NAME() %> / <%=oneNotice.get(0).getNOTICE_REGDATE().substring(0, 10)%></div>
				<br>
			</div>
			<br>
			<div class="noticeContentDiv">
				<div class="noticeContent">
					<%= oneNotice.get(0).getNOTICE_CONTENT() %>
				</div>
				<div class="upDownNotice">
					<table summary="윗글, 아랫글" class="upDownNoticeTable">
						<colgroup>
							<col width="19%">
							<col width="89%">
						</colgroup>
						<tbody id="upDownNoticeTbody">
						<% if(minNotice.get(0).getMinNoticeId()!=0){%>
							<tr>     
								<th class="upNoticeName" id="next_title">윗글</th>     
								<td class="upNoticeTitle"><a href="./NoticeDetail.jsp?num=<%=minNotice.get(0).getMinNoticeId() %>"><%=minNotice.get(0).getNOTICE_TITLE() %></a></td>   
							</tr>
						<% } %>
						<% if(maxNotice.get(0).getMaxNoticeId()!=0){%>
							<tr>     
								<th class="downNoticeName" id="prev_title">아랫글</th>     
								<td class="downNoticeTitle"><a href="./NoticeDetail.jsp?num=<%=maxNotice.get(0).getMaxNoticeId() %>"><%=maxNotice.get(0).getNOTICE_TITLE() %></a></td>    
							</tr>
						<% } %>
						</tbody>
					</table>
				</div>
				<input type="button" class="GoNoticeList" value="목록가기" onclick="location.href='./NoticeList.jsp';"/>
			</div>
		</div>
	</div>
</body>
</html>