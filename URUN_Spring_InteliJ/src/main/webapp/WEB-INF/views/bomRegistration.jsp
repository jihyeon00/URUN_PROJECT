<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOM 등록</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/js/main.js"></script>
</head>
<body>
<%@page import="kr.co.urun.config.*"%>
<%@page import="kr.co.urun.dto.*"%>
<%@page import="kr.co.urun.mapper.*"%>
<%@ include file="./include/sidebar.jsp"%>
<% request.setCharacterEncoding("UTF-8");%>
<!-- 메인화면 -->
	<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> 
			<span style="font-weight: 800;">BOM 등록</span>
		</div>
			<div class="searchItem">
				<form id='searchForm' action='/bomRegistration' method='get'>
				    <span style="font-size: 18px; margin-right: 10px; font-weight: 500;">제품ID</span>
					<input type="search" name="searchText" id="searchText" placeholder="검색어를 입력하세요." value='<c:out value="${searchText}" />'>
					<input type="submit" class="search" id="button" value="검색"/>
			 	</form>
			</div>
		<!-- 조회 테이블 -->
   		<form action="/materialDelete" method="post" id="materialDeleteForm">
			<div class="selectTable">
				<input type="hidden" name="searchText" value='<c:out value="${searchText}" />'>
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
					<c:if test="${empty searchText}">
					    <tr>
                            <td colspan="6">현재 제품을 조회하지 않아 자재 리스트가 존재하지 않습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${!empty searchText}">
                        <c:if test="${fn:length(selectOneItemBom) == 0}">
                            <tr>
                                <td colspan="6">등록된 자재가 없습니다. 자재를 추가해주세요.</td>
                            </tr>
                        </c:if>
                    </c:if>
                    <c:if test="${searchText!= null}">
	                       <c:forEach items="${selectOneItemBom}" var="listOneItemBom">
	                           <tr>
	                               <td><c:out value="${listOneItemBom.ROWNUM}" /></td>
	                               <td><c:out value="${listOneItemBom.MATERIAL_ID}" /></td>
	                               <td><c:out value="${listOneItemBom.MATERIAL_NAME}" /></td>
	                               <td><c:out value="${listOneItemBom.MATERIAL_USES}" /></td>
	                               <td><c:out value="${listOneItemBom.BOM_MATERIAL_QUANTITY}" /></td>
	                               <td id="materialDelete"><button type="button" class="materialDeleteBtn<c:out value="${listOneItemBom.MATERIAL_ID}" />" 
	                               style="cursor: pointer; background-color: transparent; border:1px solid #999;"
	                               onclick='materialDelete(<c:out value="${listOneItemBom.MATERIAL_ID}" />)'>삭제</button>
	                           </tr>
	                       </c:forEach>
					</c:if>
                      
					</tbody>
				</table>
			</div>
		</form>
		<c:if test="${!empty searchText}">
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
					<c:forEach items="${selectMaterial}" var="listMaterial">
						<tr>
							<td><c:out value="${listMaterial.MATERIAL_ID}" /></td>
							<td><c:out value="${listMaterial.MATERIAL_NAME}" /></td>
							<td><c:out value="${listMaterial.MATERIAL_USES}" /></td>
							<td><a id="button" class="materialInsertBtn<c:out value="${listMaterial.MATERIAL_ID}" />" 
							onclick='materialInsert(<c:out value="${listMaterial.MATERIAL_ID}" />)' 
							style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#materialInsertModal">추가</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="materialInsertModal" tabindex="-1" aria-labelledby="materialInsertModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="materialInsertModalLabel">자재 추가</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	        <form action="/materialInsert" method="post" class="was-validated">
		      <div class="modal-body">
		        	<input type=hidden class="form-control" id='searchText' name="searchText" value='<c:out value="${searchText}" />' readonly="readonly" />
			        <div class="form-group">
			        	<label for="materialId">자재ID</label>
			        	<input type="text" class="form-control" id='MATERIAL_ID' name="MATERIAL_ID" readonly="readonly" />
			        </div>
			        <div class="form-group">
			        	<label for="materialId">자재명</label>
			        	<input type="text" class="form-control" id='MATERIAL_NAME' name="MATERIAL_NAME" readonly="readonly" />
			        </div>
			        <div class="form-group">
			        	<label for="materialId">추가수량</label>
			        	<input type="text" class="form-control" id='BOM_MATERIAL_QUANTITY' name="BOM_MATERIAL_QUANTITY" autocomplete="off" required="required" />
			        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-primary">추가</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div><!-- End Modal -->
<script>
function materialInsert(MATERIAL_ID){
	alert(MATERIAL_ID);
	
    // 댓글 상세조회
    $.get("/bomRest/" + MATERIAL_ID , function(result) {
    	//console.log("bom_MATERIAL_ID:", result.material_ID);
    	$('#MATERIAL_ID').val(result.material_ID);
    	$('#MATERIAL_NAME').val(result.material_NAME);
    	
    }).fail(function(xhr, status, err){
        //console.log("ibupdate err:", err);
    });
}

function materialDelete(BOM_MATERIAL_ID){
	alert(BOM_MATERIAL_ID);
	
	$("#materialDelete").append($('<input/>', {type: 'hidden', name: 'BOM_MATERIAL_ID', value:BOM_MATERIAL_ID }));
	let materialDeleteForm= $("#materialDeleteForm");
	materialDeleteForm.submit();
}

$(document).ready(function(){
	var result = '<c:out value="${result}"/>';
	checkAlert(result);
	
	function checkAlert(result){
		if(result === ''){
			return;
		}
		if(result === "insert success"){
			alert("추가되었습니다.");
		}
		if(result === "delete success"){
			alert("삭제되었습니다.");
		}
		
	}
	
	
});
	
	
	
</script>
</body>
</html>