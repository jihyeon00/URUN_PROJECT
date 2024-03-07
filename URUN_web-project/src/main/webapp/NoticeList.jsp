<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.DBManager"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
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
	MemberDAO mDAO = new MemberDAO();
	
	int totalCnt = nDAO.getTotalNotice();
	int pageSize = 10 ;
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int pageCnt = currentPage * pageSize;
	
	List<NoticeDTO> listNotice = nDAO.selectNoticeAll(startRow, pageCnt);

	
	String MEMBER_ID = request.getParameter("MEMBER_ID");
	
	List<MemberDTO> selectMember = mDAO.selectMemberInfo(MEMBER_ID);
	
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
					<col style="width: 60%" />
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
			<div class="paging">
				<%if(totalCnt !=0){ 
					int pageCount = totalCnt / pageSize + ( totalCnt % pageSize == 0 ? 0 : 1);
					
					int pageBlock = 10;
					int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
					
					int endPage = startPage + pageBlock -1;
					if(endPage>pageCount){
						endPage=pageCount;
					}
					%>
						<nav aria-label="Page navigation example" id="pagingNav">
						  <ul class="pagination">
					<% if(startPage>pageBlock){ %>
						    <li class="page-item">
						      <a class="page-link" href="./NoticeList.jsp?pageNum=<%=startPage-pageBlock%>" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
							<%}
								 for(int i=startPage;i<=endPage;i++){ %>
									<li class="page-item"><a class="page-link" href="<%=request.getRequestURL()%>?pageNum=<%=i%>"><%=i %></a></li>
								<%} %>
				    
					<% if(endPage<pageCount){ %>
					    <li class="page-item">
					      <a class="page-link" href="./NoticeList.jsp?pageNum=<%=startPage+pageBlock%>" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
							<%} %>
					<%}%>
						</ul>
					</nav>
			</div>
			<input type="button" value="등록" onclick="location.href='./NoticeInsertForm.jsp';"/>
		</div>
	</div>
</body>
</html>