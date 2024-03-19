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

	/*** 생산작업관리 조회 ***/
	@Override
	public List<ProductionDTO> getProcessList(Criteria cri) {
		List<ProductionDTO> ProcessList = mapper.getProcessList(cri);
		return ProcessList;
	}

	/*** 생산작업관리 수정 ***/
	@Override
	public int ProcessUpdate(ProductionDTO dto) {
		int rtn = mapper.ProcessUpdate(dto);
		return rtn;
	}

	/*** 생산작업관리 등록 ***/
	@Override
	public int ProcessInsert(ProductionDTO dto) {
		int rtn = mapper.ProcessInsert(dto);
		return rtn;
	}

	/*** 당일작업등록 ***/
	@Override
	public int WorkInsert(ProductionDTO dto) {
		int rtn = mapper.WorkInsert(dto);
		return rtn;
	}
	@Override
	public int WInventoryInsert(ProductionDTO dto) {
		int rtn = mapper.WInventoryInsert(dto);
		return rtn;
	}
	@Override
	public int WorkUpdate(ProductionDTO dto) {
		int rtn = mapper.WorkUpdate(dto);
		return rtn;
	}

	/*** 생산불량현황 ***/
	@Override
	public List<ProductionDTO> getStatusList(Criteria cri) {
		List<ProductionDTO> StatusList = mapper.getStatusList(cri);
		return StatusList;
	}
}
