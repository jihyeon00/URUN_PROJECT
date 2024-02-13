package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.BomDTO;
import util.DBManager;

public class BomDAO {
	
	// 전체 BOM 조회
	public List<BomDTO> selectAllBom(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BomDTO> list = new ArrayList<>();
		
		String sql = null;
		try {
			sql ="";

			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BomDTO bomDTO = new BomDTO();
//					bomDTO.setMATERIAL_ID(rs.getString("MATERIAL_ID"));
//					bomDTO.setMATERIAL_NAME(rs.getString("MATERIAL_NAME"));
//					bomDTO.setMATERIAL_USES(rs.getString("MATERIAL_USES"));
//					bomDTO.setSumINVENTORY(rs.getInt("sumINVENTORY"));
//					list.add(bomDTO);
			}
		} catch (Exception e) {
			System.out.println("selectMaterial() 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	// 전체 BOM 조회
	public List<BomDTO> selectOneBom(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BomDTO> list = new ArrayList<>();
		
		String sql = null;
		try {
			sql ="";
			
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BomDTO bomDTO = new BomDTO();
//					bomDTO.setMATERIAL_ID(rs.getString("MATERIAL_ID"));
//					bomDTO.setMATERIAL_NAME(rs.getString("MATERIAL_NAME"));
//					bomDTO.setMATERIAL_USES(rs.getString("MATERIAL_USES"));
//					bomDTO.setSumINVENTORY(rs.getInt("sumINVENTORY"));
//					list.add(bomDTO);
			}
		} catch (Exception e) {
			System.out.println("selectMaterial() 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	
	
	
}
