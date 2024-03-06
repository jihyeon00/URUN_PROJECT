<%@page import="util.DBManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
<%@ include file="./sidebar.jsp"%>
<div class="wrap">
	<div class="title">
		<span style="font-weight: 800;">| </span> 
		<span style="font-weight: 800;">공지사항 등록</span>
	</div>
	<form action="./NoticeInsert.jsp" method="post" id="FormNoticeINSERT" onSubmit="return false;">
		<div class="write">
			<div class="NoticeInsert">
				<div class="NoticeName">제목</div>
	         			<div><input type="text" name="NoticeTitle" id="NoticeTitle" placeholder="제목을 입력해주세요." autocomplete="off" required></div>
			</div>
			<div class="NoticeInsert">
				<div class="NoticeName">내용</div>
       			<div><input type="text" name="NoticeContent" id="NoticeContent" placeholder="내용을 입력해주세요." autocomplete="off" required></div>
			</div>
			<div class="NoticeInsert">
	       		<input id="btn-insert" type="submit" value="등록" class="btn btn-light" onClick="javascript: NoticeInsert();" style="width: 80px; height: 40px; border: 1px solid #999; font-size: 18px;">
	     	</div>
		</div>
	</form>
</div>
</body>
</html>