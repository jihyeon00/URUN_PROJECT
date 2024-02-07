package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dto.headerDTO;
import util.DBManager;



public class headerDAO {
	
	public static void main(String[] args) {

	}
	
	public List<headerDTO> selectMemberInfo(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<headerDTO> list = new ArrayList<>();
		
		String sql = null;
		
		
		try {
			sql = "SELECT e.EMPLOYEE_ID ,m.MEMBER_EMPLOYEE_ID, e.EMPLOYEE_NAME"
					+ " FROM EMPLOYEES e LEFT join MEMBER m on e.EMPLOYEE_ID=m.MEMBER_EMPLOYEE_ID"
					+ " WHERE e.EMPLOYEE_ID=10000008";
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				headerDTO headerDTO = new headerDTO();
				headerDTO.setMEMBER_ID(rs.getInt("MEMBER_EMPLOYEE_ID"));
				headerDTO.setEmployee_Name(rs.getString("EMPLOYEE_NAME"));
				list.add(headerDTO);
			}
		} catch (Exception e) {
			System.out.println("DAO 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	
}
