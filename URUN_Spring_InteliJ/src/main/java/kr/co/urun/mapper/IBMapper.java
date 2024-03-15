package kr.co.urun.mapper;

import kr.co.urun.dto.IBDTO;
import java.util.List;

public interface IBMapper {

    // 입고 조회
    List<IBDTO> IBList(String IBWhere);
    // 입고 등록
    int IBInsert(IBDTO dto);
    int IBIvInsert(IBDTO dto);
    // 거래처 조회
    List<IBDTO> IBCompanyList();
    // 자재 조회
    List<IBDTO> IBMaterialList();
    // 입고 수정
    int IBUpdate(IBDTO dto);
    IBDTO IBSelectOne(Long IB_ID);

    // 카운트
    Integer IBAllCount();
    Integer RequestCount();
    Integer PartialIBCount();
    Integer IBCount();
    Integer UnderReviewIBCount();
    Integer CompletedIBCount();
}
