<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품재고조회</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script defer src="./js/jquery-3.7.1.min.js"></script>
<script src="./js/main.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
</head>
<body>
<%@ page import="util.DBManager"%>
<%@ page import="dao.InventoryDAO"%>
<%@page import="dto.InventoryDTO"%>
<%@ include file="./sidebar.jsp"%>
<% request.setCharacterEncoding("UTF-8");%>

<%

	String searchText = request.getParameter("search");

	if (searchText == null) {
		searchText = "";
	}
	
	InventoryDAO iDao = new InventoryDAO();
	
	int totalCnt = iDao.getTotalItem(searchText);
	int pageSize = 10 ;
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int pageCnt = currentPage * pageSize;
	
	List<InventoryDTO> listInventory = iDao.selectItem(searchText, startRow, pageCnt);
%>
	<!-- 메인화면 -->
	<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> <span
				style="font-weight: 800;"> 제품 재고 조회</span>
		</div>
		<div class="searchBox">
			<div class="searchBoxDiv">
				<div class="searchDetail">
					<div>
						<input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요." value="<%= searchText %>">
						<a class="search" id="button" href="javascript: searchText();">검색</a>
					</div>
				</div>
			</div>
			<br>
		</div>

		
		<!-- 조회 테이블 -->
		<div class="selectTable">
		<table>
				<colgroup>
					<col style="width: 25%" />
					<col style="width: 25%" />
					<col style="width: 20%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
				</colgroup>
				<thead>
					<tr>
						<th>제품ID</th>
						<th>제품명</th>
						<th>컬러</th>
						<th>사이즈</th>
						<th>재고수량</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i=0;i<listInventory.size();i++) {%>
					<tr>
						<td><%=listInventory.get(i).getITEM_ID()%></td>
						<td><%=listInventory.get(i).getITEM_NAME()%></td>
						<td><%=listInventory.get(i).getITEM_COLOR()%></td>
						<td><%=listInventory.get(i).getITEM_SIZE()%></td>
						<td><%=listInventory.get(i).getSumINVENTORY()%></td>
					</tr>
				<%} %>
				</tbody>
			</table>
		</div>
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
						      <a class="page-link" href="./itemInventorySelect.jsp?search=<%=searchText%>&pageNum=<%=startPage-pageBlock%>" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
							<%}
								 for(int i=startPage;i<=endPage;i++){ %>
									<li class="page-item"><a class="page-link" href="<%=request.getRequestURL()%>?search=<%=searchText%>&pageNum=<%=i%>"><%=i %></a></li>
								<%} %>
				    
					<% if(endPage<pageCount){ %>
			    <li class="page-item">
			      <a class="page-link" href="./itemInventorySelect.jsp?search=<%=searchText%>&pageNum=<%=startPage+pageBlock%>" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
					<%} %>
			<%}%>
							</ul>
						</nav>
			
			
		</div>
	</div>
<script>
	function searchText() {
		location.href = "./itemInventorySelect.jsp?search=" + $('#search-text').val();
	}
	
</script>	
</body>
</html>