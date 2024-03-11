<%@page import="java.util.List"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<section class="login-form">
  <div class="centerUrun">URUN</div>
  <form action="./signInOk" method ="post">
      <div class="int-area" id="id-area">
          <input type="text" name="MEMBER_ID" id="MEMBER_ID" autocomplete="off" placeholder="사원번호" />
      </div>
      <div class="int-area" id="pw-area">
          <input type="password" name="MEMBER_PW" id="MEMBER_PW" autocomplete="off" placeholder="비밀번호"/>
      </div>
      <!-- 
			<label for="agree" class="chk_box">
				<input type="checkbox" id="agree" checked="checked" />
				<span class="on"></span>
				사원번호 저장
			</label>
		-->
      <div class="btn-area">
          <input type="submit" id="loginBtn" value="로그인"/>
      </div>
  </form>
  <div class="signUp">
      <a href="./signUp.jsp">회원가입</a>
  </div>
</section>
<script>
var MEMBER_ID = $('#MEMBER_ID');
var MEMBER_PW = $('#MEMBER_PW');
var loginBtn = $('#loginBtn');


$('#loginBtn').click(function() {
	// 아이디 유효성 검사
	if($(MEMBER_ID).val().length == 0){ 
		$("#id-area").append('<div id="idCheckO" style="color:red;">아이디를 입력해주세요.</div>')
		$(MEMBER_ID).focus();
		setTimeout(function() {
			$('#idCheckO').remove();
		},1500);
		return false;
	}
	if($(MEMBER_ID).val().length != 8){
		$("#id-area").append('<div id="idCheckO" style="color:red;">아이디는 8자로 입력해주세요.</div>')
		$(MEMBER_ID).focus();
		setTimeout(function() {
			$('#idCheckO').remove();
		},1500);
		return false;
	}
	
	// 비밀번호 유효성 검사
	if($(MEMBER_PW).val().length == 0){
		$("#pw-area").append('<div id="pwCheckO" style="color:red;">비밀번호를 입력해주세요.</div>')
		$(MEMBER_PW).focus();
		setTimeout(function() {
			$('#pwCheckO').remove();
		},1500);
		return false;
	}
	if($(MEMBER_PW).val().length != 6){
		$("#pw-area").append('<div id="pwCheckO" style="color:red;">비밀번호는 6자로 입력해주세요.</div>')
		$(MEMBER_PW).focus();
		setTimeout(function() {
			$('#pwCheckO').remove();
		},1500);
		return false;
	}
	
});

        
</script>


</body>
</html>