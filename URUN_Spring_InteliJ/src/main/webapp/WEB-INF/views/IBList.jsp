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
    <title>URUN-입고 현황</title>
</head>
<body>
<%
// 진행상태 박스
String IBWhere = request.getParameter("IBWhere");
if (IBWhere == null) {
	IBWhere = "";
}
%>
<%@ include file="./include/sidebar.jsp" %>
<div class="container-IB">
		<div class="title">
			<h1>|  입고 현황</h1>
	    </div>

		<div class="container container-IB-Select">
			<div class="IB-Select-menu">
				<div class="Select-menu">
					<!-- 입고 진행상태 조회 조건 내용 저장 공간 -->
					<input type="hidden" name="IBWhere" id="IBWhere" value="">
					<!-- 입고 진행상태 조회 조건 선택 버튼 -->
					<div class="Select-item">
						<input id="btn-Select" type="button" value='전체( <c:out value="${IBallCount}" /> )' class="btn-Select" onClick="allIBClick();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value='입고요청( <c:out value="${RequestCount}" /> )' class="btn-Select" onClick="Request();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value='부분입고( <c:out value="${PartialIBCount}" /> )' class="btn-Select" onClick="PartialIB();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value='입고완료( <c:out value="${IBCount}" /> )' class="btn-Select" onClick="completedIB();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value='검수중( <c:out value="${UnderReviewIBCount}" /> )' class="btn-Select" onClick="UnderReview();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value='검수완료( <c:out value="${CompletedIBCount}" /> )' class="btn-Select" onClick="confirmed();"/>
					</div>
					<!-- 입고 등록 버튼 -->
                    <button style="cursor: pointer; border: 1px solid #999;"
                        name="IBInsert" class="btn btn-light" type="button"
                        data-bs-toggle="modal" data-bs-target="#IBInsertModal"
                        onClick="" >입고 등록</button>
				</div>
			</div>
			<div class="IB-Select">
				<table class="IB-Select-view">
					<tr>
						<td class="IB-Select-view-menu">진행상태</td>
						<td class="IB-Select-view-menu">입고번호</td>
						<td class="IB-Select-view-menu">업체명</td>
						<td class="IB-Select-view-menu">자재명</td>
						<td class="IB-Select-view-menu">입고예정일</td>
						<td class="IB-Select-view-menu">입고완료일</td>
						<td class="IB-Select-view-menu">입고수량</td>
						<td class="IB-Select-view-menu">검수수량</td>
						<td class="IB-Select-view-menu">불량수량</td>
						<td class="IB-Select-view-menu">불량률</td>
						<td class="IB-Select-view-menu">수정</td>
					</tr>
					<c:forEach var="IB" items="${IBList}">
                        <tr>
                            <!-- 입고 현황 조회 내용 -->
                            <td><c:out value="${IB.IB_Status}"/></td>
                            <td><c:out value="${IB.IB_ID}"/></td>
                            <td><c:out value="${IB.COMPANY_NAME}"/></td>
                            <td><c:out value="${IB.MATERIAL_NAME}"/></td>
                            <td><c:out value="${IB.IB_Expected_Date}"/></td>
                            <td><c:out value="${IB.IB_Complete_Date}"/></td>
                            <td><c:out value="${IB.IB_Quantity}"/></td>
                            <td><c:out value="${IB.IB_Test_Quantity}"/></td>
                            <td><c:out value="${IB.IB_Defective_Quantity}"/></td>
                            <td><c:out value="${IB.IB_defect_rate}"/></td>
                            <td>
                                <!-- 입고 수정 버튼 -->
                                <button style="cursor: pointer; border: 1px solid #999;" name="IBModify" id='IBModify<c:out value="${IB.IB_ID}"/>' class="btn btn-light" type="button"
                                    data-bs-toggle="modal" data-bs-target="#IBUpdateModal"
                                    data-IB_ID='<c:out value="${IB.IB_ID}"/>' value='<c:out value="${IB.IB_ID}"/>'
                                    onClick='IBUpdates(<c:out value="${IB.IB_ID}"/>)' >수정</button>
                            </td>
                        </tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

<!-- 등록 Modal -->
<div class="modal fade" id="IBInsertModal" tabindex="-1"
        aria-labelledby="IBInsertModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="IBInsertModalLabel">입고 등록</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="./IBInsert" method="post" id="form-IB-INSERT" onSubmit="return false">
                   <div class="modal-body">
                       <div class="write">
                           <div class="IB-Insert">
                               <div class="IB-name">공급처ID</div>
                               <div>
                                   <select name="IB_Company_ID_" id="IB_Company_ID_" class="form-control">
                                       <option selected>공급처 선택</option>
                                       <c:forEach var="IB" items = "${IBCompanyList}">
                                           <option value='<c:out value="${IB.COMPANY_ID}"/>'><c:out value="${IB.COMPANY_NAME}"/>
                                       </c:forEach>
                                   </select>
                               </div>
                           </div>
                           <div class="IB-Insert">
                               <div class="IB-name">자재ID</div>
                               <div>
                                   <select name="IB_MATERIAL_ID_" id="IB_MATERIAL_ID_" class="form-control">
                                       <option selected>자재 선택</option>
                                       <c:forEach var="IB" items = "${IBMaterialList}">
                                           <option value='<c:out value="${IB.MATERIAL_ID}" />'><c:out value="${IB.MATERIAL_NAME}"/></option>
                                       </c:forEach>
                                   </select>
                               </div>
                           </div>
                           <div class="IB-Insert">
                               <div class="IB-name">공급수량</div>
                               <div><input type="text" name="IB_Quantity_" id="IB_Quantity_" placeholder="공급수량" autocomplete="off" required></div>
                           </div>
                           <div class="IB-Insert">
                               <div class="IB-name">공급예정날짜</div>
                               <div><input class="IB-name-date" type="date" name="IB_Expected_Date_" id="IB_Expected_Date_" placeholder='날짜를 선택해주세요.' autocomplete="off" required></div>
                           </div>

                           <div class="IB-Insert">
                               <input id="btn-insert" type="submit" value="등록" class="btn btn-light" onClick="javascript: IBInsert();"">
                           </div>
                       </div>
                   </div>
                </form>
                <div class="modal-footer">
                    <button id="modalSubmit" type="submit" class="btn btn-primary" onClick="javascript: IBInsert();">등록</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>



	<!-- update Modal -->
    <div class="modal fade" id="IBUpdateModal" tabindex="-1"
        aria-labelledby="IBUpdateModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="IBUpdateModalLabel">입고 수정</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action='/IBUpdate' method="post" id="form-IB-Update" onSubmit="return false">
                    <input type="hidden" name="IB_ID" id="IB_ID">
                    <div class="modal-body">
                        <div class="write-IB-update">
                            <div class="IB-Update">
                                <div class="IB-name">공급처ID</div>
                                <div><input type="text" name="IB_Company_ID" id='IB_Company_ID<c:out value="${IBSelectOne.IB_ID}" />'
                                    value='<c:out value="${IBSelectOne.IB_Company_ID}" />' autocomplete="off" required disabled></div>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">자재ID</div>
                                <div><input type="text" name="IB_MATERIAL_ID" id='IB_MATERIAL_ID<c:out value="${IBSelectOne.IB_ID}" />'
                                    value='<c:out value="${IBSelectOne.IB_MATERIAL_ID}" />' autocomplete="off" required disabled></div>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">공급수량</div>
                                <div><input type="text" name="IB_Quantity" id='IB_Quantity<c:out value="${IBSelectOne.IB_ID}" />'
                                    value='<c:out value="${IBSelectOne.IB_Quantity}" />' autocomplete="off" required disabled></div>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">검수수량</div>
                                <div><input type="text" name="IB_Test_Quantity" id='IB_Test_Quantity'
                                    placeholder="검수수량" value='<c:out value="${IBSelectOne.IB_Test_Quantity}" />' autocomplete="off"></div>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">불량수량</div>
                                <div><input type="text" name="IB_Defective_Quantity" id='IB_Defective_Quantity<c:out value="${IBSelectOne.IB_ID}" />'
                                    placeholder="불량수량" value='<c:out value="${IBSelectOne.IB_Defective_Quantity}" />' autocomplete="off"></div>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">진행상태</div>
                                <select class="IB-Status-name" name="IB_Status" id='IB_Status<c:out value="${IBSelectOne.IB_ID}" />' >
                                    <option value='<c:out value="${IBSelectOne.IB_Status}" />'><c:out value="${IBSelectOne.IB_Status}" /></option>
                                    <option value="입고요청">입고요청</option>
                                    <option value="부분입고">부분입고</option>
                                    <option value="입고완료">입고완료</option>
                                    <option value="검수중">검수중</option>
                                    <option value="검수완료">검수완료</option>
                                </select>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">불량기록날짜</div>
                                <div><input class="IB-name-date" type="date" name="IB_Defective_Date" id='IB_Defective_Date<c:out value="${IBSelectOne.IB_ID}" />'
                                    placeholder="불량기록날짜" value='<c:out value="${IBSelectOne.IB_Defective_Date}" />' autocomplete="off"></div>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">입고예정날짜</div>
                                <div><input type="text" name="IB_Expected_Date" id='IB_Expected_Date<c:out value="${IBSelectOne.IB_ID}" />'
                                    value='<c:out value="${IBSelectOne.IB_Expected_Date}" />' autocomplete="off" required disabled></div>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">입고완료날짜</div>
                                <div><input class="IB-name-date" type="date" name='IB_Complete_Date_date'
                                    id="IB_Complete_Date_date" value='<c:out value="${IBSelectOne.IB_Complete_Date}" />' autocomplete="off"></div>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">입고완료시간</div>
                                <div><input class="IB-name-date" type="time" name="IB_Complete_Date_time"
                                    id="IB_Complete_Date_time" autocomplete="off"></div>
                            </div>
                            <div class="IB-Update">
                                <div class="IB-name">비고</div>
                                <div><input class="IB-Update-Note" type="text" name="IB_Note" id='IB_Note<c:out value="${IBSelectOne.IB_ID}" />'
                                    value='<c:out value="${IBSelectOne.IB_Note}" />'></div>
                            </div>
                            <div class="IB-Update">
                                <input id="btn-insert" type="submit" value="수정" class="btn btn-light"
                                    onClick="javascript: prevCheckTextBox();"
                                    style="width: 100px; height: 40px; border: 1px solid #999; font-size: 18px;">
                            </div>
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

    function IBUpdates(IB_ID) {
        $.get("/ibrest/"+IB_ID , function(result) {
            console.log("ibupdate:", result);

            $('#IB_ID').val(result.ib_ID);

            $('#IB_Company_ID').val(result.ib_Company_ID);
            $('#IB_MATERIAL_ID').val(result.ib_MATERIAL_ID);
            $('#IB_Quantity').val(result.ib_Quantity);
            $('#IB_Test_Quantity').val(result.ib_Test_Quantity);
            $('#IB_Defective_Quantity').val(result.ib_Defective_Quantity);
            $('#IB_Status').val(result.ib_Status);

            $('#IB_Defective_Date').val(result.ib_Defective_Date);

            $('#IB_Expected_Date').val(result.ib_Expected_Date);

            $('#IB_Complete_Date_date').val(result.ib_Complete_Date_date);
            $('#IB_Complete_Date_time').val(result.ib_Complete_Date_time);

            $('#IB_Note').val(result.ib_Note);
        }).fail(function(xhr, status, err){
            console.log("ibupdate err:", err);
        });
    }


	// 입고 진행상태 조회 조건 입력 및 실행
   	function allIBClick() {
		location.href = "/IBList";
   	}
   	function Request() {
		document.getElementById("IBWhere").value='입고요청';
		location.href = "/IBList?IBWhere=" + $('#IBWhere').val();
	}
   	function PartialIB() {
   		document.getElementById("IBWhere").value='부분입고';
   		location.href = "/IBList?IBWhere=" + $('#IBWhere').val();
	}
   	function completedIB() {
   		document.getElementById("IBWhere").value = '입고완료';
   		location.href = "/IBList?IBWhere=" + $('#IBWhere').val();
	}
   	function UnderReview() {
   		document.getElementById("IBWhere").value='검수중';
   		location.href = "/IBList?IBWhere=" + $('#IBWhere').val();
	}
   	function confirmed() {
   		document.getElementById("IBWhere").value='검수완료';
   		location.href = "/IBList?IBWhere=" + $('#IBWhere').val();
	}


	// 확인창
	function IBInsert() {
        if (confirm('등록하시겠습니까?')) {
            document.getElementById('form-IB-INSERT').submit();
        } else {
            return false;
        }
    }
    function prevCheckTextBox() {
        if (confirm('수정하시겠습니까?')) {
            document.getElementById('form-IB-Update').submit();
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

</script>
</body>
</html>