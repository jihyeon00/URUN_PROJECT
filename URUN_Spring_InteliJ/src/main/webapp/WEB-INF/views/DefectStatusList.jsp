<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/IBSelect.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script defer src="/resources/js/jquery-3.7.1.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <title>URUN-생산불량현황</title>
</head>
<body>
<jsp:include page="./include/sidebar.jsp">
 <jsp:param name="MEMBER_ID" value="${selectMemberInfo.MEMBER_ID}" />
 <jsp:param name="EMPLOYEE_NAME" value="${selectMemberInfo.EMPLOYEE_NAME}" />
</jsp:include>
<div class="container-status">
		<div class="title">
			<h1><a href="/DefectStatusList">|  생산 불량 현황</a></h1>
	    </div>
		<div class="container container-status">
			<!-- 검색메뉴 -->
			<div class="status-Select-menu">
				<form action="" id="form-status" onSubmit="return false">
					<div class="Select-menu">
						<div class="Select-item">
							<div class="status-name">제품명</div>
							<div><input type="text" placeholder="제품명을 입력하세요"
							    value='<c:out value="${criteria.search_ITEM_NAME}"/>'
							    name="search_ITEM_NAME" id="search_ITEM_NAME" autocomplete="off" ></div>
						</div>
						<div class="Select-item">
							<div class="status-Date-name">생산시작날짜</div>
							<div><input class="status-name-date" type="date"name="search_START_DATE1"
							    id="search_START_DATE1" autocomplete="off" value='<c:out value="${criteria.search_START_DATE1}"/>'></div>
							<div> ~ </div>
							<div><input class="status-name-date" type="date"name="search_START_DATE2"
							    id="search_START_DATE2" autocomplete="off" value='<c:out value="${criteria.search_START_DATE2}"/>'></div>
						</div>
						<div class="Select-item">
							<div class="status-name">제품코드</div>
							<div><input type="text" placeholder="제품코드를 입력하세요"
							    value='<c:out value="${criteria.search_ITEM_ID}"/>'
							    name="search_ITEM_ID" id="search_ITEM_ID" autocomplete="off" ></div>
						</div>
						<div class="Select-item">
							<div class="status-Date-name">생산종료날짜</div>
							<div><input class="status-name-date" type="date"name="search_END_DATE1"
							    id="search_END_DATE1" autocomplete="off" value='<c:out value="${criteria.search_END_DATE1}"/>'></div>
							<div> ~ </div>
							<div><input class="status-name-date" type="date"name="search_END_DATE2"
							    id="search_END_DATE2" autocomplete="off" value='<c:out value="${criteria.search_END_DATE2}"/>'></div>
						</div>
						<div class="Select-item">
							<div class="Select-item-btn"><input id="btn-insert" type="submit" value="검색"
							    class="btn btn-light" onClick="javascript: search();"
							    style="width: 100px; height: 40px; border: 1px solid #999; font-size: 20px;"></div>
						</div>
					</div>
				</form>
			</div>
			<!-- 검색내용 -->
			<div class="status-Select">
				<table class="status-Select-view">
					<tr>
						<td class="statu-Select-view-menu">진행상태</td>
						<td class="statu-Select-view-menu">제품명</td>
						<td class="statu-Select-view-menu">제품코드</td>
						<td class="statu-Select-view-menu">계획수량</td>
						<td class="statu-Select-view-menu">생산수량</td>
						<td class="statu-Select-view-menu">불량수량</td>
						<td class="statu-Select-view-menu">불량률</td>
						<td class="statu-Select-view-menu">생산시작날짜</td>
						<td class="statu-Select-view-menu">생산종료날짜</td>
					</tr>
                    <c:forEach items="${getStatusList}" var="status">
                        <tr>
                            <!-- 생산불량현황 조회 내용 -->
                            <td><c:out value="${status.PROCESS_Status}" /></td>
                            <td><c:out value="${status.ITEM_NAME}" /></td>
                            <td><c:out value="${status.PROCESS_ITEM_ID}" /></td>
                            <td><c:out value="${status.PROCESS_Plan_Quantity}" /></td>
                            <td><c:out value="${status.WORK_Item_Quantity}" /></td>
                            <td><c:out value="${status.WORK_Defective_Quantity}" /></td>
                            <td><c:out value="${status.PROCESS_defect_rate}" /></td>
                            <td><c:out value="${status.PROCESS_START_DATE}" /></td>
                            <td><c:out value="${status.PROCESS_END_DATE}" /></td>
                        </tr>
                    </c:forEach>
				</table>
			</div>
		</div>
	</div>
<script>
	function search() {
		document.getElementById('form-status').submit();
	}
</script>
</body>
</html>