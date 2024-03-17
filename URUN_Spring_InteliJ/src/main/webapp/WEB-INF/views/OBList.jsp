<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/IBSelect.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script defer src="./js/jquery-3.7.1.min.js"></script>
    <script src="./js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <title>URUN-출고 현황</title>
</head>
<body>
<%
String OBWhere = request.getParameter("OBWhere");
if (OBWhere == null) {
	OBWhere = "";
}
%>
<%@ include file="./include/sidebar.jsp" %>
<div class="container-OB">
		<div class="title">
			<h1>|  출고 현황</h1>
	    </div>
		<div class="container container-OB-Select">
			<div class="OB-Select-menu">
				<div class="Select-menu">
					<!-- 출고 진행상태 조회 조건 내용 저장 공간 -->
					<input type="hidden" name="OBWhere" id="OBWhere"  value="">
					<!-- 출고 진행상태 조회 조건 선택 버튼 -->
					<div class="Select-item">
						<input id="btn-Select" type="button" value='전체 ( <c:out value="${OBAllCount}" /> )' class="btn-Select" onClick="javascript: allOBClick();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value='출고예정 ( <c:out value="${ExpectedCount}" /> )' class="btn-Select" onClick="javascript: OBExpected();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value='출고진행중 ( <c:out value="${ProceedingCount}" /> )' class="btn-Select" onClick="javascript: OBProceeding();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value='출고완료 ( <c:out value="${completedCount}" /> )' class="btn-Select" onClick="javascript: OBCompleted();"/>
					</div>
					<!-- 입고 등록 버튼 -->
                    <button style="cursor: pointer; border: 1px solid #999;"
                        name="OBInsert" class="btn btn-light" type="button"
                        data-bs-toggle="modal" data-bs-target="#OBInsertModal"
                        onClick="" >출고 등록</button>
				</div>
			</div>
			<div class="OB-Select">
				<table class="OB-Select-view">
					<tr>
						<td class="OB-Select-view-menu">진행상태</td>
						<td class="OB-Select-view-menu">출고번호</td>
						<td class="OB-Select-view-menu">업체명</td>
						<td class="OB-Select-view-menu">제품명</td>
						<td class="OB-Select-view-menu">제품코드</td>
						<td class="OB-Select-view-menu">납품수량</td>
						<td class="OB-Select-view-menu">납품예정일</td>
						<td class="OB-Select-view-menu">납품완료일</td>
						<td class="OB-Select-view-menu">수정</td>
					</tr>
                    <c:forEach var="OB" items="${OBList}">
                        <tr>
                            <!-- 출고 현황 조회 내용 -->
                            <td><c:out value="${OB.OB_Status}"/></td>
                            <td><c:out value="${OB.OB_ID}"/></td>
                            <td><c:out value="${OB.COMPANY_NAME}"/></td>
                            <td><c:out value="${OB.ITEM_NAME}"/></td>
                            <td><c:out value="${OB.OB_ITEM_ID}"/></td>
                            <td><c:out value="${OB.OB_Quantity}"/></td>
                            <td><c:out value="${OB.OB_Expected_Date}"/></td>
                            <td><c:out value="${OB.OB_Complete_Date}"/></td>
                            <td>
                                <!-- 출고 수정 버튼 -->
                                <button style="cursor: pointer; border: 1px solid #999;"
                                    name="OBModify" id='OBModify<c:out value="${OB.OB_ID}"/>' class="btn btn-light" type="button"
                                    data-bs-toggle="modal" data-bs-target="#OBUpdateModal"
                                    data-IB_ID='<c:out value="${OB.OB_ID}"/>' value='<c:out value="${OB.OB_ID}"/>'
                                    onClick='OBUpdates(<c:out value="${OB.OB_ID}"/>)' >수정</button>
                            </td>
                        </tr>
                    </c:forEach>
				</table>
			</div>
		</div>
	</div>

	<!-- 등록 Modal -->
    <div class="modal fade" id="OBInsertModal" tabindex="-1"
        aria-labelledby="OBInsertModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="OBInsertModalLabel" style="font-size: 20px;" >출고 등록</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/OBInsert" method="post" id="form-OB-INSERT" onSubmit="return false">
                   <div class="modal-body">
                        <div class="write">
                            <div class="OB-Insert">
                                <div class="OB-name">납품처ID</div>
                                <div>
                                    <select name="OB_Company_ID_" id="OB_Company_ID_" class="form-control">
                                        <option selected>공급처 선택</option>
                                        <c:forEach var="OB" items = "${OBCompanyList}">
                                            <option value='<c:out value="${OB.COMPANY_ID}"/>'><c:out value="${OB.COMPANY_NAME}"/>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="OB-Insert">
                                <div class="OB-name">제품ID</div>
                                <div>
                                    <select name="OB_ITEM_ID_" id="OB_ITEM_ID_" class="form-control">
                                        <option selected>제품 선택</option>
                                        <c:forEach var="OB" items = "${OBItemList}">
                                            <option value='<c:out value="${OB.ITEM_ID}" />'><c:out value="${OB.ITEM_NAME}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="OB-Insert">
                                <div class="OB-name">납품수량</div>
                                <div><input type="text" name="OB_Quantity_" id="OB_Quantity_" placeholder="납품수량" autocomplete="off" required></div>
                            </div>
                            <div class="OB-Insert">
                                <div class="OB-name">납품예정날짜</div>
                                <div><input class="OB-name-date" type="date" name="OB_Expected_Date_" id="OB_Expected_Date_" autocomplete="off" required></div>
                            </div>
                            <!-- <div class="OB-Insert">
                                <input id="btn-insert" type="submit" value="등록" class="btn btn-light" onClick="javascript: OBInsert();" style="width: 100px; height: 40px; border: 1px solid #999; font-size: 18px;">
                            </div> -->
                        </div>
                   </div>
                </form>
                <div class="modal-footer">
                    <button id="modalSubmit" type="submit" class="btn btn-primary" onClick="javascript: OBInsert();">등록</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>



    <!-- update Modal -->
    <div class="modal fade" id="OBUpdateModal" tabindex="-1"
        aria-labelledby="OBUpdateModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="OBUpdateModalLabel" style="font-size: 20px;" >입고 수정</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action='/OBUpdate' method="post" id="form-OB-Update" onSubmit="return false">
                    <input type="hidden" name="OB_ID" id="OB_ID">
                    <div class="modal-body">
                        <div class="write-OB-update">
                            <div class="OB-Update">
                                <div class="OB-name">공급처ID</div>
                                <div><input type="text" name="OB_Company_ID" id='OB_Company_ID<c:out value="${OBSelectOne.OB_ID}" />'
                                    value='<c:out value="${OBSelectOne.OB_Company_ID}" />' autocomplete="off" required disabled></div>
                            </div>
                            <div class="OB-Update">
                                <div class="OB-name">제품ID</div>
                                <div><input type="text" name="OB_ITEM_ID" id='OB_ITEM_ID<c:out value="${OBSelectOne.OB_ID}" />'
                                    value='<c:out value="${OBSelectOne.OB_ITEM_ID}" />' autocomplete="off" required disabled></div>
                            </div>
                            <div class="OB-Update">
                                <div class="OB-name">공급수량</div>
                                <div><input type="text" name="OB_Quantity" id='OB_Quantity<c:out value="${OBSelectOne.OB_ID}" />'
                                    value='<c:out value="${OBSelectOne.OB_Quantity}" />' autocomplete="off" required disabled></div>
                            </div>
                            <div class="OB-Update">
                                <div class="OB-name">진행상태</div>
                                <select class="OB-Status-name" name="OB_Status" id='OB_Status<c:out value="${OBSelectOne.OB_ID}" />' >
                                    <option value='<c:out value="${OBSelectOne.OB_Status}" />'><c:out value="${OBSelectOne.OB_Status}" /></option>
                                    <option value="출고예정">출고예정</option>
                                    <option value="출고진행중">출고진행중</option>
                                    <option value="출고완료">출고완료</option>
                                </select>
                            </div>
                            <div class="OB-Update">
                                <div class="OB-name">출고예정날짜</div>
                                <div><input type="text" name="OB_Expected_Date" id='OB_Expected_Date<c:out value="${OBSelectOne.OB_ID}" />'
                                    value='<c:out value="${OBSelectOne.OB_Expected_Date}" />' autocomplete="off" required disabled></div>
                            </div>
                            <div class="OB-Update">
                                <div class="OB-name">출고완료날짜</div>
                                <div><input class="OB-name-date" type="date" name='OB_Complete_Date_date'
                                    id="OB_Complete_Date_date" value='<c:out value="${OBSelectOne.OB_Complete_Date}" />' autocomplete="off"></div>
                            </div>
                            <div class="OB-Update">
                                <div class="OB-name">출고완료시간</div>
                                <div><input class="OB-name-date" type="time" name="OB_Complete_Date_time"
                                    id="OB_Complete_Date_time" autocomplete="off"></div>
                            </div>
                            <div class="OB-Update">
                                <div class="OB-name">비고</div>
                                <div><input class="OB-Update-Note" type="text" name="OB_Note" id='OB_Note<c:out value="${OBSelectOne.OB_ID}" />'
                                    value='<c:out value="${OBSelectOne.OB_Note}" />'></div>
                            </div>
                            <!-- <div class="OB-Update">
                                <input id="btn-insert" type="submit" value="수정" class="btn btn-light"
                                    onClick="javascript: prevCheckTextBox();"
                                    style="width: 100px; height: 40px; border: 1px solid #999; font-size: 18px;">
                            </div> -->
                        </div>
                    </div>
                </form>
                <div class="modal-footer">
                    <button id="modalSubmit" type="submit" class="btn btn-primary" onClick="javascript: prevCheckTextBox();">수정</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>



<script>
    function OBUpdates(OB_ID) {
            $.get("/obrest/"+OB_ID , function(result) {
                console.log("obUpdate:", result);

                $('#OB_ID').val(result.ob_ID);
                $('#OB_Company_ID').val(result.ob_Company_ID);
                $('#OB_ITEM_ID').val(result.ob_ITEM_ID);
                $('#OB_Quantity').val(result.ob_Quantity);
                $('#OB_Status').val(result.ob_Status);
                $('#OB_Expected_Date').val(result.ob_Expected_Date);
                $('#OB_Complete_Date_date').val(result.ob_Complete_Date_date);
                $('#OB_Complete_Date_time').val(result.ob_Complete_Date_time);
                $('#OB_Note').val(result.ob_Note);

            }).fail(function(xhr, status, err){
                console.log("obUpdate err:", err);
            });
        }



	// 확인창
    function OBInsert() {
        if (confirm('등록하시겠습니까?')) {
            document.getElementById('form-OB-INSERT').submit();
        } else {
            return false;
        }
    }
    function prevCheckTextBox() {
        if (confirm('수정하시겠습니까?')) {
            document.getElementById('form-OB-Update').submit();
        } else {
             return false;
        }
    }
    const insertSuccessCount2 = '<c:out value="${insertSuccessCount2}" />'
    if(insertSuccessCount2) {
        alert('글이 성공적으로 등록되었습니다.');
    }
    const deleteSuccessCount = '<c:out value="${deleteSuccessCount}" />'
    if(deleteSuccessCount) {
        alert('글이 성공적으로 삭제되었습니다.');
    }
    const updateSuccessCount = '<c:out value="${updateSuccessCount}" />'
    if(updateSuccessCount) {
        alert('글이 성공적으로 수정되었습니다.');
    }

	// 입고 진행상태 조회 조건 입력 및 실행
   	function allOBClick() {
		location.href = "/OBList";
   	}
   	function OBExpected() {
		document.getElementById("OBWhere").value='출고예정';
		location.href = "/OBList?OBWhere=" + $('#OBWhere').val();
	}
   	function OBProceeding() {
   		document.getElementById("OBWhere").value='출고진행중';
   		location.href = "/OBList?OBWhere=" + $('#OBWhere').val();
	}
   	function OBCompleted() {
   		document.getElementById("OBWhere").value='출고완료';
   		location.href = "/OBList?OBWhere=" + $('#OBWhere').val();
	}
</script>
</body>
</html>