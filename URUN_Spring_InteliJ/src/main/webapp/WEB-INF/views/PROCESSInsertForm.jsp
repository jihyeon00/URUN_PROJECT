<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>URUN-생산계획등록</title>
 
</head>
<body>
<%@ include file="./sidebar.jsp" %>
	<div class="container-PROCESS">
		<div class="title">
			<h1>|  생산 계획 등록</h1>
	    </div>
		<div class="container container-PROCESS">
			<div class="inner inner-PROCESS">
				<form action="./PROCESS-INSERT.jsp" method="post" id="form-PROCESS-INSERT" onSubmit="return false">
					<div class="write">
						<div class="PROCESS-Insert">
							<div class="PROCESS-name">제품코드</div>
	            			<div><input type="text" name="PROCESS_ITEM_ID" id="PROCESS_ITEM_ID" placeholder="제품코드" autocomplete="off" required></div>
						</div>
						<div class="PROCESS-Insert">
							<div class="PROCESS-name">생산계획수량</div>
	             			<div><input type="text" name="PROCESS_Plan_Quantity" id="PROCESS_Plan_Quantity" placeholder="생산계획수량" autocomplete="off" required></div>
						</div>
						<div class="PROCESS-Insert">
							<div class="PROCESS-name">생산시작날짜</div>
							<div><input class="PROCESS-name-date" type="date" name="PROCESS_START_DATE" id="PROCESS_START_DATE" autocomplete="off" required></div>
						</div>
						<div class="PROCESS-Insert">
							<div class="PROCESS-name">생산라인</div>
	            			<div><input type="text" name="PROCESS_LINE" id="PROCESS_LINE" placeholder="생산라인" required></div>
						</div>
						<div class="PROCESS-Insert">
			        		<input id="btn-insert" type="submit" value="등록" class="btn btn-light" onClick="javascript: PROCESSInsert();" style="width: 100px; height: 40px; border: 1px solid #999;">
		       			</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
    	function PROCESSInsert() {
    		if (confirm('등록하시겠습니까?')) {
    			document.getElementById('form-PROCESS-INSERT').submit();
    		} else {
    			 return false;
    		}
    	}
    </script>
</body>
</html>