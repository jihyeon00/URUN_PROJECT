package kr.co.urun.service;

import kr.co.urun.dto.Criteria;
import kr.co.urun.dto.ProductionDTO;

import java.util.List;

public interface ProductionService  {

    // 생산작업관리 조회
    List<ProductionDTO> getProcessList(Criteria cri);

    // 생산불량현황
    List<ProductionDTO> getStatusList(Criteria cri);
}
