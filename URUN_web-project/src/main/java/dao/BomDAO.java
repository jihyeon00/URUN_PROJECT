package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.BomDTO;
import util.DBManager;

public class BomDAO {
	
	public static void main(String[] args) {
		BomDAO bomDAO = new BomDAO();
	}
	
	// 전체 BOM 조회
	public List<BomDTO> selectAllBom(String searchText){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BomDTO> list = new ArrayList<>();
		
		String sql = null;
		try {
			sql ="SELECT i.ITEM_NAME, bm.*, i.ITEM_COLOR, i.ITEM_SIZE"
					+ " FROM ITEM i INNER JOIN (SELECT b.BOM_ID ,b.BOM_ITEM_ID, LISTAGG(DISTINCT m.MATERIAL_NAME||'('||b.BOM_MATERIAL_QUANTITY||')', ', ' ON OVERFLOW TRUNCATE) AS materialNameList"
					+ "						FROM MATERIAL m, BOM b"
					+ "						WHERE b.BOM_material_id = m.material_id"
					+ "						GROUP BY b.bom_id, b.bom_item_id) bm"
					+ "			ON i.ITEM_ID = bm.bom_item_id"
					+ " WHERE i.ITEM_NAME LIKE '%"+searchText+"%'"
					+ " OR i.ITEM_ID LIKE '%"+searchText+"%'"
					+ " OR bm.materialNameList LIKE '%"+searchText+"%'"
					+ " OR i.ITEM_COLOR LIKE '%"+searchText+"%'"
					+ " OR i.ITEM_SIZE LIKE '%"+searchText+"%'";

			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BomDTO bomDTO = new BomDTO();
				bomDTO.setITEM_NAME(rs.getString("ITEM_NAME"));
				bomDTO.setBOM_ID(rs.getString("BOM_ID"));
				bomDTO.setBOM_ITEM_ID(rs.getString("BOM_ITEM_ID"));
				bomDTO.setMaterialNameList(rs.getString("materialNameList"));
				bomDTO.setITEM_COLOR(rs.getString("ITEM_COLOR"));
				bomDTO.setITEM_SIZE(rs.getInt("ITEM_SIZE"));
				list.add(bomDTO);
			}
		} catch (Exception e) {
			System.out.println("selectAllBom() 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	// 상세 BOM 조회
	public List<BomDTO> selectOneBom(int bomNum, String searchText){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BomDTO> list = new ArrayList<>();
		
		String sql = null;
		try {
			sql= "SELECT rownum, bm.*"
					+ " FROM (SELECT b.bom_id, b.BOM_ITEM_ID, m.MATERIAL_ID, m.MATERIAL_NAME, m.MATERIAL_USES, b.BOM_MATERIAL_QUANTITY"
					+ "		FROM MATERIAL m, BOM b"
					+ "		WHERE b.BOM_MATERIAL_ID = m.MATERIAL_ID"
					+ "		AND b.bom_id = " + bomNum
					+ "		ORDER BY m.MATERIAL_ID) bm"
					+ " where bm.MATERIAL_ID LIKE '%"+searchText+"%'"
					+ " OR bm.MATERIAL_NAME LIKE '%"+searchText+"%'"
					+ " OR bm.MATERIAL_USES LIKE '%"+searchText+"%'";
			
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BomDTO bomDTO = new BomDTO();
				bomDTO.setROWNUM(rs.getInt("rownum"));
				bomDTO.setBOM_ID(rs.getString("BOM_ID"));
				bomDTO.setBOM_ITEM_ID(rs.getString("BOM_ITEM_ID"));
				bomDTO.setMATERIAL_ID(rs.getString("MATERIAL_ID"));
				bomDTO.setMATERIAL_NAME(rs.getString("MATERIAL_NAME"));
				bomDTO.setMATERIAL_USES(rs.getString("MATERIAL_USES"));
				bomDTO.setBOM_MATERIAL_QUANTITY(rs.getInt("BOM_MATERIAL_QUANTITY"));
				list.add(bomDTO);
			}
		} catch (Exception e) {
			System.out.println("selectOneBom() 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	
	// 상세 BOM 조회2
	public List<BomDTO> selectOneItemBom(String searchText){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BomDTO> list = new ArrayList<>();
		
		String sql = null;
		
		try {
			sql= "SELECT rownum, bm.*"
					+ " FROM (SELECT b.bom_id ,b.BOM_ITEM_ID, m.MATERIAL_ID, m.MATERIAL_NAME, m.MATERIAL_USES, b.BOM_MATERIAL_QUANTITY"
					+ "		FROM MATERIAL m, BOM b"
					+ "		WHERE b.BOM_MATERIAL_ID = m.MATERIAL_ID"
					+ "		AND b.BOM_ITEM_ID like " + searchText
					+ "		ORDER BY m.MATERIAL_ID) bm";
			
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BomDTO bomDTO = new BomDTO();
				bomDTO.setROWNUM(rs.getInt("rownum"));
				bomDTO.setBOM_ID(rs.getString("BOM_ID"));
				bomDTO.setBOM_ITEM_ID(rs.getString("BOM_ITEM_ID"));
				bomDTO.setMATERIAL_ID(rs.getString("MATERIAL_ID"));
				bomDTO.setMATERIAL_NAME(rs.getString("MATERIAL_NAME"));
				bomDTO.setMATERIAL_USES(rs.getString("MATERIAL_USES"));
				bomDTO.setBOM_MATERIAL_QUANTITY(rs.getInt("BOM_MATERIAL_QUANTITY"));
				list.add(bomDTO);
			}
		} catch (Exception e) {
			System.out.println("selectOneItemBom() 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	
	public BomDTO insertBom(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BomDTO insertBom = new BomDTO();
		
		String sql = null;
		try {
			
			sql = "";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertBom() 오류입니다." + e);
		} 
		DBManager.selectClose(conn, pstmt, rs);
		
		return null;
		
	}
	
	// 상세 BOM 조회
	public List<BomDTO> selectMaterial(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BomDTO> list = new ArrayList<>();
		
		String sql = null;
		try {
			sql= "SELECT * FROM material";
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				BomDTO bomDTO = new BomDTO();
				bomDTO.setMATERIAL_ID(rs.getString("MATERIAL_ID"));
				bomDTO.setMATERIAL_NAME(rs.getString("MATERIAL_NAME"));
				bomDTO.setMATERIAL_USES(rs.getString("MATERIAL_USES"));
				list.add(bomDTO);
			}
		} catch (Exception e) {
			System.out.println("selectMaterial() 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	
	
	
}
