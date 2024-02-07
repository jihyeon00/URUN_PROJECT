
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="./css/signUp.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 화면</title>
    <link rel="stylesheet" href="signUp.css">
    <script src="./js/jquery-3.7.1.min.js"></script>
        <script defer src="./js/jquery-3.7.1.min.js"></script>
	  <!-- lodash -->
	  <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
	  <!-- gsap -->
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
	  <!-- gsap_scrolltoplugin -->
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js"></script>
	  <!-- swiper -->
	  <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
	  <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
	     <script defer src="./js/pro.js"></script>
	   
	  
	    
	  
</head>

<body>


<section class= "sign-form">
	<h1>회원가입</h1>
	<form action="signck.jsp" method="post" id=signckfrom name="singck"onSubmit="return false" enctype="multipart/form-data" 

 
	>
	<!-- 사원아이디 -->
	
	<div class="int-area">
    	<b>사원번호</b>
        <input type="text" name="USERID" id="USERID"
           autocomplete="off" required>
          <label for="USERID">사원 번호</label>
          <button type="button" onClick="">조회</button>
   	 </div>
   	     
   	 <div class="int-area1">
       <b>비밀번호</b>
       <input type="password" name="USERPASSWORD1" id="USERPASSWORD1"
          autocomplete="off" required>
          <label for="USERPASSWORD">비밀번호</label>
 
   	</div>
   	   <div class="int-area2">
       <b>비밀번호확인</b>
        <input type="password" name="USERPASSWORD2" id="USERPASSWORD2"
            autocomplete="off" required>
            <label for="USERPASSWORD">비밀번확인</label>
            
    </div>

      <!-- 약관동의 -->
      <div class="text-area">
           <input type="text" name="text" id="text"
            autocomplete="off" required>
      </div>
       <input type="checkbox"name="checkbox1"id="checkbox1"
       autocomplete="off" required> 
       <b>약관동의</b>

	      <!-- 회원가입 버튼 -->
      <div class="sign-btn">
     		<button type="button" onClick="javascript: prevCheckTextBox();">회원가입</button>
	     
      </div>
      
       </form>
       
           <script>
    	function prevCheckTextBox() {
    		if (!$('#USERID').val()) {	// 이름 관련 dom
    			alert('아이디를 입력하세요.');	// 이름 입력하라고 팝업 뜸.
    			$('#USERID').focus();		// 이름 입력 칸으로 포커스 이동
    			
    			return;
    		}
    		if ($('#USERID').val().length < 5) { // 이름 관련 dom	
    			alert('이름을 5자 이내로 입력해 주세요.');	// 이름 5자 이내로 입력하라고 팝업 뜸.
    			$('#USERID').focus();		// 이름 입력 칸으로 포커스 이동
    			
    			return;
    		}
    		if (!$('#USERPASSWORD1').val()) {	// 패스워드 관련 dom
    			alert('패스워드를 입력하세요.');	// 패스워드 입력하라고 팝업 뜸.
    			$('#USERPASSWORD1').focus();		// 패스워드 입력 칸으로 포커스 이동
    			
    			return;
    		}
    		
     		
    		if ($('#USERPASSWORD1').val().length < 8) { // 패스워드 관련 dom	
    			alert('비밀번호를 8자 이상로 입력해 주세요.');	// 패스워드  8자 이내로 입력하라고 팝업 뜸.
    			$('#USERPASSWORD1').focus();
    			
    			return;								// 이름 입력 칸으로 포커스 이동
    		}
    		
    		if (!$('#USERPASSWORD2').val()) {	// 패스워드 관련 dom
    			alert('패스워드를 한번더 입력하세요.');	// 패스워드 한번더 입력하라고 팝업 뜸.
    			$('#USERPASSWORD2').focus();		// 패스워드 입력 칸으로 포커스 이동
    			
    			return;
    		}
    	   		if ($('#USERPASSWORD1').val() != $('#USERPASSWORD2').val()) {	// 패스워드 관련 dom
        			alert('패스워드가 맞지않습니다');	// 패스워드 한번더 입력하라고 팝업 뜸.
        			$('#USERPASSWORD2').focus();		// 패스워드 입력 칸으로 포커스 이동
        			
        			return;
    		
    
    		}
    		if (!$('#checkbox1').val()) {	// 약관동의체크 관련 dom
    			alert('체크박스를 클릭하세요.');	// 약관동의체크 입력하라고 팝업 뜸.
    			$('#checkbox1').focus();		// 약관동의체크 입력 칸으로 포커스 이동
    			
    			return;
    		}
    	
    			
    		// 실제 form의 action의 값으로 전송
   			document.getElementById('signckfrom').submit();
    	}
    </script>
     <script>
     function idCheck(){
    	 
     }
     </script>
    
</section>


	
</body>
</html>