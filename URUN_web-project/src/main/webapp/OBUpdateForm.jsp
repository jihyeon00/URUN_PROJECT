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
    <link rel="stylesheet" href="./css/IBSelect.css">
    <link rel="stylesheet" href="./css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script defer src="./js/jquery-3.7.1.min.js"></script>
    <script src="./js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <title>URUN-출고 정보 수정</title>
 
</head>
<body>
<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");

  	String num = request.getParameter("num");
  	
  	String OB_Company_ID = "";
  	String OB_ITEM_ID = "";
  	String OB_Quantity = "";
  	String OB_Expected_Date = "";
  	String OB_Note = "";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
try {
	conn = DBManager.getConnection();
	stmt = conn.createStatement();
 	rs = stmt.executeQuery("SELECT OB_Company_ID, "
 								+ "OB_ITEM_ID,"
 								+ "OB_Quantity,"
								+ "to_char(OB_Expected_Date,'yyyy-mm-dd') as OB_Expected_Date,"
								+ "OB_Note"
						+ " FROM OB"
						+ " WHERE OB_ID = " + num
						+ " ORDER BY OB_ID DESC");

 while(rs.next()) {
	 	OB_Company_ID = Integer.toString(rs.getInt("OB_Company_ID"));
	 	OB_ITEM_ID = Integer.toString(rs.getInt("OB_ITEM_ID"));
	 	OB_Quantity = Integer.toString(rs.getInt("OB_Quantity"));
	 	OB_Expected_Date = rs.getString("OB_Expected_Date");
		OB_Note = rs.getString("OB_Note");

	}
} catch(Exception e) {
	System.out.println("오라클 접속 오류: " + e);
} finally {
	if (rs != null) try { rs.close(); } catch (SQLException ex) {}
	if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
	if (conn != null) try { conn.close(); } catch (SQLException ex) {}
}
%>

<%@ include file="./sidebar.jsp" %>
	<div class="container-OB">
		<div class="title">
			<h1>|  출고 정보 수정</h1>
	    </div>
		<div class="container container-OB-update">
			<div class="inner inner-OB-update">
				<form action="./OB-UPDATE.jsp?num=<%=num %>" method="post" id="form-OB-Update" onSubmit="return false">
					<div class="write-OB-update">
						<div class="OB-Update">
							<div class="OB-name">납품처ID</div>
	            			<div><input type="text" name="OB_Company_ID" id="OB_Company_ID" value="<%=OB_Company_ID%>" autocomplete="off" required disabled></div>
						</div>
						<div class="OB-Update">
							<div class="OB-name">제품ID</div>
	             			<div><input type="text" name="OB_ITEM_ID" id="OB_ITEM_ID" value="<%= OB_ITEM_ID %>" autocomplete="off" required disabled></div>
						</div>
						<div class="OB-Update">
							<div class="OB-name">납품수량</div>
	            			<div><input type="text" name="OB_Quantity" id="OB_Quantity" value="<%= OB_Quantity %>" autocomplete="off" required disabled></div>
						</div>
						<div class="OB-Update">
							<div class="OB-name">납품예정일</div>
							<div><input type="text" name="OB_Expected_Date" id="OB_Expected_Date" value="<%= OB_Expected_Date %>" autocomplete="off" required disabled></div>
						</div>
						<div class="OB-Update">
							<div class="OB-name">납품완료일</div>
	            			<div><input class="OB-name-date" type="date" name="OB_Complete_Date-date" id="OB_Complete_Date-date" value="" autocomplete="off" required></div>
						</div>
						<div class="OB-Update">
							<div class="OB-name">완료시간</div>
	            			<div><input class="OB-name-date" type="time" name="OB_Complete_Date-time" id="OB_Complete_Date-time" value="" autocomplete="off"></div>
						</div>
						<div class="OB-Update">
							<div class="OB-name">진행상태</div>
	            			<select class="OB-Status-name" name="OB_Status" id="OB_Status" >
								<option value="출고예정">출고예정</option>
								<option value="출고진행중">출고진행중</option>
								<option value="출고완료">출고완료</option>
							</select>
						</div>
						<div class="OB-Update">
							<div class="OB-name">비고</div>
	            			<div><input class="OB-Update-Note" type="text" name="OB_Note" id="OB_Note" value="<%=OB_Note %>"></div>
						</div>
						<div class="OB-Update">
			        		<input id="btn-insert" type="submit" value="수정" class="btn btn-light" onClick="javascript: prevCheckTextBox();"style="width: 100px; height: 40px; border: 1px solid #999; font-size: 18px;">
		       			</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
    	function prevCheckTextBox() {
    		if (confirm('수정하시겠습니까?')) {
    			document.getElementById('form-OB-Update').submit();
    		} else {
    			 return false;
    		}
    	}
    </script>
</body>
</html>