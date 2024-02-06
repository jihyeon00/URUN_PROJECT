
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="./css/signUp.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 화면</title>
    <link rel="stylesheet" href="style.css">
    <script src="./js/jquery-3.7.1.min.js"></script>
    
</head>

<body>

<section class= "sign-form">
	<h1>회원가입</h1>
	<form action="">
	<!-- 사원아이디 -->
	<div class="int-area">
    <b>사원번호</b>
       <input type="text" name="id" id="id"
           autocomplete="off" required>
          <label for="id">사원 번호</label>
    <button type="submit">조회</button>
    </div>
    <!-- 비밀번호 -->
  	 <div class="int-area1">
       <b>비밀번호</b>
                <input type="password" name="pw" id="pw"
                    autocomplete="off" required>
                    <label for="pw">비밀번호</label>
     </div>
     
     <!-- 비밀번호확인 -->
     <div class="int-area2">
       <b>비밀번호확인</b>
        <input type="password" name="pw" id="pw"
            autocomplete="off" required>
            <label for="pw">비밀번확인</label>
     </div>
     <!-- 약관동의 -->
      <div class="text-area">
           <input type="text" name="text" id="text"
            autocomplete="off" required>
      </div>
       <input type="checkbox"name=""id=""> 
       <b>약관동의</b>
      <!-- 회원가입 버튼 -->
      <div class="sign-btn">
         <button type="submit">회원가입</button>
     </div>
		
	</form>
	
</section>

</body>
</html>
