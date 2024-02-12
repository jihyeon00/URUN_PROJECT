package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DBManager;

public class OBDAO {
	// count
	public int OBallCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		try {
			sql = "SELECT COUNT(*) FROM	OB";
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
			} catch(Exception e) {
				System.out.println("DAO 오류입니다." + e);
			} 
			DBManager.selectClose(conn, pstmt, rs);
			return count;
	}
	public int OBExpectedCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		
		try {
			sql = "SELECT COUNT(*) FROM OB GROUP BY OB_Status HAVING OB_Status = '출고예정'";
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("DAO 오류입니다." + e);
		} 
		DBManager.selectClose(conn, pstmt, rs);
		return count;
	}
	public int OBProceedingCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		
		try {
			sql = "SELECT COUNT(*) FROM	OB GROUP BY OB_Status HAVING OB_Status = '출고진행중'";
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("DAO 오류입니다." + e);
		} 
		DBManager.selectClose(conn, pstmt, rs);
			
		return count;
	}
	public int OB_completedCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		
		try {
			sql = "SELECT COUNT(*) FROM	OB GROUP BY OB_Status HAVING OB_Status = '출고완료'";
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("DAO 오류입니다." + e);
		} 
		DBManager.selectClose(conn, pstmt, rs);
		
		return count;
	}
}
