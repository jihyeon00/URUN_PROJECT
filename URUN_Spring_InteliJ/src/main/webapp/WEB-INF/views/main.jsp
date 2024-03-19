<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/main.css?after">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script defer src="/resources/js/jquery-3.7.1.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <title>URUN</title>
 
</head>
<body>
<jsp:include page="./include/sidebar.jsp">
 <jsp:param name="MEMBER_ID" value="${selectMemberInfo.MEMBER_ID}" />
 <jsp:param name="EMPLOYEE_NAME" value="${selectMemberInfo.EMPLOYEE_NAME}" />
</jsp:include>
	<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> 
			<span style="font-weight: 800;">공지사항</span>
		</div>
		<div class="selectTable" style="width: 70%;">
			<table>
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 40%" />
					<col style="width: 20%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${selectNoticeFetch}" var="selectNoticeFetch">
					<tr>
						<td><c:out value="${selectNoticeFetch.NOTICE_ID}"/></td>
						<td><a style="color:black;" href='./NoticeDetail.jsp?num=<c:out value="${selectNoticeFetch.NOTICE_ID}"/>'><c:out value="${selectNoticeFetch.NOTICE_TITLE}"/></a></td>
						<td><c:out value="${selectNoticeFetch.NOTICE_REGDATE}"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="title">
			<span style="font-weight: 800;">| </span> 
			<span style="font-weight: 800;">생산현황</span>
		</div>
		<div class="selectTable" id="statusList">
			<table>
				<colgroup>
					<col style="width: 15%" />
					<col style="width: 30%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
				</colgroup>
				<thead>
					<tr>
						<th>제품ID</th>
						<th>제품명</th>
						<th>총계획수량</th>
						<th>총생산수량</th>
						<th>총불량수량</th>
						<th>불량률</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${selectStatusList}" var="selectStatusList">
					<tr>
						<td><c:out value="${selectStatusList.PROCESS_ITEM_ID}"/></td>
						<td><c:out value="${selectStatusList.ITEM_NAME}"/></td>
						<td><c:out value="${selectStatusList.PROCESS_Plan_Quantity}"/></td>
						<td><c:out value="${selectStatusList.WORK_Item_Quantity}"/></td>
                        <td><c:out value="${selectStatusList.WORK_Defective_Quantity}"/></td>
                        <td><c:out value="${selectStatusList.PROCESS_defect_rate}"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>