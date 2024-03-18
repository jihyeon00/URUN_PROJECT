package kr.co.urun.mapper;

import kr.co.urun.dto.Criteria;
import kr.co.urun.dto.ProductionDTO;

import java.util.List;

public interface ProductionMapper {

    List<ProductionDTO> getStatusList(Criteria cri);
}
