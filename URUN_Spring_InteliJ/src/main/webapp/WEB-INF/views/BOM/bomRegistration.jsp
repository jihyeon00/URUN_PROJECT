<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOM 등록</title>
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/main.css">
<script src="./js/jquery-3.7.1.min.js"></script>
<script src="./js/main.js"></script>
</head>
<body>
<%@ page import="util.DBManager"%>
<%@ page import="dao.BomDAO"%>
<%@page import="dto.BomDTO"%>
<%@ include file="./sidebar.jsp"%>
<% request.setCharacterEncoding("UTF-8");%>

<%
	String searchText = request.getParameter("search");
	
	if (searchText == null) {
		searchText="10000001";
	}
	
	BomDAO bDAO = new BomDAO();
	List<BomDTO> listMaterial = bDAO.selectMaterial();
	List<BomDTO> listOneItemBom = bDAO.selectOneItemBom(searchText);
	

%>

<!-- 메인화면 -->
	<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> 
			<span style="font-weight: 800;">BOM 등록</span>
		</div>
			<div class="searchItem">
				<span style="font-size: 18px; margin-right: 10px; font-weight: 500;">제품ID</span>
				<input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요." value="<%= searchText %>">
				<a class="search" id="button" class="bomSearchBtn" href="javascript: searchText();" style="font-size: 18px; border: 1px solid #999; border-radius: 6px; padding: 7px 15px;">검색</a>
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
					<%for(int i=0;i<listOneItemBom.size();i++) {%>
							<tr>
								<td><%=listOneItemBom.get(i).getROWNUM() %></td>
								<td><%=listOneItemBom.get(i).getMATERIAL_ID() %></td>
								<td><%=listOneItemBom.get(i).getMATERIAL_NAME()%></td>
								<td><%=listOneItemBom.get(i).getMATERIAL_USES() %></td>
								<td><%=listOneItemBom.get(i).getBOM_MATERIAL_QUANTITY() %></td>
								<td><a id="button" href="javascript: materialDelete(<%=listOneItemBom.get(i).getMATERIAL_ID()%>)">삭제</a></td>
							</tr>
					<%} %>
					</tbody>
				</table>
		</div>
		
		
		<!-- 추가 테이블 -->
			<!--
			<div class="searchItem" style="margin-bottom: -20px;">
				<span style="font-size: 18px; margin-right: 10px; font-weight: 500;">자재명</span>
				<input type="search" style=""name="search-text" id="search-text" placeholder="검색어를 입력하세요." value="<%= searchText %>">
				<input type="button" class="searchMaterialBtn" id="button" value="검색">
			</div>
			-->
		<div class="selectTable">
			<table>
					<colgroup>
						<col style="width: 20%" />
						<col style="width: 50%" />
						<col style="width: 20%" />
						<col style="width: 10%" />
					</colgroup>
					<thead>
						<tr>
							<th>자재코드</th>
							<th>자재명</th>
							<th>용도</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
					<%for(int i=0;i<listMaterial.size();i++) {%>
						<tr>
							<td><%=listMaterial.get(i).getMATERIAL_ID()%></td>
							<td><%=listMaterial.get(i).getMATERIAL_NAME()%></td>
							<td><%=listMaterial.get(i).getMATERIAL_USES()%></td>
							<td><a id="button" href="javascript: materialInsert(<%=listMaterial.get(i).getMATERIAL_ID()%>)">추가</a></td>
						</tr>
					<%} %>
					</tbody>
				</table>
		</div>
	</div>
<script>
function searchText(){
	if($('#search-text').val()==""){
		alert('제품명 혹은 제품ID를 정확히 입력해주세요.');
	} else{
		var url = document.location.href;
		location.href = "./bomRegistration.jsp?search=" + $('#search-text').val();
	}
}
function materialDelete(deleteMaterialNum) {
	if (confirm('정말 삭제하시겠습니까?')) {
		location.href = "./deleteOneMaterial.jsp?bomNum="+<%=searchText%>+"&deleteMaterialNum="+ deleteMaterialNum;
	}
}
function materialInsert(insertMaterialNum) {
	var str1 = prompt("필요 자재수량을 입력해주세요","");
	if (str1 == null) return false; 

	var quantity = Number(str1);
	location.href = "./insertOneBomMaterial.jsp?bomNum="+<%=searchText%>+"&quantity="+ quantity +"&insertMaterialNum="+ insertMaterialNum;
}

</script>
</body>
</html>