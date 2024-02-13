package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.InventoryDTO;
import util.DBManager;

// 재고
public class InventoryDAO {
	
	public static void main(String[] args) {
		
	}
	
	// 재고 - 자재 재고 조회
	public List<InventoryDTO> selectMaterial(String searchText, int startRows, int pageCnt){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<InventoryDTO> list = new ArrayList<>();
		
		String sql = null;
		try {
			sql ="SELECT *"
					+ " FROM (SELECT rownum rnum , itemInventory.*"
					+ " FROM 	(SELECT m.MATERIAL_ID , m.MATERIAL_NAME, m.MATERIAL_USES, nvl(ivn.sumINVENTORY, 0) sumINVENTORY"
					+ "			FROM MATERIAL m LEFT JOIN"
					+ "							(SELECT INVENTORY_MATERIAL_ID, sum(INVENTORY_Quantity) sumINVENTORY"
					+ "							FROM INVENTORY"
					+ "							WHERE INVENTORY_MATERIAL_ID IS NOT NULL GROUP BY INVENTORY_MATERIAL_ID) IVN"
					+ "				 			ON m.MATERIAL_ID = IVN.INVENTORY_MATERIAL_ID"
					+ "			WHERE m.MATERIAL_ID LIKE '%"+searchText+"%'"
					+ "				or lower( m.MATERIAL_NAME) LIKE lower('%"+searchText+"%')"
					+ "				or lower(m.MATERIAL_USES) LIKE lower('%"+searchText+"%')"
					+ "			ORDER BY m.MATERIAL_ID) itemInventory)"
					+ " WHERE rnum > ? AND rnum <=?";

			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRows-1);
			pstmt.setInt(2, pageCnt);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				InventoryDTO inventoryDTO = new InventoryDTO();
				inventoryDTO.setMATERIAL_ID(rs.getString("MATERIAL_ID"));
				inventoryDTO.setMATERIAL_NAME(rs.getString("MATERIAL_NAME"));
				inventoryDTO.setMATERIAL_USES(rs.getString("MATERIAL_USES"));
				inventoryDTO.setSumINVENTORY(rs.getInt("sumINVENTORY"));
				list.add(inventoryDTO);
			}
		} catch (Exception e) {
			System.out.println("selectMaterial() 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
		
	}
	
	// 검색한 내용에 따른 Material의 Total 수
		public int getTotalMaterial(String searchText) {
			int count = 0;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			try {
				sql = "SELECT count(MATERIAL_ID) FROM MATERIAL "
						+ "WHERE MATERIAL_ID LIKE '%"+searchText+"%' "
						+ " OR lower(MATERIAL_NAME) LIKE lower('%"+searchText+"%') "
						+ " OR lower(MATERIAL_USES) LIKE lower('%"+searchText+"%')";
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
				
			} catch (Exception e) {
				System.out.println("getTotalMaterial() 오류입니다." + e);
			} 
			
			DBManager.selectClose(conn, pstmt, rs);
			
			return count;
		}
	
	public List<InventoryDTO> selectItem(String searchText, int startRows, int pageCnt){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<InventoryDTO> list = new ArrayList<>();
		
		String sql = null;
		try {
			sql ="SELECT * "
					+ "FROM (SELECT rownum rnum , itemInventory.* "
					+ "		FROM	(SELECT it.ITEM_ID, it.item_name, it.item_color, it.item_size, nvl(ivn.sumINVENTORY, 0) sumINVENTORY "
					+ "				FROM item it LEFT JOIN "
					+ "								(SELECT INVENTORY_ITEM_ID, sum(INVENTORY_Quantity) sumINVENTORY "
					+ "								FROM INVENTORY"
					+ "								WHERE INVENTORY_ITEM_ID IS NOT NULL GROUP BY INVENTORY_ITEM_ID) IVN "
					+ "					 			ON it.ITEM_ID = IVN.INVENTORY_ITEM_ID"
					+ "				WHERE it.ITEM_ID LIKE '%"+searchText+"%'"
					+ "					or lower(it.ITEM_NAME) LIKE lower('%"+searchText+"%')"
					+ "					or lower(it.ITEM_COLOR) LIKE lower('%"+searchText+"%')"
					+ "				ORDER BY it.ITEM_ID) itemInventory)"
					+ " WHERE rnum > ? AND rnum <= ?";

			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRows-1);
			pstmt.setInt(2, pageCnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				InventoryDTO inventoryDTO = new InventoryDTO();
				inventoryDTO.setITEM_ID(rs.getString("ITEM_ID"));
				inventoryDTO.setITEM_NAME(rs.getString("item_name"));
				inventoryDTO.setITEM_COLOR(rs.getString("item_color"));
				inventoryDTO.setITEM_SIZE(rs.getInt("item_size"));
				inventoryDTO.setSumINVENTORY(rs.getInt("sumINVENTORY"));
				list.add(inventoryDTO);
			}
		} catch (Exception e) {
			System.out.println("selectItem() 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return list;
	}
	// 검색한 내용에 따른 Item의 Total 수
	public int getTotalItem(String searchText) {
		int count = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		try {
			sql = "SELECT count(item_id) FROM ITEM "
					+ "WHERE ITEM_ID LIKE '%"+searchText+"%' "
							+ " OR lower(ITEM_NAME) LIKE lower('%"+searchText+"%') "
							+ " OR lower(ITEM_COLOR) LIKE lower('%"+searchText+"%')";
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getTotalItem() 오류입니다." + e);
		} 
		
		DBManager.selectClose(conn, pstmt, rs);
		
		return count;
	}
	
	

}
