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
		public List<NoticeDTO> selectNoticeAll(int startRows, int pageCnt){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<NoticeDTO> list = new ArrayList<>();
			
			String sql = null;
			try {
				sql ="SELECT *"
					+ " FROM (SELECT rownum rnum , nt.*"
							+ " FROM (SELECT n.NOTICE_ID, n.NOTICE_TITLE, n.NOTICE_CONTENT, n.NOTICE_REGDATE, n.NOTICE_MEMBER_ID, m.MEMBER_ID, e.EMPLOYEE_DIVISON"
									+ " FROM NOTICE n, MEMBER m, EMPLOYEES e"
									+ " WHERE n.NOTICE_MEMBER_ID = m.MEMBER_ID"
									+ " AND m.MEMBER_EMPLOYEE_ID = e.EMPLOYEE_ID"
									+ " ORDER BY n.NOTICE_ID DESC) nt )"
					+ " WHERE rnum > ? AND rnum <= ?";

				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRows-1);
				pstmt.setInt(2, pageCnt);
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
		// 메인화면 공지사항 전체조회
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
		
		// 공지사항의 Total 수
		public int getTotalNotice() {
			int count = 0;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			try {
				sql = "SELECT count(notice_id) FROM NOTICE ";
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
				
			} catch (Exception e) {
				System.out.println("getTotalNotice() 오류입니다." + e);
			} 
			
			DBManager.selectClose(conn, pstmt, rs);
			
			return count;
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
		
		// 윗글
		public List<NoticeDTO> selectMinNotice(String num){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<NoticeDTO> list = new ArrayList<>();
			
			int minId=0;
			String sql = null;
			try {
				sql= "SELECT nvl(MIN(NOTICE_ID),0) as minId"
						+ "		FROM NOTICE "
						+ "		WHERE NOTICE_ID > " + num;
				
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				NoticeDTO noticeDTO = new NoticeDTO();
				if(rs.next()) {
					minId = rs.getInt("minId");
					noticeDTO.setMinNoticeId(minId);
					
					list.add(noticeDTO);
				}
				
				sql= "SELECT notice_title"
						+ " FROM NOTICE"
						+ " WHERE NOTICE_ID = " + minId ;
				
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					noticeDTO.setNOTICE_TITLE(rs.getString("notice_title"));
					list.add(noticeDTO);
				}
			} catch (Exception e) {
				System.out.println("setMinNoticeId() 오류입니다." + e);
			} 
			
			DBManager.selectClose(conn, pstmt, rs);
			
			return list;
			
		}
		
		
		// 아랫글
		public List<NoticeDTO> selectMaxNotice(String num){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<NoticeDTO> list = new ArrayList<>();
			String sql = null;
			int maxId=0;
			try {
				sql= "SELECT nvl(max(NOTICE_ID),0) AS maxId"
						+ "		FROM NOTICE"
						+ "		WHERE NOTICE_ID < " + num ;
				
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				NoticeDTO noticeDTO = new NoticeDTO(); 
				if(rs.next()) {
					maxId = rs.getInt("maxId");
					if(maxId!=0) {
						noticeDTO.setMaxNoticeId(maxId);
					} else {
						System.out.println("maxId가 0입니다.");
					}
					
					list.add(noticeDTO);
				}
				
				sql= "SELECT notice_title"
						+ " FROM NOTICE"
						+ " WHERE NOTICE_ID = " + maxId ;
				
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					noticeDTO.setNOTICE_TITLE(rs.getString("notice_title"));
					list.add(noticeDTO);
				}
			} catch (Exception e) {
				System.out.println("selectMaxNotice() 오류입니다." + e);
			} 
			
			DBManager.selectClose(conn, pstmt, rs);
			
			return list;
			
		}
		
		// 글쓰기
		public int noticeInsert(String MEMBER_ID, NoticeDTO noticeDTO) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String sql = null;
			
			int insert = 0;
			int intMemberId = Integer.parseInt(MEMBER_ID);
			
			try {
				sql= "INSERT INTO NOTICE (NOTICE_TITLE, NOTICE_CONTENT,NOTICE_MEMBER_ID) VALUES (?,?,?)";
				
				conn = DBManager.getConnection();
				
				pstmt=conn.prepareStatement(sql);
				String title= noticeDTO.getNOTICE_TITLE();
				String content= noticeDTO.getNOTICE_TITLE();
				
				if(title!=null&&content!=null) {
					pstmt.setString(1, noticeDTO.getNOTICE_TITLE());
					pstmt.setString(2, noticeDTO.getNOTICE_CONTENT());
					pstmt.setInt(3, intMemberId);
					
					insert = pstmt.executeUpdate();
				} else {
					System.out.println("null 값이 존재합니다.");
				}
				
			
			} catch (Exception e) {
				System.out.println("noticeInsert() 오류입니다." + e);
			} 
			DBManager.IUDClose(conn, pstmt);
		
			return insert;
		}

}
