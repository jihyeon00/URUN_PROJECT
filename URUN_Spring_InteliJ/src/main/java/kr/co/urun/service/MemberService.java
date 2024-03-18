package kr.co.urun.service;

import kr.co.urun.dto.MemberDTO;

public interface MemberService {
    // 멤버 조회 : signIn
    String selectMember(String MEMBER_ID, String MEMBER_PW);

    // 멤버 정보 조회
    MemberDTO selectMemberInfo(String MEMBER_ID);
}
