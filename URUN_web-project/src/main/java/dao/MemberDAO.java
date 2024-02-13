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
			sql = "SELECT e.EMPLOYEE_ID, m.MEMBER_ID , m.MEMBER_PW, m.MEMBER_EMPLOYEE_ID, e.EMPLOYEE_NAME"
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
				list.add(memberDTO);
			}
		} catch (Exception e) {
			System.out.println("DAO 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	
}
