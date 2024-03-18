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
    <title>URUN-생산작업관리</title>
</head>
<body>
<jsp:include page="./include/sidebar.jsp">
 <jsp:param name="MEMBER_ID" value="${selectMemberInfo.MEMBER_ID}" />
 <jsp:param name="EMPLOYEE_NAME" value="${selectMemberInfo.EMPLOYEE_NAME}" />
</jsp:include>
<div class="container-status">
		<div class="title">
			<h1><a href="/ProcessList">|  생산 작업 관리</a></h1>
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
			<div class="status-Select">
			    <c:forEach items="${getProcessList}" var="Process">
                    <div class="status-Select-b">
                        <div class="status-Select-case">
                            <form action="/PROCESS-Update" method="post" id='form-PROCESS-Update<c:out value="${Process.PROCESS_ID}" />' class="form-PROCESS" onSubmit="return false">
                                <input type="hidden" name="PROCESS_ID" id="PROCESS_ID">
                                <div class="status-Select-box">
                                    <div class="status-Select-name">
                                        <c:out value="${Process.ITEM_NAME}" />
                                    </div>
                                    <div class="status-Select-detail-box">
                                        <div class="status-Select-detail">제품코드</div>
                                        <div class="status-Select-detail"><c:out value="${Process.PROCESS_ITEM_ID}" /></div>
                                        <div class="status-Select-detail">진행상태</div>
                                        <div class="status-Select-detail">
                                            <select class="detail-box-option" name="PROCESS_Status" id='PROCESS_Status<c:out value="${Process.PROCESS_ID}" />'>
                                                <option value='<c:out value="${Process.PROCESS_Status}" />'><c:out value="${Process.PROCESS_Status}" /></option>
                                                <option value="승인대기중">승인대기중</option>
                                                <option value="승인">승인</option>
                                                <option value="생산중">생산중</option>
                                                <option value="생산중지">생산중지</option>
                                                <option value="생산완료">생산완료</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="status-Select-detail-box">
                                        <div class="status-Select-detail">생산라인</div>
                                        <div class="status-Select-detail"><c:out value="${Process.PROCESS_LINE}" /></div>
                                        <div class="status-Select-detail">계획수량</div>
                                        <div class="status-Select-detail"><c:out value="${Process.PROCESS_Plan_Quantity}" /></div>
                                    </div>
                                    <div class="status-Select-detail-box">
                                        <div class="status-Select-detail">총 생산수량</div>
                                        <div class="status-Select-detail"><c:out value="${Process.WORK_Item_Quantity}" /></div>
                                        <div class="status-Select-detail">총 불량수량</div>
                                        <div class="status-Select-detail"><c:out value="${Process.WORK_Defective_Quantity}" /></div>
                                    </div>
                                    <div class="status-Select-detail-box">
                                        <div class="status-Select-detail">생산시작날짜</div>
                                        <div class="status-Select-detail"><c:out value="${Process.PROCESS_START_DATE}" /></div>
                                        <div class="status-Select-detail">생산종료날짜</div>
                                        <div class="status-Select-detail">
                                        <input class="detail-box-date" type="date" name="PROCESS_END_DATE" id="PROCESS_END_DATE" autocomplete="off" value='<c:out value="${Process.PROCESS_END_DATE}" />'></div>
                                    </div>
                                    <div class="status-Select-btn">
                                        <div class="btn">
                                            <input id="btn-insert" type="submit" value="수정" class="btn btn-light"
                                                onClick='javascript: prevCheckTextBox(<c:out value="${Process.PROCESS_ID}" />);' />
                                        </div>
                                        <!-- 당일작업등록 버튼 -->
                                        <div class="btn">
                                            <input id="btn-insert" type="button" value="당일작업등록" class="btn btn-light"
                                                data-bs-toggle="modal" data-bs-target="#ProcessInsertModal" name="ProcessInsert"
                                                onClick='' />
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
			    </c:forEach>
			</div>
		</div>
	</div>

<!-- <div class="work-insert-box" id="work_Insert_box">

</div> -->
<!-- 등록 Modal -->
<div class="modal fade" id="ProcessInsertModal" tabindex="-1"
    aria-labelledby="ProcessInsertModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="ProcessInsertModalLabel" style="font-size: 20px;" >당일작업등록</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/WorkInsert" method="post" id="form-work-insert" onSubmit="return false">
               <div class="modal-body">
                   <div class="work-insert-case">
                       <div class="work-insert-detail">
                           <div class="detail-name">당일작업날짜입력</div>
                           <div><input class="detail-text" type="date" name="" id="" autocomplete="off"></div>
                       </div>
                       <div class="work-insert-detail">
                           <div class="detail-name">당일계획수량</div>
                           <div><input class="detail-text" type="text" name="" id="" autocomplete="off"></div>
                       </div>
                       <div class="work-insert-detail">
                           <div class="detail-name">당일생산수량</div>
                           <div><input class="detail-text" type="text" name="" id="" autocomplete="off"></div>
                       </div>
                       <div class="work-insert-detail">
                           <div class="detail-name">당일불량수량</div>
                           <div><input class="detail-text" type="text" name="" id="" autocomplete="off"></div>
                       </div>
                   </div>
               </div>
            </form>
            <div class="modal-footer">
                <button id="modalSubmit" type="submit" class="btn btn-primary" onClick="javascript: WorkInsert();">등록</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>



<script>
	
	function search() {
		document.getElementById('form-status').submit();
	}
	
	function prevCheckTextBox() {
		if (confirm('수정하시겠습니까?')) {
		    document.getElementById('form-PROCESS-Update').submit();
		} else {
			return false;
		}
	}
	function WorkInsert() {
        if (confirm('등록하시겠습니까?')) {
            document.getElementById('form-work-insert').submit();
        } else {
            return false;
        }
    }

</script>
</body>
</html>