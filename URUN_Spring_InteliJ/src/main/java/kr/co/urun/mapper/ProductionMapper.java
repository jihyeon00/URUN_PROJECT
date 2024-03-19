package kr.co.urun.mapper;

import kr.co.urun.dto.Criteria;
import kr.co.urun.dto.ProductionDTO;

import java.util.List;

public interface ProductionMapper {

    /*** 생산작업관리 조회 ***/
    List<ProductionDTO> getProcessList(Criteria cri);

    /*** 생산작업관리 수정 ***/
    int ProcessUpdate(ProductionDTO dto);

    /*** 생산작업관리 등록 ***/
    int ProcessInsert(ProductionDTO dto);

    /*** 당일작업등록 ***/
    int WorkInsert(ProductionDTO dto);
    int WInventoryInsert(ProductionDTO dto);
    int WorkUpdate(ProductionDTO dto);

    /*** 생산불량현황 조회 ***/
    List<ProductionDTO> getStatusList(Criteria cri);
}
