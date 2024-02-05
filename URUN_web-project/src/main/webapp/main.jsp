<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script defer src="./js/jquery-3.7.1.min.js"></script>
    <script src="./js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <title>URUN</title>
 
</head>
<body>
<%@ include file="./header.jsp" %>
	
	<script>
	/* 왼쪽 사이드 메뉴 스크립트 */
	$(document).ready(function(){
	    // 왼쪽메뉴 드롭다운
	    $(".sub_menu ul.small_menu").hide();
	    $(".sub_menu ul.big_menu").click(function () {
	        // 현재 클릭한 메뉴를 제외한 다른 메뉴의 하위 메뉴 닫기
	        $(".sub_menu ul.big_menu").not(this).find(".small_menu").slideUp(300);
	
	        $("ul", this).slideToggle(300);
	    });
	});
	</script>
	
	<div id="wrapper">
		<div class="topbar" style="position: absolute; top:30;">
		<!-- 왼쪽 서브 메뉴 -->
			<div class="left_sub_menu">
				<div class="sub_menu">
					<ul class="big_menu">
						<li>공지사항</li>
						<ul class="small_menu">
						</ul>
					</ul>
					<ul class="big_menu">
						<li>재고<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<li><a href="#">자재 재고 조회</a></li>
							<li><a href="#">제품 재고 조회</a></li>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>생산<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<li><a href="#">주간 생산 계획</a></li>
							<li><a href="#">생산 작업 관리</a></li>
							<li><a href="#">생산 불량 현황</a></li>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>BOM<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<li><a href="#">BOM 관리</a></li>
							<li><a href="#">BOM 등록</a></li>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>입고-IB</li>
						<ul class="small_menu">
							<li><a href="#">입고 현황</a></li>
							<li><a href="#">입고 등록</a></li>
							<li><a href="#">입고 수정</a></li>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>출고-OB</li>
						<ul class="small_menu">
							<li><a href="#">출고 현황</a></li>
							<li><a href="#">출고 등록</a></li>
							<li><a href="#">출고 수정</a></li>
						</ul>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>