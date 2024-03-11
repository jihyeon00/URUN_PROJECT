<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<%@ include file="../include/sidebar.jsp"%>
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
						<input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요." value='<c:out value="${searchText}" />'>
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
				<c:forEach items="${selectAllBom}" var="listAllBom">
					<tr>
						<td><c:out value="${listAllBom.BOM_ID}" /></td>
						<td><c:out value="${listAllBom.BOM_ITEM_ID}" /></td>
						<td><c:out value="${listAllBom.ITEM_NAME}" /></td>
						<td><a style="color:black;" href='./oneBomManagement?bomNum=<c:out value="${listAllBom.BOM_ID}" />'><c:out value="${listAllBom.MaterialNameList}" /></a></td>
						<td><c:out value="${listAllBom.ITEM_COLOR}" /></td>
						<td><c:out value="${listAllBom.ITEM_SIZE}" /></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		
		</div>

<script>
	function searchText() {
		location.href = "./allBomManagement?search=" + $('#search-text').val();
	}
</script>
</body>
</html>