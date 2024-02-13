<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>회원가입 화면</title>
 <link rel="stylesheet" href="./css/signUp.css">
 <script defer src="./js/jquery-3.7.1.min.js"></script>
 <script defer src="./js/pro.js"></script>
 <script defer src="./js/ck_button.js"></script>
 <script defer src="./js/main.js"></script>
</head>

<body>
<% 
	request.setCharacterEncoding("UTF-8"); 
%>

<section class= "sign-form">
<h2>회원가입</h2>
<form action="signck.jsp" method="post" id="signUpForm" name="singck" onSubmit="return false">
	<!-- 사원아이디 -->
	<div class="signUp">
		<div class="sign-area">
		 <div class="signUpName">사원번호</div>
	    <div>
		    <input type="text" name="signUpMemberId" id="signUpMemberId" autocomplete="off" required="required" onkeydown="inputIdChk()">
				<input type="button" name="checkIdBtn" id="checkIdBtn" onClick="location.href='./selectId.jsp'" value="조회">
			</div>
		</div>
		<div class="sign-area">
			<div class="signUpName">비밀번호</div>
			<div>
				<input type="password" name="signUpPassword" id="signUpPassword" autocomplete="off" required="required">
			</div>
		</div>
		<div class="sign-area">
			<div class="signUpName">비밀번호확인</div>
			<div>
			 	<input type="password" name="signUpPasswordConfirm" id="signUpPasswordConfirm" autocomplete="off" required="required">
		 	</div>
		</div>
		<!-- 약관동의 -->
		<div class="text-area">
		     <textarea class="content">
		     
		     </textarea>
		</div>
		<label for="agree" class="chk_box">
			<input type="checkbox" id="agree" />
			<span class="on" style="font-size: 15px;">약관에 동의 합니다. (필수)</span>
		</label>
		<!-- 회원가입 버튼 -->
		<div class="sign-btn">
			<input type="button" id="signUpBtn" value="회원가입" onClick="prevCheckTextBox();">
			<input type="button" id="cancleBtn" value="취소" onClick="location.href='./signIn.jsp'">
		</div>
	</div>
</form>    
<script>
  	function prevCheckTextBox() {
  		if ($('#signUpMemberId').val().length != 8||!$('#signUpMemberId').val()) { // 이름 관련 dom	
  			alert('사원번호는 8자로 입력해 주세요.');	// 이름 5자 이내로 입력하라고 팝업 뜸.
  			$('#signUpMemberId').focus();		// 이름 입력 칸으로 포커스 이동
  			
  			return;
  		}

  		if (!$('#signUpPassword').val()||$('#signUpPassword').val().length< 6 || $('#signUpPassword').val().length > 10) {	// 패스워드 관련 dom
  			alert('비밀번호를 6자 이상 10자 이내로 입력해 주세요.');	// 패스워드 입력하라고 팝업 뜸.
  			$('#signUpPassword').focus();		// 패스워드 입력 칸으로 포커스 이동
  			
  			return;
  		}
  		if (!$('#signUpPasswordConfirm').val()) {	// 패스워드 관련 dom
  			alert('패스워드를 한번더 입력하세요.');	// 패스워드 한번더 입력하라고 팝업 뜸.
  			$('#signUpPasswordConfirm').focus();		// 패스워드 입력 칸으로 포커스 이동
  			
  			return;
  		}
   		if ($('#signUpPassword').val() != $('#signUpPasswordConfirm').val()) {	// 패스워드 관련 dom
	 			alert('패스워드가 맞지않습니다');	// 패스워드 한번더 입력하라고 팝업 뜸.
	 			$('#signUpPasswordConfirm').focus();		// 패스워드 입력 칸으로 포커스 이동
 			
 			return;
		
   		}
   		if (!$('#agree').val()) {	// 약관동의체크 관련 dom
   			alert('체크박스를 클릭하세요.');	// 약관동의체크 입력하라고 팝업 뜸.
   			$('#agree').focus();		// 약관동의체크 입력 칸으로 포커스 이동
   			
   			return;
   		}
		

	//if($('#check_button').value != "idCheck"){
	//	alert("아이디 조회 해주세요.");
		
	//	return;
		
	//}

  			
  		// 실제 form의 action의 값으로 전송
 			document.getElementById('signUpForm').submit();
  	}
	
// 아이디 중복체크 화면open
function openIdChk(){

	window.name = "parentForm";
	window.open("./idck.jsp",
			"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
}

// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
// 다시 중복체크를 하도록 한다.
function inputIdChk(){
	document.userInfo.idDuplication.value ="idUncheck";
}

</script>
</section>
</body>
</html>