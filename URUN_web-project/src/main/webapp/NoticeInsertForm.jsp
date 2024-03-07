<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
<%@ include file="./sidebar.jsp"%>
<%
request.setCharacterEncoding("UTF-8");

String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

MemberDAO mDAO = new MemberDAO();
List<MemberDTO> selectMember = mDAO.selectMemberInfo(MEMBER_ID);
%>
<div class="wrap">
	<div class="title">
		<span style="font-weight: 800;">| </span> 
		<span style="font-weight: 800;">공지사항 등록</span>
	</div>
	<form action="./NoticeInsert.jsp" method="post" id="FormNoticeINSERT">
		<div class="write">
			<div class="NoticeInsert">
				<div><input type="hidden" name="MEMBER_ID" id="MEMBER_ID" value="<%=MEMBER_ID%>" readonly="readonly"></div>
				<div class="form-group col-12" >
					<div class="NoticeName">제목</div>
					<div class="textLengthWrapContent">
						<span class="titleCount">0자</span>
				    <span class="titleTotal">/30자</span>
				  </div>
	   			<div><input type="text" name="NoticeTitle" id="NoticeTitle" placeholder="제목을 입력해주세요." maxlength="30" autocomplete="off" required></div>
				</div>
			</div>
			<div class="NoticeInsert">
				<div class="form-group col-12" >
					<div class="NoticeName">내용</div>
				  <div class="textLengthWrapContent">
				    <div class="contentCount">0자</div>
				    <div class="contentTotal">/700자</div>
				  </div>
       			<textarea name="NoticeContent" id="NoticeContent" placeholder="내용을 입력해주세요." maxlength="700" autocomplete="off" required></textarea>
				</div>	
	       		<input id="btnNoticeInsert" type="submit" value="등록" class="btn btn-light" >
			</div>
			<div class="NoticeInsert">
	     	</div>
		</div>
	</form>
</div>
<script type="text/javascript">
$('#NoticeTitle').keyup(function (e) {
	var NoticeTitle = $(this).val();
    
    // 글자수 세기
    if (NoticeTitle.length == 0 || NoticeTitle == '') {
    	$('.titleCount').text('0자');
    } else {
    	$('.titleCount').text(NoticeTitle.length + '자');
    }
    
    // 글자수 제한
    if (NoticeTitle.length >= 30) {
        $(this).val($(this).val().substring(0, 30));
        alert('제목은 30자까지 입력 가능합니다.');
    		$('.titleCount').text(NoticeTitle.length + '자');
    };
});
$('#NoticeContent').keyup(function (e) {
	var NoticeContent = $(this).val();
    
    // 글자수 세기
    if (NoticeContent.length == 0 || NoticeContent == '') {
    	$('.contentCount').text('0자');
    } else {
    	$('.contentCount').text(NoticeContent.length + '자');
    }
    
    // 글자수 제한
    if (NoticeContent.length >= 700) {
        $(this).val($(this).val().substring(0, 700));
        alert('내용은 700자까지 입력 가능합니다.');
	    	$('.contentCount').text(NoticeContent.length + '자');
    };
});
</script>
</body>
</html>