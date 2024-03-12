<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 BOM 관리</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/js/main.js"></script>
</head>
<body>
<%@ include file="./include/sidebar.jsp"%>
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
						<input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요." value='<c:out value="${searchText}" />'>
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
					<c:forEach items="${selectOneBom}" var="listOneBom">
						<tr>
							<td><c:out value="${listOneBom.ROWNUM}" /></td>
							<td><c:out value="${listOneBom.MATERIAL_ID}" /></td>
							<td><c:out value="${listOneBom.MATERIAL_NAME}" /></td>
							<td><c:out value="${listOneBom.MATERIAL_USES}" /></td>
							<td><c:out value="${listOneBom.BOM_MATERIAL_QUANTITY}" /></td>
							<td><a id="button" href="javascript: materialDelete(<c:out value="${listOneBom.MATERIAL_ID}" />)">삭제</a></td>
						</tr>
					</c:forEach>
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
			location.href = "./deleteOneBomMaterial?bomNum="<c:out value='${bomNum}'/>+"&deleteMaterialNum="+ deleteMaterialNum;
		}
	}
	
</script>
</body>
</html>