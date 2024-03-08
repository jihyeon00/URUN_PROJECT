<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.DBManager"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="./css/signUp.css">
<script src="./js/jquery-3.7.1.min.js"></script>
<title>ID 체크 </title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String signUpMemberId = request.getParameter("id");
	
	MemberDAO mDAO = new MemberDAO();
	
	List<MemberDTO> selectEmployeeMember = mDAO.selectEmployeeMember(signUpMemberId);
	
	int empCount = selectEmployeeMember.get(0).getEmpCount();
	int memCount = selectEmployeeMember.get(0).getMemCount();
	
%>
<div class="signUp">
	<div class="sign-area">
	 	<div class="signUpName">사원번호</div>
	 	<div id="id-area" style="padding-left: -10px;">
			<input type="text" name="signUpMemberId" id="signUpMemberId" value="<%= signUpMemberId%>" autocomplete="off" required="required" onkeydown="inputIdchk">
			<input type="button" name="checkIdBtn" id="checkIdBtn" onclick="idCheck();" value="조회">
		</div>
	</div>
</div>
<script type="text/javascript">
function idCheck(){
	if(<%=empCount%>==1){
		if(<%=memCount%>==0){
			$("#id-area").append('<input type="button" id="checkIdBtn" class="close" onclick="window.close()" value="확인" style="text-align: center;">');
			$("#id-area").append('<div id="idCheckO" style="color:green; font-size:15px; padding-top:5px;"><%= signUpMemberId%>는 회원가입 가능한 사원번호입니다.</div>');
  			$('#signUpMemberId').focus();
  			setTimeout(function() {
  				$('#idCheckO').remove();
  			},1500);
  			setTimeout(function() {
  				$('.close').remove();
  			},8000);
		} else {
			$("#id-area").append('<input type="button" id="checkIdBtn" class="close" onclick="window.close()" value="확인" style="text-align: center;">');
			$("#id-area").append('<div id="idCheckO" style="color:red; font-size:15px; padding-top:5px; "><%= signUpMemberId%>는 이미 존재하는 사원번호입니다.</div>');
  			$('#signUpMemberId').focus();
  			setTimeout(function() {
  				$('#idCheckO').remove();
  			},1500);
  			setTimeout(function() {
  				$('.close').remove();
  			},8000);
		}
	} else {
		$("#id-area").append('<input type="button" id="checkIdBtn" class="close" onclick="window.close()" value="확인" style="text-align: center;">');
		$("#id-area").append('<div id="idCheckO" style="color:red; font-size:15px; padding-top:5px;"><%= signUpMemberId%>는 회원가입 불가능한 사원번호입니다.</div>');
		$('#signUpMemberId').focus();
		setTimeout(function() {
			$('#idCheckO').remove();
		},1500);
		setTimeout(function() {
			$('.close').remove();
		},8000);
	}
	
}
</script>
</body>
</html>