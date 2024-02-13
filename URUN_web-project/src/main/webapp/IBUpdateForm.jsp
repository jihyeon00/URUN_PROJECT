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
    <title>URUN-입고 정보 수정</title>
 
</head>
<body>
<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");

  	String num = request.getParameter("num");
  	
  	String IB_Company_ID = "";
  	String IB_MATERIAL_ID = "";
  	String IB_Quantity = "";
  	String IB_Test_Quantity = "";
  	String IB_Defective_Quantity = "";
  	String IB_Defective_Date = "";
  	String IB_Expected_Date = "";
  	String IB_Complete_Date = "";
  	String B_Status = "";
  	String IB_Note = "";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
try {
	conn = DBManager.getConnection();
	stmt = conn.createStatement();
 	rs = stmt.executeQuery("SELECT IB_Company_ID, "
 								+ "IB_MATERIAL_ID,"
 								+ "IB_Quantity,"
								+ "IB_Test_Quantity,"
								+ "IB_Defective_Quantity,"
								+ "IB_Defective_Date," 
								+ "to_char(IB_Expected_Date,'yyyy-mm-dd') as IB_Expected_Date,"
								+ "IB_Complete_Date,"
								+ "IB_Status, "
								+ "IB_Note"
						+ " FROM IB"
						+ " WHERE IB_ID = " + num
						+ " ORDER BY IB_ID DESC");

 while(rs.next()) {
		IB_Company_ID = Integer.toString(rs.getInt("IB_Company_ID"));
		IB_MATERIAL_ID = Integer.toString(rs.getInt("IB_MATERIAL_ID"));
		IB_Quantity = Integer.toString(rs.getInt("IB_Quantity"));
		IB_Test_Quantity = Integer.toString(rs.getInt("IB_Test_Quantity"));
		IB_Defective_Quantity = Integer.toString(rs.getInt("IB_Defective_Quantity"));
		IB_Defective_Date = rs.getString("IB_Defective_Date");
		IB_Expected_Date = rs.getString("IB_Expected_Date");
		IB_Complete_Date = rs.getString("IB_Complete_Date");
		B_Status = rs.getString("IB_Status");
		IB_Note = rs.getString("IB_Note");

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
	<div class="container-IB">
		<div class="title">
			<h1>|  입고 정보 수정</h1>
	    </div>
		<div class="container container-IB-update">
			<div class="inner inner-IB-update">
				<form action="./IB-UPDATE.jsp?num=<%=num %>" method="post" id="form-IB-Update" onSubmit="return false">
					<div class="write-IB-update">
						<div class="IB-Update">
							<div class="IB-name">공급처ID</div>
	            			<div><input type="text" name="IB_Company_ID" id="IB_Company_ID" value="<%=IB_Company_ID%>" autocomplete="off" required disabled></div>
						</div>
						<div class="IB-Update">
							<div class="IB-name">자재ID</div>
	             			<div><input type="text" name="IB_MATERIAL_ID" id="IB_MATERIAL_ID" value="<%= IB_MATERIAL_ID %>" autocomplete="off" required disabled></div>
						</div>
						<div class="IB-Update">
							<div class="IB-name">공급수량</div>
	            			<div><input type="text" name="IB_Quantity" id="IB_Quantity" value="<%= IB_Quantity %>" autocomplete="off" required disabled></div>
						</div>
						<div class="IB-Update">
							<div class="IB-name">검수수량</div>
	            			<div><input type="text" name="IB_Test_Quantity" id="IB_Test_Quantity"placeholder="검수수량" value="<%= IB_Test_Quantity%>" autocomplete="off"></div>
						</div>
						<div class="IB-Update">
							<div class="IB-name">불량수량</div>
	            			<div><input type="text" name="IB_Defective_Quantity" id="IB_Defective_Quantity" placeholder="불량수량"value="<%= IB_Defective_Quantity %>" autocomplete="off"></div>
						</div>
						<div class="IB-Update">
							<div class="IB-name">진행상태</div>
	            			<select class="IB-Status-name" name="IB_Status" id="IB_Status" >
								<option value="입고요청">입고요청</option>
								<option value="부분입고">부분입고</option>
								<option value="입고완료">입고완료</option>
								<option value="검수중">검수중</option>
								<option value="검수완료">검수완료</option>
							</select>
						</div>
						<div class="IB-Update">
							<div class="IB-name">불량기록날짜</div>
	            			<div><input class="IB-name-date" type="date" name="IB_Defective_Date" id="IB_Defective_Date" placeholder="불량기록날짜"value="<%=IB_Defective_Date %>" autocomplete="off"></div>
						</div>
						<div class="IB-Update">
							<div class="IB-name">입고예정날짜</div>
		            		<div><input type="text" name="IB_Expected_Date" id="IB_Expected_Date" value="<%= IB_Expected_Date %>" autocomplete="off" required disabled></div>
						</div>
						<div class="IB-Update">
							<div class="IB-name">입고완료날짜</div>
	            			<div><input class="IB-name-date" type="date" name="IB_Complete_Date-date" id="IB_Complete_Date-date" value="<%=IB_Complete_Date%>" autocomplete="off"></div>
						</div>
						<div class="IB-Update">
							<div class="IB-name">입고완료시간</div>
	            			<div><input class="IB-name-date" type="time" name="IB_Complete_Date-time" id="IB_Complete_Date-time" value="<%=IB_Complete_Date%>" autocomplete="off"></div>
						</div>
						<div class="IB-Update">
							<div class="IB-name">비고</div>
	            			<div><input class="IB-Update-Note" type="text" name="IB_Note" id="IB_Note" value="<%=IB_Note %>"></div>
						</div>
						<div class="IB-Update">
			        		<input id="btn-insert" type="submit" value="수정" class="btn btn-light" onClick="javascript: prevCheckTextBox();" style="width: 100px; height: 40px; border: 1px solid #999; font-size: 18px;">
		       			</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
    	function prevCheckTextBox() {
    		if (confirm('수정하시겠습니까?')) {
    			document.getElementById('form-IB-Update').submit();
    		} else {
    			 return false;
    		}
    	}
    </script>
</body>
</html>