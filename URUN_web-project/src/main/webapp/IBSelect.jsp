<%@ page import="dao.IBDAO" %>
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
    <title>URUN-입고 현황</title>
</head>
<body>
<%
// count 함수
IBDAO IB = new IBDAO();

String IBWhere = request.getParameter("IB_Where");
if (IBWhere == null) {
	IBWhere = "";
}
%>
<%@ include file="./sidebar.jsp" %>
<div class="container-IB">
		<div class="title">
			<h1>|  입고 현황</h1>
	    </div>
		<div class="container container-IB-Select">
			<div class="IB-Select-menu">
				<div class="Select-menu">
					<!-- 입고 진행상태 조회 조건 내용 저장 공간 -->
					<input type="hidden" name="IB_Where" id="IB_Where"  value="">
					<!-- 입고 진행상태 조회 조건 선택 버튼 -->
					<div class="Select-item">
						<input id="btn-Select" type="submit" value="전체( <%=IB.IBallCount()%> )" class="btn-Select" onClick="javascript: allIBClick();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="submit" value="입고요청( <%=IB.IBrequestCount()%> )" class="btn-Select" onClick="javascript: IBrequest();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value="부분입고( <%=IB.PartialIBCount()%> )" class="btn-Select" onClick="javascript: PartialIB();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value="입고완료( <%=IB.IBCount()%> )" class="btn-Select" onClick="javascript: IB_completed();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value="검수중( <%=IB.UnderreviewIBCount()%> )" class="btn-Select" onClick="javascript: IBUnderreview();"/>
					</div>
					<div class="Select-item">
						<input id="btn-Select" type="button" value="검수완료( <%=IB.completedIBCount()%> )" class="btn-Select" onClick="javascript: confirmed();"/>
					</div>
				</div>
			</div>
			<div class="IB-Select">
				<table class="IB-Select-view">
					<tr>
						<td class="IB-Select-view-menu">진행상태</td>
						<td class="IB-Select-view-menu">입고번호</td>
						<td class="IB-Select-view-menu">업체명</td>
						<td class="IB-Select-view-menu">자재명</td>
						<td class="IB-Select-view-menu">입고예정일</td>
						<td class="IB-Select-view-menu">입고완료일</td>
						<td class="IB-Select-view-menu">입고수량</td>
						<td class="IB-Select-view-menu">검수수량</td>
						<td class="IB-Select-view-menu">불량수량</td>
						<td class="IB-Select-view-menu">불량률</td>
						<td></td>
					</tr>
				<%
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					
					
					try {
						conn = DBManager.getConnection();
						stmt = conn.createStatement();
					 	rs = stmt.executeQuery("SELECT i.IB_Status,"
								+ "i.IB_ID,"
								+ "c.Company_Name,"
								+ "m.MATERIAL_NAME,"
								+ "to_char(i.IB_Expected_Date,'yyyy-mm-dd') as IB_Expected_Date,"
								+ "i.IB_Complete_Date,"
								+ "i.IB_Quantity,"
								+ "i.IB_Test_Quantity,"
								+ "i.IB_Defective_Quantity,"
								+ "round(NVL(i.IB_Defective_Quantity / DECODE(i.IB_Test_Quantity, 0, null, i.IB_Test_Quantity), 0),3) AS IB_defect_rate"
								+ " FROM IB i, MATERIAL m, COMPANY c"
								+ " WHERE i.IB_Company_ID = c.Company_ID"
								+ " AND i.IB_MATERIAL_ID = m.MATERIAL_ID"
								+ " AND i.IB_Status Like '%" + IBWhere + "%'"
								+ " ORDER BY IB_ID DESC");
					 while(rs.next()) {
						 String IB_Status = rs.getString("IB_Status");
						 int IB_ID = rs.getInt("IB_ID");
						 String Company_Name = rs.getString("Company_Name");
						 String MATERIAL_NAME = rs.getString("MATERIAL_NAME");
						 String IB_Expected_Date = rs.getString("IB_Expected_Date");
						 String IB_Complete_Date = rs.getString("IB_Complete_Date");
						 int IB_Quantity = rs.getInt("IB_Quantity");
						 int IB_Test_Quantity = rs.getInt("IB_Test_Quantity");
						 int IB_Defective_Quantity = rs.getInt("IB_Defective_Quantity");
						 Double IB_defect_rate = rs.getDouble("IB_defect_rate");
						 if(IB_Complete_Date==null) {
							 IB_Complete_Date="";
						 }
				%>
					<tr>
						<!-- 입고 현황 조회 내용 -->
						<td><%=IB_Status %></td>
						<td><%=IB_ID %></td>
						<td><%=Company_Name%></td>
						<td><%=MATERIAL_NAME%></td>
						<td><%=IB_Expected_Date%></td>
						<td><%=IB_Complete_Date%></td>
						<td><%=IB_Quantity%></td>
						<td><%=IB_Test_Quantity%></td>
						<td><%=IB_Defective_Quantity%></td>
						<td><%=IB_defect_rate%></td>
						<td>
							<!-- 입고 수정 버튼 -->
							<button style="cursor: pointer; border: 1px solid #999;"class="btn btn-light" onClick="javascript: IBupdate(<%=rs.getInt("IB_ID")%>);">수정</button>
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
	function IBupdate(Num) {
		if (confirm('수정하시겠습니까?')) {
			location.href = "./IBUpdateForm.jsp?num="+ Num;
		}
	}
	// 입고 진행상태 조회 조건 입력 및 실행
   	function allIBClick() {
		location.href = "./IBSelect.jsp";
   	}
   	function IBrequest() {
		document.getElementById("IB_Where").value = '입고요청';
		location.href = "./IBSelect.jsp?IB_Where=" + $('#IB_Where').val();
	}
   	function PartialIB() {
   		document.getElementById("IB_Where").value = '부분입고';
   		location.href = "./IBSelect.jsp?IB_Where=" + $('#IB_Where').val();
	}
   	function IB_completed() {
   		document.getElementById("IB_Where").value = '입고완료';
   		location.href = "./IBSelect.jsp?IB_Where=" + $('#IB_Where').val();
	}
   	function IBUnderreview() {
   		document.getElementById("IB_Where").value = '검수중';
		location.href = "./IBSelect.jsp?IB_Where=" + $('#IB_Where').val();
	}
   	function confirmed() {
   		document.getElementById("IB_Where").value = '검수완료';
   		location.href = "./IBSelect.jsp?IB_Where=" + $('#IB_Where').val();
	}
</script>
</body>
</html>