<%@ page import="util.*" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.Exception" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/IBSelect.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script defer src="./js/jquery-3.7.1.min.js"></script>
    <script src="./js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <title>URUN-생산불량현황</title>
</head>
<body>
<%
// 검색 text
String search_ITEM_NAME = request.getParameter("search_ITEM_NAME");
String search_ITEM_ID = request.getParameter("search_ITEM_ID");
String search_START_DATE1 = request.getParameter("search_START_DATE1");
String search_START_DATE2 = request.getParameter("search_START_DATE2");
String search_END_DATE1 = request.getParameter("search_END_DATE1");
String search_END_DATE2 = request.getParameter("search_END_DATE2");
// null 일때 공백
if(search_ITEM_NAME == null){
	search_ITEM_NAME = "";
}
if(search_ITEM_ID == null){
	search_ITEM_ID = "";
}
%>
<%@ include file="./sidebar.jsp" %>
<div class="container-status">
		<div class="title">
			<h1><a href="./Production_defect_status.jsp">|  생산 불량 현황</a></h1>
	    </div>
		<div class="container container-status">
			<!-- 검색메뉴 -->
			<div class="status-Select-menu">
				<form action="" id="form-status" onSubmit="return false">
					<div class="Select-menu">
						<div class="Select-item">
							<div class="status-name">제품명</div>
							<div><input type="text" placeholder="제품명을 입력하세요" value="<%= search_ITEM_NAME %>" name="search_ITEM_NAME" id="search_ITEM_NAME" autocomplete="off" ></div>
						</div>
						<div class="Select-item">
							<div class="status-name">생산시작날짜</div>
							<div><input class="status-name-date" type="date"name="search_START_DATE1" id="search_START_DATE1" autocomplete="off" ></div>
							<div> ~ </div>
							<div><input class="status-name-date" type="date"name="search_START_DATE2" id="search_START_DATE2" autocomplete="off" ></div>
						</div>
						<div class="Select-item">
							<div class="status-name">제품코드</div>
							<div><input type="text" placeholder="제품코드를 입력하세요" value="<%= search_ITEM_ID %>" name="search_ITEM_ID" id="search_ITEM_ID" autocomplete="off" ></div>
						</div>
						<div class="Select-item">
							<div class="status-name">생산종료날짜</div>
							<div><input class="status-name-date" type="date"name="search_END_DATE1" id="search_END_DATE1" autocomplete="off" ></div>
							<div> ~ </div>
							<div><input class="status-name-date" type="date"name="search_END_DATE2" id="search_END_DATE2" autocomplete="off" ></div>
						</div>
						<div class="Select-item">
							<div class="Select-item-btn"><input id="btn-insert" type="submit" value="검색" class="btn btn-light" onClick="javascript: search();" style="width: 100px; height: 40px; border: 1px solid #999; font-size: 20px;"></div>
						</div>
					</div>
				</form>
			</div>
			<!-- 검색내용 -->
			<div class="status-Select">
				<table class="status-Select-view">
					<tr>
						<td class="statu-Select-view-menu">진행상태</td>
						<td class="statu-Select-view-menu">제품명</td>
						<td class="statu-Select-view-menu">제품코드</td>
						<td class="statu-Select-view-menu">계획수량</td>
						<td class="statu-Select-view-menu">생산수량</td>
						<td class="statu-Select-view-menu">불량수량</td>
						<td class="statu-Select-view-menu">불량률</td>
						<td class="statu-Select-view-menu">생산시작날짜</td>
						<td class="statu-Select-view-menu">생산종료날짜</td>
					</tr>
				<%	
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = null;
					
					try {
					 	sql = "SELECT p.PROCESS_Status,"
								+ "i.ITEM_NAME, "
								+ "p.PROCESS_ITEM_ID, "
								+ "p.PROCESS_Plan_Quantity,"
								/* PROCESS_ID 의 (총 생산수, 총 불량수, 불량률) */
								+ "SUM(w.WORK_Item_Quantity) as WORK_Item_Quantity, "
								+ "SUM(w.WORK_Defective_Quantity) as WORK_Defective_Quantity,"
								+ "round(NVL(SUM(w.WORK_Defective_Quantity)/DECODE(SUM(w.WORK_Item_Quantity), 0, null, SUM(w.WORK_Item_Quantity)), 0),3) AS PROCESS_defect_rate, "
								/* 시작날짜, 종료날짜 */
								+ "to_char(p.PROCESS_START_DATE,'yyyy-mm-dd') as PROCESS_START_DATE, "
								+ "to_char(p.PROCESS_END_DATE,'yyyy-mm-dd') as PROCESS_END_DATE "
						+ " FROM PROCESS p, WORK w, ITEM i"
						+ " WHERE p.PROCESS_ID = w.WORK_PROCESS_ID(+)"
						+ 	" AND p.PROCESS_ITEM_ID = i.ITEM_ID"
						+ " GROUP BY w.WORK_PROCESS_ID, p.PROCESS_Status, i.ITEM_NAME, p.PROCESS_ITEM_ID, p.PROCESS_ID, "
						+ 		   " p.PROCESS_Plan_Quantity, p.PROCESS_START_DATE, p.PROCESS_END_DATE"
					 	+ " HAVING 1=1";
					 	
					 	// 제품 이름 검색
						if(search_ITEM_NAME != null && search_ITEM_NAME != "") {
							sql += " AND ITEM_NAME LIKE '%" + search_ITEM_NAME + "%'";
						}
					 	// 제품 코드 검색
						if(search_ITEM_ID != null && search_ITEM_ID != "") {
							sql += " AND PROCESS_ITEM_ID LIKE '%" + search_ITEM_ID + "%'";
						}
					 	// 생산시작날짜 검색 to_date(?,'YYYY-MM-DD')
						if(search_START_DATE1 != null && search_START_DATE1 != "" && search_START_DATE2 != null && search_START_DATE2 != "") {
							sql += " AND PROCESS_START_DATE BETWEEN TO_DATE('"+search_START_DATE1+"','yyyy-mm-dd') AND TO_DATE('"+search_START_DATE2+"','yyyy-mm-dd')";
						}
					 	// 생산종료날짜 검색
						if(search_END_DATE1 != null && search_END_DATE1 != "" && search_END_DATE1 != null && search_END_DATE1 != "") {
							sql += " AND PROCESS_END_DATE BETWEEN to_date('"+search_END_DATE1+"','yyyy-mm-dd') AND to_date('"+search_END_DATE2+"','yyyy-mm-dd')";
						}
						
						sql += " ORDER BY p.PROCESS_ID DESC";
					 	
					 	conn = DBManager.getConnection();
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
					 while(rs.next()) {
						 String PROCESS_Status = rs.getString("PROCESS_Status");
						 String ITEM_NAME = rs.getString("ITEM_NAME");
						 int PROCESS_ITEM_ID = rs.getInt("PROCESS_ITEM_ID");
						 int PROCESS_Plan_Quantity = rs.getInt("PROCESS_Plan_Quantity");
						 int WORK_Item_Quantity = rs.getInt("WORK_Item_Quantity");
						 int WORK_Defective_Quantity = rs.getInt("WORK_Defective_Quantity");
						 Double PROCESS_defect_rate = rs.getDouble("PROCESS_defect_rate");
						 String PROCESS_START_DATE = rs.getString("PROCESS_START_DATE");
						 String PROCESS_END_DATE = rs.getString("PROCESS_END_DATE");
						 
						 if(PROCESS_END_DATE==null) {
							 PROCESS_END_DATE="";
						 }
				%>
					<tr>
						<!-- 생산불량현황 조회 내용 -->
						<td><%=PROCESS_Status %></td>
						<td><%=ITEM_NAME %></td>
						<td><%=PROCESS_ITEM_ID%></td>
						<td><%=PROCESS_Plan_Quantity%></td>
						<td><%=WORK_Item_Quantity %></td>
						<td><%=WORK_Defective_Quantity %></td>
						<td><%=PROCESS_defect_rate %></td>
						<td><%=PROCESS_START_DATE %></td>
						<td><%=PROCESS_END_DATE %></td>
					</tr>
				<% 		 		
					 	}
					} catch(Exception e) {
						System.out.println("오라클 접속 오류: " + e);
					} finally {
						DBManager.selectClose(conn, pstmt, rs);
					}
				%>
				</table>
			</div>
		</div>
	</div>
<script>
	function search() {
		document.getElementById('form-status').submit();
	}
</script>
</body>
</html>