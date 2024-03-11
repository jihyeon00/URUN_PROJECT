package kr.co.urun.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
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
	
	
}
