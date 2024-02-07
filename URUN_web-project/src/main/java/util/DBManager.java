package util;

import java.sql.Connection; //DB 연결
import java.sql.DriverManager; //DB 관리
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//DB 관리(연결/닫기)
public class DBManager {

	// DB 연결
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");

			// 데이터 베이스 연결 객체 생성
			// 데이터베이스 연결 정보
			String JDBC_URL  = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
			String USER = "semi_project4";
			String PASSWORD = "123454";

			conn = DriverManager.getConnection(JDBC_URL , USER, PASSWORD);
			System.out.println("연결되었습니다.");

		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("오류입니다.");
		}
		return conn;
	}

	// select DB 닫기
	public static void selectClose(Connection conn, PreparedStatement pstmt, ResultSet rs) {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
					System.out.println("예외 발생 시 처리할 코드 : select 조회");
			}
		
	}
	// insert, update, delete DB 닫기
	public static void IUDClose(Connection conn, PreparedStatement pstmt) {
		try {
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("예외 발생 시 처리할 코드 : insert, update, delete");
		}
		
	}
	
}