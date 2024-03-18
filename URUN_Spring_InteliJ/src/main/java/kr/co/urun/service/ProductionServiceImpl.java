package kr.co.urun.service;

import kr.co.urun.dto.Criteria;
import kr.co.urun.dto.ProductionDTO;
import kr.co.urun.mapper.ProductionMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class ProductionServiceImpl implements ProductionService {
	@Autowired
	private ProductionMapper mapper;

	// 생산작업관리 조회
	@Override
	public List<ProductionDTO> getProcessList(Criteria cri) {
		List<ProductionDTO> ProcessList = mapper.getProcessList(cri);
		return ProcessList;
	}

	// 생산불량현황
	@Override
	public List<ProductionDTO> getStatusList(Criteria cri) {
		List<ProductionDTO> StatusList = mapper.getStatusList(cri);
		return StatusList;
	}
}
