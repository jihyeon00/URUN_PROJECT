package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dto.MemberDTO;
import util.DBManager;



public class MemberDAO {
	
	public static void main(String[] args) {
		
	}
	
	public List<MemberDTO> selectMemberInfo(String MEMBER_ID){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MemberDTO> list = new ArrayList<>();
		
		String sql = null;
		
		
		try {
			sql = "SELECT e.EMPLOYEE_ID, m.MEMBER_ID , m.MEMBER_PW, m.MEMBER_EMPLOYEE_ID, e.EMPLOYEE_NAME, e.EMPLOYEE_DIVISION"
					+ " FROM EMPLOYEES e LEFT join MEMBER m on e.EMPLOYEE_ID=m.MEMBER_EMPLOYEE_ID"
					+ " WHERE e.EMPLOYEE_ID = " + MEMBER_ID;
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setEMPLOYEE_ID(rs.getString("EMPLOYEE_ID"));
				memberDTO.setMEMBER_ID(rs.getString("MEMBER_ID"));
				memberDTO.setMEMBER_PW(rs.getString("MEMBER_PW"));
				memberDTO.setMEMBER_EMPLOYEE_ID(rs.getString("MEMBER_EMPLOYEE_ID"));
				memberDTO.setEMPLOYEE_NAME(rs.getString("EMPLOYEE_NAME"));
				memberDTO.setEMPLOYEE_DIVISON(rs.getString("EMPLOYEE_DIVISION"));
				list.add(memberDTO);
			}
		} catch (Exception e) {
			System.out.println("DAO 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	
	
	// 사원번호 조회 및 중복체크
	public List<MemberDTO> selectEmployeeMember(String MEMBER_ID){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MemberDTO> list = new ArrayList<>();
		
		String sql = null;
		MemberDTO memberDTO = new MemberDTO();
		try {
			sql = "SELECT count(EMPLOYEE_ID) as empCount FROM EMPLOYEES WHERE EMPLOYEE_ID = " + MEMBER_ID;
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberDTO.setEmpCount(rs.getInt("empCount"));
				
				System.out.println(rs.getInt("empCount"));
				list.add(memberDTO);
			}
			sql = "SELECT count(MEMBER_ID) as memCount FROM MEMBER WHERE MEMBER_ID = " + MEMBER_ID;
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberDTO.setMemCount(rs.getInt("memCount"));
				
				System.out.println(rs.getInt("memCount"));
				list.add(memberDTO);
			}
		} catch (Exception e) {
			System.out.println("DAO 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	
}
