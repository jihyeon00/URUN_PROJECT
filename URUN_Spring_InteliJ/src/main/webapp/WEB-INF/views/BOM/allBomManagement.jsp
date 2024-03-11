<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 BOM 관리</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/js/main.js"></script>
</head>
<body>
<%@ page import="util.DBManager"%>
<%@ page import="dao.BomDAO"%>
<%@ page import="dto.BomDTO"%>
<%@ include file="./sidebar.jsp"%>
<% request.setCharacterEncoding("UTF-8");%>

<%

	String searchText = request.getParameter("search");
	

	if (searchText == null) {
		searchText = "";
	}
	
	String cp = request.getContextPath();
	
	BomDAO bDAO = new BomDAO();
	List<BomDTO> listAllBom = bDAO.selectAllBom(searchText);
	
%>

<!-- 메인화면 -->
	<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> <span
				style="font-weight: 800;">전체 BOM 관리</span>
		</div>
		<div class="searchBox">
			<div class="searchBoxDiv">
				<div class="searchDetail">
					<div>
						<input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요." value="<%= searchText %>">
						<a class="search" id="button" href="javascript: searchText();" >검색</a>
					</div>
				</div>
			</div>
			<br>
		</div>
				<!-- 조회 테이블 -->
		<div class="selectTable">
		<table>
				<colgroup>
					<col style="width: 5%" />
					<col style="width: 10%" />
					<col style="width: 14%" />
					<col style="width: 55%" />
					<col style="width: 8%" />
					<col style="width: 8%" />
				</colgroup>
				<thead>
					<tr>
						<th>BOMID</th>
						<th>제품ID</th>
						<th>제품명</th>
						<th>자재명</th>
						<th>컬러</th>
						<th>사이즈</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i=0;i<listAllBom.size();i++) {%>
					<tr>
						<td><%=listAllBom.get(i).getBOM_ID()%></td>
						<td><%=listAllBom.get(i).getBOM_ITEM_ID()%></td>
						<td><%=listAllBom.get(i).getITEM_NAME()%></td>
						<td><a style="color:black;" href="./oneBomManagement.jsp?bomNum=<%=listAllBom.get(i).getBOM_ID()%>"><%=listAllBom.get(i).getMaterialNameList()%></a></td>
						<td><%=listAllBom.get(i).getITEM_COLOR()%></td>
						<td><%=listAllBom.get(i).getITEM_SIZE()%></td>
					</tr>
				<%} %>
				</tbody>
			</table>
		</div>
		
		
		</div>

<script>
	function searchText() {
		location.href = "./allBomManagement.jsp?search=" + $('#search-text').val();
	}
</script>
</body>
</html>