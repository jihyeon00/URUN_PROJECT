<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>URUN-출고 예정 정보 등록</title>
 
</head>
<body>
<%@ include file="./sidebar.jsp" %>
	<div class="container-OB">
		<div class="title">
			<h1>|  출고 예정 정보 등록</h1>
	    </div>
		<div class="container container-OB">
			<div class="inner inner-OB">
				<form action="./OB-INSERT.jsp" method="post" id="form-OB-INSERT" onSubmit="return false">
					<div class="write">
						<div class="OB-Insert">
							<div class="OB-name">납품처ID</div>
	            			<div><input type="text" name="OB_Company_ID" id="OB_Company_ID" placeholder="납품처ID" autocomplete="off" required></div>
						</div>
						<div class="OB-Insert">
							<div class="OB-name">제품ID</div>
	             			<div><input type="text" name="OB_ITEM_ID" id="OB_ITEM_ID" placeholder="제품ID" autocomplete="off" required></div>
						</div>
						<div class="OB-Insert">
							<div class="OB-name">납품수량</div>
	            			<div><input type="text" name="OB_Quantity" id="OB_Quantity" placeholder="납품수량" autocomplete="off" required></div>
						</div>
						<div class="OB-Insert">
							<div class="OB-name">납품예정날짜</div>
		            		<div><input class="OB-name-date" type="date" name="OB_Expected_Date" id="OB_Expected_Date" autocomplete="off" required></div>
						</div>
						<div class="OB-Insert">
			        		<input id="btn-insert" type="submit" value="등록" class="btn btn-light" onClick="javascript: OBInsert();" style="width: 100px; height: 40px; border: 1px solid #999; font-size: 18px;">
		       			</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
    	function OBInsert() {
    		if (confirm('등록하시겠습니까?')) {
    			document.getElementById('form-OB-INSERT').submit();
    		} else {
    			 return false;
    		}
    	}
    </script>
</body>
</html>