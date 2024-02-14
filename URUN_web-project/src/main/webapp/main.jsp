<%@page import="dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/main.css?after">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script defer src="./js/jquery-3.7.1.min.js"></script>
    <script src="./js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <title>URUN</title>
 
</head>
<body>
<%@ include file="./sidebar.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	NoticeDAO nDAO = new NoticeDAO();
	List<NoticeDTO> listNoticeFetch = nDAO.selectNoticeFetch();
	
	
%>
	<div class="wrap">
		<div class="title">
			<span style="font-weight: 800;">| </span> 
			<span style="font-weight: 800;">공지사항</span>
		</div>
			<div class="selectTable" style="width: 70%;">
				<table>
						<colgroup>
							<col style="width: 10%" />
							<col style="width: 40%" />
							<col style="width: 20%" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
						<%for(int i=0;i<listNoticeFetch.size();i++) {%>
					<tr>
						<td><%=listNoticeFetch.get(i).getNOTICE_ID()%></td>
						<td><a style="color:black;" href="./NoticeDetail.jsp?num=<%=listNoticeFetch.get(i).getNOTICE_ID()%>"><%=listNoticeFetch.get(i).getNOTICE_TITLE()%></a></td>
						<td><%=listNoticeFetch.get(i).getNOTICE_REGDATE().substring(0, 10) %></td>
					</tr>
					<%} %>
						</tbody>
					</table>
				</div>
		<div class="title">
			<span style="font-weight: 800;">| </span> 
			<span style="font-weight: 800;">생산현황</span>
		</div>
		<div class="selectTable">
			<table>
					<colgroup>
						<col style="width: 10%" />
						<col style="width: 40%" />
						<col style="width: 20%" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
	</div>
</body>
</html>