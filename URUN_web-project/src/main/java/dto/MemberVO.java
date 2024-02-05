package dto;

public class MemberVO {
	int MEMBER_ID;
	String MEMBER_PW;
	int MEMBER_Employee_ID;
	
	public int getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(int mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}
	public int getMEMBER_Employee_ID() {
		return MEMBER_Employee_ID;
	}
	public void setMEMBER_Employee_ID(int mEMBER_Employee_ID) {
		MEMBER_Employee_ID = mEMBER_Employee_ID;
	}
}
