<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 BOM 관리</title>
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/main.css">
<script src="./js/jquery-3.7.1.min.js"></script>
<script src="./js/main.js"></script>
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
	
	String exception = request.getParameter("exception");
	
	int bomNum = Integer.parseInt(request.getParameter("bomNum"));
	
	BomDAO bDAO = new BomDAO();
	List<BomDTO> listAllBom = bDAO.selectAllBom(searchText);
	List<BomDTO> listOneBom = bDAO.selectOneBom(bomNum, searchText);

%>

<!-- 메인화면 -->
	<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> <span
				style="font-weight: 800;">상세 BOM 관리</span>
		</div>
		<div class="searchBox">
			<div class="searchBoxDiv">
				<div class="searchDetail">
					<div>
						<input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요." value="<%= searchText %>">
						<a class="search" id="button" href="javascript: searchText();">검색</a>
						<a></a>
					</div>
				</div>
			</div>
			<br>
		</div>
		<!-- 조회 테이블 -->
		<div class="selectTable">
			<table>
					<colgroup>
						<col style="width: 8%" />
						<col style="width: 15%" />
						<col style="width: 47%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>자재코드</th>
							<th>자재명</th>
							<th>용도</th>
							<th>수량</th>
							<th>   </th>
						</tr>
					</thead>
					<tbody>
					<%for(int i=0;i<listOneBom.size();i++) {%>
						<tr>
							<td><%=listOneBom.get(i).getROWNUM() %></td>
							<td><%=listOneBom.get(i).getMATERIAL_ID() %></td>
							<td><%=listOneBom.get(i).getMATERIAL_NAME()%></td>
							<td><%=listOneBom.get(i).getMATERIAL_USES() %></td>
							<td><%=listOneBom.get(i).getBOM_MATERIAL_QUANTITY() %></td>
							<td><a id="button" href="javascript: materialDelete(<%=listOneBom.get(i).getMATERIAL_ID()%>)">삭제</a></td>
						</tr>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>
<script>
	function searchText() {
		var url = document.location.href;
		location.href = url+ "&search=" + $('#search-text').val();
	}
	function materialDelete(deleteMaterialNum) {
		if (confirm('정말 삭제하시겠습니까?')) {
			location.href = "./deleteOneBomMaterial.jsp?bomNum="+<%=bomNum%>+"&deleteMaterialNum="+ deleteMaterialNum;
		}
	}
	
</script>
</body>
</html>