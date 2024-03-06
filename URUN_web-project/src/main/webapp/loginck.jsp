<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Process</title>
</head>
<body>
    <%
    
	int MEMBER_ID = 0;
    String MEMBER_PW = "";
    

        String jdbcUrl = "jdbc:oracle:thin:@1.220.247.78:1522/ORCL";
        String dbUser = "semi_project4";
        String dbPassword = "123454";

        try {
        	
        	  MEMBER_ID = Integer.parseInt(request.getParameter("MEMBERID"));
      	   	  MEMBER_PW = request.getParameter("MEMBERPW");
      	  
              Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

              String query = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PW = ?";
              PreparedStatement pstmt = conn.prepareStatement(query);
              pstmt.setInt(1, MEMBER_ID);
              pstmt.setString(2, MEMBER_PW);

              ResultSet resultSet = pstmt.executeQuery();

              if (resultSet.next()) {
                  // 로그인 성공
                  %>
                  <script>
					location.href="./main.jsp?member="+ <%=MEMBER_ID%>;
                  </script>
                  <%
                  
                  
                  
                
              }
              
        
       
          else {
                  // 로그인 실패
                  out.println("로그인실패");
              }

              resultSet.close();
              pstmt.close();
              conn.close();

          } catch (Exception e) {
              e.printStackTrace();
              out.println("로그인정보를 확인하세요");
              out.println("MEMBER_ID");
          }
    %>
    
    
</body>
</html>

         