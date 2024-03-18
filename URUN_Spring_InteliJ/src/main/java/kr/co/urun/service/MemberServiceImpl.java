package kr.co.urun.service;

import kr.co.urun.dto.MemberDTO;
import kr.co.urun.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberMapper memberMapper;

    // 멤버 조회 : signIn
    @Override
    public String selectMember(String MEMBER_ID, String MEMBER_PW) {
        MemberDTO selectMember = memberMapper.selectMember(MEMBER_ID);
        if(selectMember.getMEMBER_PW().equals(MEMBER_PW)){
            return selectMember.getMEMBER_ID();
        }
        return null;
    }

    // 멤버 정보 조회
    @Override
    public MemberDTO selectMemberInfo(String MEMBER_ID) {
        MemberDTO selectMemberInfo = memberMapper.selectMember(MEMBER_ID);
        return selectMemberInfo;
    }



}
