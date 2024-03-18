package kr.co.urun.mapper;

import kr.co.urun.dto.OBDTO;
import java.util.List;

public interface OBMapper {

    // 출고 조회
    List<OBDTO> OBList(String OBWhere);
    // 출고 등록
    int OBInsert(OBDTO dto);
    int OBIvInsert(OBDTO dto);
    // 거래처 조회
    List<OBDTO> OBCompanyList();
    // 제품 조회
    List<OBDTO> OBItemList();
    // 출고 수정
    int OBUpdate(OBDTO dto);
    OBDTO OBSelectOne(Long OB_ID);

    // 카운트
    Integer OBAllCount();
    Integer ExpectedCount();
    Integer ProceedingCount();
    Integer completedCount();
}
