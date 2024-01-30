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
    <title>Document</title>
 
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
                  <li>SKU 관리<i class="arrow fas fa-angle-right"></i></li>
                  <ul class="small_menu">
                      <li><a href="#">소메뉴1-1</a></li>
                      <li><a href="#">소메뉴1-2</a></li>
                      <li><a href="#">소메뉴1-3</a></li>
                      <li><a href="#">소메뉴1-4</a></li>
                  </ul>
              </ul>
              <ul class="big_menu">
                  <li>BOM<i class="arrow fas fa-angle-right"></i></li>
                  <ul class="small_menu">
                      <li><a href="#">소메뉴2-1</a></li>
                      <li><a href="#">소메뉴2-2</a></li>
                      <li><a href="#">소메뉴2-3</a></li>
                      <li><a href="#">소메뉴2-4</a></li>
                  </ul>
              </ul>
              <ul class="big_menu">
                  <li>입고</li>
                  <ul class="small_menu">
                      <li><a href="#">소메뉴3-1</a></li>
                      <li><a href="#">소메뉴3-2</a></li>
                      <li><a href="#">소메뉴3-3</a></li>
                      <li><a href="#">소메뉴3-4</a></li>
                  </ul>
              </ul>
              <ul class="big_menu">
                  <li>출고</li>
                  <ul class="small_menu">
                      <li><a href="#">소메뉴3-1</a></li>
                      <li><a href="#">소메뉴3-2</a></li>
                      <li><a href="#">소메뉴3-3</a></li>
                      <li><a href="#">소메뉴3-4</a></li>
                  </ul>
              </ul>
              <ul class="big_menu">
                  <li>관리자</li>
                  <ul class="small_menu">
                      <li><a href="#">소메뉴3-1</a></li>
                      <li><a href="#">소메뉴3-2</a></li>
                      <li><a href="#">소메뉴3-3</a></li>
                      <li><a href="#">소메뉴3-4</a></li>
                  </ul>
              </ul>
          </div>
      </div>
  	</div>
</div>
</body>
</html>