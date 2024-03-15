<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/main.css?after">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script defer src="/resources/js/jquery-3.7.1.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <title>URUN</title>
 
</head>
<body>
<%@ include file="./include/sidebar.jsp"%>
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
					<col style="width: 15%" />
					<col style="width: 30%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
				</colgroup>
				<thead>
					<tr>
						<th>제품ID</th>
						<th>제품명</th>
						<th>총계획수량</th>
						<th>총생산수량</th>
						<th>총불량수량</th>
						<th>불량률</th>
					</tr>
				</thead>
				<tbody>
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = null;
					
					try {
					 	sql = "SELECT i.ITEM_NAME, "
								+ "p.PROCESS_ITEM_ID, "
								+ "p.PROCESS_Plan_Quantity,"
								/* PROCESS_ID 의 (총 생산수, 총 불량수, 불량률) */
								+ "SUM(w.WORK_Item_Quantity) as WORK_Item_Quantity, "
								+ "SUM(w.WORK_Defective_Quantity) as WORK_Defective_Quantity,"
								+ "round(NVL(SUM(w.WORK_Defective_Quantity)/DECODE(SUM(w.WORK_Item_Quantity), 0, null, SUM(w.WORK_Item_Quantity)), 0),3) AS PROCESS_defect_rate"
						+ " FROM PROCESS p, WORK w, ITEM i"
						+ " WHERE p.PROCESS_ID = w.WORK_PROCESS_ID(+)"
						+ 	" AND p.PROCESS_ITEM_ID = i.ITEM_ID"
						+ " GROUP BY w.WORK_PROCESS_ID, i.ITEM_NAME, p.PROCESS_ITEM_ID, p.PROCESS_Plan_Quantity"
						+ " ORDER BY p.PROCESS_ITEM_ID DESC";
					 	
					 	conn = DBManager.getConnection();
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
					 while(rs.next()) {
						 int PROCESS_ITEM_ID = rs.getInt("PROCESS_ITEM_ID");
						 String ITEM_NAME = rs.getString("ITEM_NAME");
						 int PROCESS_Plan_Quantity = rs.getInt("PROCESS_Plan_Quantity");
						 int WORK_Item_Quantity = rs.getInt("WORK_Item_Quantity");
						 int WORK_Defective_Quantity = rs.getInt("WORK_Defective_Quantity");
						 Double PROCESS_defect_rate = rs.getDouble("PROCESS_defect_rate");

				%>
					<tr>
						<td><%=PROCESS_ITEM_ID%></td>
						<td><%=ITEM_NAME %></td>
						<td><%=PROCESS_Plan_Quantity%></td>
						<td><%=WORK_Item_Quantity %></td>
						<td><%=WORK_Defective_Quantity %></td>
						<td><%=PROCESS_defect_rate %></td>
					</tr>
				<% 		 		
					 	}
					} catch(Exception e) {
						System.out.println("오라클 접속 오류: " + e);
					} finally {
						DBManager.selectClose(conn, pstmt, rs);
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>