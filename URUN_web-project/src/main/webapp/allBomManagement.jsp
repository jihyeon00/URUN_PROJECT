<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 BOM 관리</title>
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
						<a class="search" href="javascript: searchText();" 
						style="border: 1px solid #999; padding: 5px; border-radius: 5px; background-color: white;">검색</a>
					</div>
				</div>
			</div>
			<br>
		</div>
				<!-- 조회 테이블 -->
		<div class="inventorySelect allBomManagement">
		<table>
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 15%" />
					<col style="width: 47%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 8%" />
				</colgroup>
				<thead>
					<tr>
						<th>제품ID</th>
						<th>제품명</th>
						<th>자재명</th>
						<th>컬러</th>
						<th>사이즈</th>
						<th>11</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>10000000</td>
						<td>NBPZDF702B</td>
						<td>3asdasdasd</td>
						<td>WHITE</td>
						<td>250</td>
						<td>11111</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		
		</div>

<script>
	function searchText() {
		location.href = "./itemInventorySelect.jsp?search=" + $('#search-text').val();
	}
</script>
</body>
</html>