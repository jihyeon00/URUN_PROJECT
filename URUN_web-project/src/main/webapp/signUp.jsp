<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.DBManager"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
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
	String signUpMemberId = request.getParameter("signUpMemberId");
%>

<section class= "sign-form">
<h2>회원가입</h2>
<form action="./signck.jsp" method="post" id="signUpForm" name="singck" onSubmit="return false">
	<!-- 사원아이디 -->
	<div class="signUp">
		<div class="sign-area">
		 <div class="signUpName">사원번호</div>
	    <div id="id-area">
		    <input type="text" name="signUpMemberId" id="signUpMemberId" autocomplete="off" required="required" onkeydown="inputIdchk">
				<input type="button" name="checkIdBtn" id="checkIdBtn" onclick="idCheck();" value="조회">
				<input type="hidden" name="checkIdHidden" value="idUnCheck">
			</div>
		</div>
		<div class="sign-area" >
			<div class="signUpName">비밀번호</div>
			<div id="pw-area">
				<input type="password" name="signUpPassword" id="signUpPassword" autocomplete="off" required="required">
			</div>
		</div>
		<div class="sign-area" >
			<div class="signUpName">비밀번호확인</div>
			<div id="pwagree-area">
			 	<input type="password" name="signUpPasswordConfirm" id="signUpPasswordConfirm" autocomplete="off" required="required">
		 	</div>
		</div>
		<!-- 약관동의 -->
		<div class="text-area">
		     <textarea class="content">제1장 총칙
		     
		     
제1조(목적)

본 약관은 대·중소기업·농어업협력재단 기술보호통합포털(이하 "당 관리시스템")이 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 관리시스템의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						
제2조(약관의 효력 및 변경)

① 당 관리시스템은 귀하가 본 약관 내용에 동의하는 것을 조건으로 귀하에게 서비스를 제공할 것이며, 귀하가 본 약관의 내용에 동의 하는 경우, 당 관리시스템의 서비스 제공 행위 및 귀하의 서비스 사용 행위에는 본 약관이 우선적으로 적용될 것입니다.
② 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 당 관리시스템의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 당 관리시스템은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주됩니다.
    
제3조(약관 외 준칙)

① 본 약관은 당 관리시스템이 제공하는 서비스에 관한 이용규정 및 별도 약관과 함께 적용됩니다.
② 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보 통신 윤리강령, 컴퓨터 프로그램 보호법 및 기타 관련 법령의 규정에 의합니다.

제4조 (용어의 정의)

본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 이용자 : 본 약관에 따라 당 관리시스템이 제공하는 서비스를 받는 자
② 가입 : 당 관리시스템이 제공하는 회원가입 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용 계약을 완료시키는 행위
③ 회원 : 당 관리시스템에 개인 정보를 제공하여 회원 등록을 한 자로서, 당 관리시스템의 정보를 제공받으며, 당 관리시스템이 제공하는 서비스를 이용할 수 있는 자
④ 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합
⑤ 탈퇴 : 회원이 이용계약을 종료시키는 행위
⑥ 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다



제2장 서비스 제공 및 이용

제5조(이용계약의 성립)

① 이용계약은 신청자가 온라인으로 당 관리시스템에서 제공하는 소정의 회원가입 신청양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.
② 당 관리시스템은 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
- 다른 사람의 명의를 사용하여 신청하였을 때
- 이용 계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때
- 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때
- 다른 사람의 당 관리시스템 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
- 당 관리시스템을 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
- 기타 당 관리시스템이 정한 이용신청요건이 미비 되었을 때
③ 당 관리시스템은 다음 각 항에 해당하는 경우 그 사유가 해소될 때까지 이용계약 성립을 유보할 수 있습니다.
- 서비스 관련 제반 용량이 부족한 경우
- 기술상 장애 사유가 있는 경우
④ 당 관리시스템이 제공하는 서비스는 아래와 같으며, 그 변경될 서비스의 내용을 이용자에게 공지하고 아래에서 정한 서비스를 변경하여 제공할 수 있습니다.
- E-mail을 통한 대·중소기업·농어업협력재단의 각종 정보 제공
- 당 관리시스템이 자체 개발하거나 다른 기관과의 협의 등을 통해 제공하는 일체의 서비스

제6조(회원정보사용에대한동의)

① 회원의 개인정보에 대해서는 당 관리시스템의 개인정보 보호정책이 적용됩니다.
② 당 관리시스템의 회원 정보는 다음과 같이 수집, 사용, 관리, 보호됩니다.
- 개인정보의 수집 : 당 관리시스템은 귀하의 당 관리시스템 서비스 가입시 귀하가 제공하는 정보를 통하여 귀하에 관한 정보를 수집하며 탈퇴시 수집된 모든 개인정보는 삭제됩니다. 다만, 당 관리시스템(이전 시스템 포함)을 통해 정부지원사업을 참여한 이력이 있는 경우 각 지원사업의 관련법령이 정하는 바에 따라 일부 정보는 과제정보로서 보관되어 질 수 있습니다.
- 개인정보의 사용 : 당 관리시스템은 당 관리시스템 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 당 관리시스템에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
- 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다. 수신되는 정보 중 불필요하다고 생각되는 부분도 변경/조정할 수 있습니다.
- 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 아니되며, 작업 종료시에는 반드시 로그아웃 해주시고, 웹 브라우저의 창을 닫아주시기 바랍니다. (이는 타인과 컴퓨터를 공유하는 인터넷 카페나 도서관 같은 공공장소에서컴퓨터를 사용하는 경우에 귀하의 정보의 보호를 위하여 필요한 사항입니다)
③ 회원이 당 관리시스템에 본 약관에 따라 이용신청을 하는 것은 이용신청이 적용되는 기간동안 당 관리시스템이 본 약관에 따라 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.

제7조(정보보안)

① 가입 신청자가 당 관리시스템 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원본인에게 있습니다.
② ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용 되었다는 사실을 발견한 경우에는 즉시 당 관리시스템에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.
③ 이용자는 당 관리시스템 서비스의 사용 종료시 마다 정확히 접속을 종료하도록 해야 하며, 정확히 종료하지 아니함으로써 제3자가
귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 당 관리시스템은 책임을 부담하지 아니합니다.
④ 관리시스템은 쿠키를 활용하여 개인정보를 수집하지 아니하며 인터넷 접속파일 등 개인정보를 자동으로 설치하는 장치를 거부하며 관련된 장치를 운영하지 않습니다.
⑤ 당 관리시스템은 수집·활용 중인 개인정보가 누출되고 그 사실을 인지시 개인정보 항목 및 발생시점 경위를 사용자에게 통보한다.
제8조(서비스이용시간)
① 서비스 이용시간은 당 관리시스템의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.
② 제1항의 이용시간은 정기점검 등의 필요로 인하여 당 관리시스템이 정한 날 또는 시간은 예외로 합니다.
제9조(서비스의중지및정보의저장과사용)
① 귀하는 당 관리시스템 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 당 관리시스템의 관리 범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 당 관리시스템은 관련 책임을 지지 아니합니다.
② 당 관리시스템이 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일 전의고지 후 서비스를 중지할 수 있으며, 이 기간 동안 귀하가 고지내용을 인지하지 못한 데 대하여 당 관리시스템은 책임을 부담하지 아니합니다.부득이한 사정이 있을 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 당 관리시스템은 책임을 부담하지 아니합니다.
③ 당 관리시스템의 사정으로 서비스를 영구적으로 중단하여야 할 경우 제 2 항에 의거합니다. 다만, 이 경우 사전 고지기간은 1개월로 합니다.
④ 당 관리시스템은 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 귀하 또는 제3자에게 어떠한 책임도 부담하지 아니합니다.
⑤ 당 관리시스템은 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지 할 수 있습니다. 이 경우 당 관리시스템은 위 이용자의 접속을 금지할 수 있습니다.

제10조(서비스의변경및해지)
당 관리시스템은 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
 			</textarea>
		</div>
		<label for="agree" class="chk_box">
			<input type="checkbox" id="agree" name="agree"/>
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
		function idCheck(){
			var signUpMemberId = $('#signUpMemberId').val();
			window.open('./idCheck.jsp?id='+signUpMemberId, '아이디 조회', 
	           'width=500, height=700, scrollbars=no, resizable=no')
			// location.href='./idCheck.jsp?id='+signUpMemberId;
		}
		
		
  	function prevCheckTextBox() {
  		if ($('#signUpMemberId').val().length != 8||!$('#signUpMemberId').val()) { // 이름 관련 dom	
  			$("#id-area").append('<div id="idCheckO" style="color:red; font-size:15px; padding-top:5px;">사원번호는 8자로 입력해 주세요.</div>')
  			$('#signUpMemberId').focus();		// 이름 입력 칸으로 포커스 이동
  			setTimeout(function() {
  				$('#idCheckO').remove();
  			},3000);
  			return false;
  		}

  		if (!$('#signUpPassword').val()||$('#signUpPassword').val().length< 6 || $('#signUpPassword').val().length > 10) {	// 패스워드 관련 dom
  			$("#pw-area").append('<div id="pwCheckO" style="color:red; font-size:15px; padding-top:5px;">비밀번호를 6자 이상 10자 이내로 입력해 주세요.</div>')
  			$('#signUpPassword').focus();		// 패스워드 입력 칸으로 포커스 이동
  			setTimeout(function() {
  				$('#pwCheckO').remove();
  			},3000);
  			
  			return false;
  		}
  		if (!$('#signUpPasswordConfirm').val()) {	// 패스워드 관련 dom
  			$("#pwagree-area").append('<div id="pwAgreeCheckO" style="color:red; font-size:15px; padding-top:5px;">패스워드를 한번 더 입력하세요.</div>')
  			$('#signUpPasswordConfirm').focus();		// 패스워드 입력 칸으로 포커스 이동
  			setTimeout(function() {
  				$('#pwAgreeCheckO').remove();
  			},3000);
  			
  			return false;
  		}
   		if ($('#signUpPassword').val() != $('#signUpPasswordConfirm').val()) {	// 패스워드 관련 dom
   			$("#pwagree-area").append('<div id="pwAgreeCheckO" style="color:red; font-size:15px; padding-top:5px;">패스워드가 맞지 않습니다.</div>')
	 			$('#signUpPasswordConfirm').focus();		// 패스워드 입력 칸으로 포커스 이동
	 			setTimeout(function() {
	  				$('#pwAgreeCheckO').remove();
	  			},3000);
	 			
	 			return false;
		
   		}
   		if (!$('input[name="agree"]:checked').val()) {	// 약관동의체크 관련 dom
   			$(".chk_box").append('<div id="sbCheckO" style="color:red; font-size:15px; padding-top:5px;">약관 동의는 필수입니다.</div>')
   			$('#agree').focus();		// 약관동의체크 입력 칸으로 포커스 이동
   			setTimeout(function() {
  				$('#sbCheckO').remove();
  			},3000);
   			
   			return false;

   		}
  		// 실제 form의 action의 값으로 전송
 			document.getElementById('signUpForm').submit();
  	}

</script>
</section>
</body>
</html>