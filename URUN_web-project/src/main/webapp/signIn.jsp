<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/main.css">
<script src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<section class="login-form">
  <div class="centerUrun">URUN</div>
  <form action="./signInOk.jsp" method ="post">
      <div class="int-area">
          <input type="text" name="MEMBER_ID" id="MEMBER_ID" autocomplete="off" required="required" placeholder="사원번호" >
      </div>
      <div class="int-area">
          <input type="password" name="MEMBER_PW" id="MEMBER_PW" autocomplete="off" required="required" placeholder="비밀번호">
      </div>
			<label for="agree" class="chk_box">
				<input type="checkbox" id="agree" checked="checked" />
				<span class="on"></span>
				사원번호 저장
			</label>
      <div class="btn-area">
          <input type="submit" id="loginBtn" value="로그인">
      </div>
  </form>
  <div class="signUp">
      <a href="./signUp.jsp">회원가입</a>
  </div>
</section>

    <script>
    let MEMBER_ID = $('#MEMBER_ID');
    let MEMBER_PW = $('#MEMBER_PW');
    let loginBtn = $('#loginBtn');
    
    $(loginBtn).on('click', function() {
        if($(MEMBER_ID).val() == ""||($(MEMBER_ID).val().length!=8) {
            $(MEMBER_ID).next('label').addClass('warning');
            setTimeout(function() {
                $('label').removeClass('warning');
            },1500);
            $(MEMBER_ID).focus();
        }
        else if($(MEMBER_PW).val() == "") {
            $(MEMBER_PW).next('label').addClass('warning');
            setTimeout(function() {
                $('label').removeClass('warning');
            },1500);
            $(MEMBER_PW).focus();
        }
    });
        
        </script>


</body>
</html>