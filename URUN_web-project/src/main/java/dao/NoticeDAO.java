package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.NoticeDTO;
import util.DBManager;

public class NoticeDAO {

	public static void main(String[] args) {

	}
	
	// 공지사항 전체조회
		public List<NoticeDTO> selectNoticeAll(){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<NoticeDTO> list = new ArrayList<>();
			
			String sql = null;
			try {
				sql ="SELECT n.NOTICE_ID, n.NOTICE_TITLE, n.NOTICE_CONTENT, n.NOTICE_REGDATE, n.NOTICE_MEMBER_ID, m.MEMBER_ID, e.EMPLOYEE_DIVISON"
						+ " FROM NOTICE n, MEMBER m, EMPLOYEES e"
						+ " WHERE n.NOTICE_MEMBER_ID = m.MEMBER_ID"
						+ " AND m.MEMBER_EMPLOYEE_ID = e.EMPLOYEE_ID"
						+ " ORDER BY n.NOTICE_ID DESC";

				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeDTO noticeDTO = new NoticeDTO();
					noticeDTO.setNOTICE_ID(rs.getString("NOTICE_ID"));
					noticeDTO.setNOTICE_TITLE(rs.getString("NOTICE_TITLE"));
					noticeDTO.setNOTICE_CONTENT(rs.getString("NOTICE_CONTENT"));
					noticeDTO.setNOTICE_REGDATE(rs.getString("NOTICE_REGDATE"));
					list.add(noticeDTO);
				}
			} catch (Exception e) {
				System.out.println("selectNoticeAll() 오류입니다." + e);
			} 
			
			DBManager.selectClose(conn, pstmt, rs);
			
			return list;
			
		}
		// 공지사항 전체조회
		public List<NoticeDTO> selectNoticeFetch(){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<NoticeDTO> list = new ArrayList<>();
			
			String sql = null;
			try {
				sql ="SELECT n.NOTICE_ID, n.NOTICE_TITLE, n.NOTICE_CONTENT, n.NOTICE_REGDATE, n.NOTICE_MEMBER_ID, m.MEMBER_ID, e.EMPLOYEE_DIVISON"
						+ " FROM NOTICE n, MEMBER m, EMPLOYEES e"
						+ " WHERE n.NOTICE_MEMBER_ID = m.MEMBER_ID"
						+ " AND m.MEMBER_EMPLOYEE_ID = e.EMPLOYEE_ID"
						+ " ORDER BY n.NOTICE_ID DESC fetch first 5 rows only";
				
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeDTO noticeDTO = new NoticeDTO();
					noticeDTO.setNOTICE_ID(rs.getString("NOTICE_ID"));
					noticeDTO.setNOTICE_TITLE(rs.getString("NOTICE_TITLE"));
					noticeDTO.setNOTICE_CONTENT(rs.getString("NOTICE_CONTENT"));
					noticeDTO.setNOTICE_REGDATE(rs.getString("NOTICE_REGDATE"));
					list.add(noticeDTO);
				}
			} catch (Exception e) {
				System.out.println("selectNoticeAll() 오류입니다." + e);
			} 
			
			DBManager.selectClose(conn, pstmt, rs);
			
			return list;
			
		}
		
		// 상세 공지사항 조회
		public List<NoticeDTO> selectOneNotice(String num){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<NoticeDTO> list = new ArrayList<>();
			
			String sql = null;
			try {
				sql= "SELECT n.NOTICE_ID, n.NOTICE_TITLE, n.NOTICE_CONTENT, n.NOTICE_REGDATE, n.NOTICE_MEMBER_ID, m.MEMBER_ID, e.EMPLOYEE_NAME, e.EMPLOYEE_DIVISON"
						+ " FROM NOTICE n, MEMBER m, EMPLOYEES e"
						+ " WHERE n.NOTICE_MEMBER_ID = m.MEMBER_ID"
						+ " AND m.MEMBER_EMPLOYEE_ID = e.EMPLOYEE_ID"
						+ " AND NOTICE_ID = "+ num;
				
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					NoticeDTO noticeDTO = new NoticeDTO();
					noticeDTO.setNOTICE_ID(rs.getString("NOTICE_ID"));
					noticeDTO.setNOTICE_TITLE(rs.getString("NOTICE_TITLE"));
					noticeDTO.setNOTICE_CONTENT(rs.getString("NOTICE_CONTENT"));
					noticeDTO.setNOTICE_REGDATE(rs.getString("NOTICE_REGDATE"));
					noticeDTO.setNOTICE_MEMBER_ID(rs.getString("NOTICE_MEMBER_ID"));
					noticeDTO.setEMPLOYEE_NAME(rs.getString("EMPLOYEE_NAME"));
					
					
					list.add(noticeDTO);
				}
			} catch (Exception e) {
				System.out.println("selectOneNotice() 오류입니다." + e);
			} 
			
			DBManager.selectClose(conn, pstmt, rs);
			
			return list;
			
		}

}
