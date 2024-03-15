package kr.co.urun.service;

import kr.co.urun.dto.MemberDTO;

public interface MemberService {
    // 멤버 조회 : signIn
    String selectMemberInfo(String MEMBER_ID, String MEMBER_PW);

}
