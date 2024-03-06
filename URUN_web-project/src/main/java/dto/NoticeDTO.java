package dto;

public class NoticeDTO {
	private String NOTICE_ID;
	private String NOTICE_TITLE;
	private String NOTICE_CONTENT;
	private String NOTICE_REGDATE;
	
	private String NOTICE_MEMBER_ID;
	private String MEMBER_ID;
	private String EMPLOYEE_ID;
	private String EMPLOYEE_NAME;
	
	private int MinNoticeId;
	private int MaxNoticeId;
	
	
	public int getMinNoticeId() {
		return MinNoticeId;
	}
	public void setMinNoticeId(int minNoticeId) {
		MinNoticeId = minNoticeId;
	}
	public int getMaxNoticeId() {
		return MaxNoticeId;
	}
	public void setMaxNoticeId(int maxNoticeId) {
		MaxNoticeId = maxNoticeId;
	}
	public String getNOTICE_ID() {
		return NOTICE_ID;
	}
	public void setNOTICE_ID(String nOTICE_ID) {
		NOTICE_ID = nOTICE_ID;
	}
	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}
	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public String getNOTICE_REGDATE() {
		return NOTICE_REGDATE;
	}
	public void setNOTICE_REGDATE(String nOTICE_REGDATE) {
		NOTICE_REGDATE = nOTICE_REGDATE;
	}
	public String getNOTICE_MEMBER_ID() {
		return NOTICE_MEMBER_ID;
	}
	public void setNOTICE_MEMBER_ID(String nOTICE_MEMBER_ID) {
		NOTICE_MEMBER_ID = nOTICE_MEMBER_ID;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getEMPLOYEE_ID() {
		return EMPLOYEE_ID;
	}
	public void setEMPLOYEE_ID(String eMPLOYEE_ID) {
		EMPLOYEE_ID = eMPLOYEE_ID;
	}
	public String getEMPLOYEE_NAME() {
		return EMPLOYEE_NAME;
	}
	public void setEMPLOYEE_NAME(String eMPLOYEE_NAME) {
		EMPLOYEE_NAME = eMPLOYEE_NAME;
	}
	
}
