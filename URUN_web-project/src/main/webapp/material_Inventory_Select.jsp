<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/main.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script defer src="./js/jquery-3.7.1.min.js"></script>
    <script src="./js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
<%@ page import="util.DBManager" %>
<%@ include file="./sidebar.jsp" %>
	<!-- 메인화면 -->
	<div class="wrap">
	  <div class="title">
			<span style="font-weight: 800;">| </span>
			<span style="font-weight: 800;"> 제품 재고 조회</span>
		</div>
		<div class="searchBox">
			<div class="searchBoxDiv">
				<div class="searchDetail" style="margin-left: 10px;">
					<div id="searchName">출고일자</div>
					<div>
						<input type="date" name="OB_startDate" id="OB_startDate" max="9999-12-31">
						 ~ 
						<input type="date" name="OB_endDate" id="OB_endDate" max="9999-12-31">
					</div>
				</div>
			</div>
			<div class="searchBoxDiv">
				<div class="searchDetail">
					<div id="searchName">제품명</div>
					<div><input type="text" name="itemName" id="itemName"/></div>
				</div>
				<div class="searchDetail">
					<div id="searchName">제품코드</div>
					<div><input type="text" name="itemId" id="itemId"/></div>
				</div>
				<div class="searchDetail">
					<div id="searchName">업체명</div>
					<div><input type="text" name="companyName" id="companyName"/></div>
				</div>
				<div class="searchDetail">
					<div id="searchName">업체코드</div>
					<div><input type="text" name="companyId" id="companyId"/></div>
				</div>
				<div class="searchDetail">
					  <input type="submit" id="searchButton" value="검색" onClick=""/>
				</div>
			</div>
			<br>
		</div>
		
		<!-- 조회 테이블 -->
		<div class="inventorySelect">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>납품예정일</th>
						<th>납품완료일</th>
						<th>납품업체명</th>
						<th>업체ID</th>
						<th>제품명</th>
						<th>제품ID</th>
						<th>컬러</th>
						<th>사이즈</th>
						<th>납품수량</th>
						<th>현재수량</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
				
				
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>	
	  </div>      	
	</div>
</body>
</html>