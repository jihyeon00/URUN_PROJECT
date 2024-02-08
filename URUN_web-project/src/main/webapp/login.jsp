<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/login.css">
    <script src="./js/jquery-3.7.1.min.js"></script>
    
    
</head>
<body>
    <section class="login-form">
        <h1>URUN</h1>
        <form action="">
            <div class="int-area">
                <input type="text" name="id" id="id"
                    autocomplete="off" required>
                    <label for="id">사원 번호</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw"
                    autocomplete="off" required>
                    <label for="pw">Password</label>
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">로그인</button>
            </div>
        </form>
        <div class="caption">
            <button type="button" onClick="location.href='./signUp.jsp'">회원가입</button>
        </div>

    </section>

    <script>
        let id = $('#id');
        let pw = $('#pw');
        let btn = $('#btn');
        
        $(btn).on('click', function() {
            if($(id).val() == "") {
                $(id).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                },1500);
            }
            else if($(pw).val() == "") {
                $(pw).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                },1500);
            }
        });
        
        </script>

</body>
</html>