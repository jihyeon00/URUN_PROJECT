<%@ page import="dao.OBDAO" %>
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
    <title>URUN-출고 현황</title>
</head>
<body>
<%
// count 함수
OBDAO OB = new OBDAO();

String OBWhere = request.getParameter("OB_Where");
if (OBWhere == null) {
	OBWhere = "";
}
%>
<%@ include file="./sidebar.jsp" %>
<div class="container-OB">
		<div class="title">
			<h1>|  출고 현황</h1>
	    </div>
		<div class="container container-OB-Select">
			<div class="OB-Select-menu">
				<div class="Select-menu">
					<!-- 출고 진행상태 조회 조건 내용 저장 공간 -->
					<input type="hidden" name="OB_Where" id="OB_Where"  value="">
					<!-- 출고 진행상태 조회 조건 선택 버튼 -->
					<div class="Select-item">
						<input id="btn-Select" type="submit" value="전체( <%=OB.OBallCount()%> )" class="btn-Select" onClick="javascript: allOBClick();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="submit" value="출고예정( <%=OB.OBExpectedCount()%> )" class="btn-Select" onClick="javascript: OBExpected();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value="출고진행중( <%=OB.OBProceedingCount()%> )" class="btn-Select" onClick="javascript: OBProceeding();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value="출고완료( <%=OB.OB_completedCount()%> )" class="btn-Select" onClick="javascript: OB_completed();"/>
					</div>
				</div>
			</div>
			<div class="OB-Select">
				<table class="OB-Select-view">
					<tr>
						<td class="OB-Select-view-menu">진행상태</td>
						<td class="OB-Select-view-menu">출고번호</td>
						<td class="OB-Select-view-menu">업체명</td>
						<td class="OB-Select-view-menu">제품명</td>
						<td class="OB-Select-view-menu">제품코드</td>
						<td class="OB-Select-view-menu">납품수량</td>
						<td class="OB-Select-view-menu">납품예정일</td>
						<td class="OB-Select-view-menu">납품완료일</td>
						<td></td>
					</tr>
				<%
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					
					try {
						conn = DBManager.getConnection();
						stmt = conn.createStatement();
					 	rs = stmt.executeQuery("SELECT o.OB_Status,"
								+ "o.OB_ID,"
								+ "c.Company_Name,"
								+ "i.ITEM_NAME,"
								+ "o.OB_ITEM_ID,"
								+ "o.OB_Quantity,"
								+ "o.OB_Expected_Date,"
								+ "o.OB_Complete_Date"
								+ " FROM OB o, ITEM i, COMPANY c"
								+ " WHERE o.OB_Company_ID = c.Company_ID"
								+ " AND o.OB_ITEM_ID = i.ITEM_ID"
								+ " AND o.OB_Status Like '%" + OBWhere + "%'"
								+ " ORDER BY OB_ID DESC");
					 while(rs.next()) {
						 String OB_Status = rs.getString("OB_Status");
						 int OB_ID = rs.getInt("OB_ID");
						 String Company_Name = rs.getString("Company_Name");
						 String ITEM_NAME = rs.getString("ITEM_NAME");
						 int OB_ITEM_ID = rs.getInt("OB_ITEM_ID");
						 int OB_Quantity = rs.getInt("OB_Quantity");
						 String OB_Expected_Date = rs.getString("OB_Expected_Date");
						 String OB_Complete_Date = rs.getString("OB_Complete_Date");
						 if(OB_Complete_Date==null) {
							 OB_Complete_Date="";
						 }
				%>
					<tr>
						<!-- 출고 현황 조회 내용 -->
						<td><%=OB_Status %></td>
						<td><%=OB_ID %></td>
						<td><%=Company_Name%></td>
						<td><%=ITEM_NAME%></td>
						<td><%=OB_ITEM_ID%></td>
						<td><%=OB_Quantity%></td>
						<td><%=OB_Expected_Date%></td>
						<td><%=OB_Complete_Date%></td>
						<td>
							<!-- 출고 수정 버튼 -->
							<button style="cursor: pointer; border: 1px solid #999;"class="btn btn-light" onClick="javascript: OBupdate(<%=rs.getInt("OB_ID")%>);">수정</button>
						</td>
					</tr>
				<% 		 		
					 	}
					} catch(Exception e) {
						System.out.println("오라클 접속 오류: " + e);
					} finally {
						if (rs != null) try { rs.close(); } catch (SQLException ex) {}
						if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
						if (conn != null) try { conn.close(); } catch (SQLException ex) {}
					}
				%>
				</table>
			</div>
		</div>
	</div>
<script>
	function OBupdate(Num) {
		if (confirm('수정하시겠습니까?')) {
			location.href = "./OBUpdateForm.jsp?num="+ Num;
		}
	}
	// 입고 진행상태 조회 조건 입력 및 실행
   	function allOBClick() {
		location.href = "./OBSelect.jsp";
   	}
   	function OBExpected() {
		document.getElementById("OB_Where").value = '출고예정';
		location.href = "./OBSelect.jsp?OB_Where=" + $('#OB_Where').val();
	}
   	function OBProceeding() {
   		document.getElementById("OB_Where").value = '출고진행중';
   		location.href = "./OBSelect.jsp?OB_Where=" + $('#OB_Where').val();
	}
   	function OB_completed() {
   		document.getElementById("OB_Where").value = '출고완료';
   		location.href = "./OBSelect.jsp?OB_Where=" + $('#OB_Where').val();
	}
</script>
</body>
</html>