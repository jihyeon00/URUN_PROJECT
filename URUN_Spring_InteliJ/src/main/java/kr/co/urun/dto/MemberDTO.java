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
public class MemberDTO {
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_EMPLOYEE_ID;
	
	private String EMPLOYEE_ID;
	private String EMPLOYEE_NAME;
	private String EMPLOYEE_DIVISION;
	
	private int empCount;
	private int memCount;
	
	
}
