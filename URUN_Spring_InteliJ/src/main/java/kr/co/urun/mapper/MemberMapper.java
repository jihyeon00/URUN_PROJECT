package kr.co.urun.mapper;

import kr.co.urun.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    // 멤버 조회 : signIn
    MemberDTO selectMemberInfo(String MEMBER_ID);



}
