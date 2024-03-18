package kr.co.urun.mapper;

import kr.co.urun.dto.Criteria;
import kr.co.urun.dto.ProductionDTO;

import java.util.List;

public interface ProductionMapper {

    // 생산작업관리 조회
    List<ProductionDTO> getProcessList(Criteria cri);

    // 생산불량현황 조회
    List<ProductionDTO> getStatusList(Criteria cri);
}
