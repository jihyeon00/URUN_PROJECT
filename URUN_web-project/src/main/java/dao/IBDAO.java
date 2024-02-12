package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DBManager;

public class IBDAO {
	// count
	public int IBallCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		try {
			sql = "SELECT COUNT(*) FROM	IB";
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
	public int IBrequestCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		
		try {
			sql = "SELECT COUNT(*) FROM IB GROUP BY IB_Status HAVING IB_Status = '입고요청'";
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
	public int PartialIBCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		
		try {
			sql = "SELECT COUNT(*) FROM	IB GROUP BY IB_Status HAVING IB_Status = '부분입고'";
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
	public int IBCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		
		try {
			sql = "SELECT COUNT(*) FROM	IB GROUP BY IB_Status HAVING IB_Status = '입고완료'";
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
	public int UnderreviewIBCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		
		try {
			sql = "SELECT COUNT(*) FROM	IB GROUP BY IB_Status HAVING IB_Status = '검수중'";
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
	public int completedIBCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = null;
		
		try {
			sql = "SELECT COUNT(*) FROM	IB GROUP BY IB_Status HAVING IB_Status = '검수완료'";
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
