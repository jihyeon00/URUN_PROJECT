package kr.co.urun.service;

import kr.co.urun.dto.IBDTO;
import kr.co.urun.mapper.IBMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Log4j
@Service
public class IBServiceImpl implements IBService{
	@Autowired
	private IBMapper ibMapper;

	// 입고 현황 조회
	@Override
	public List<IBDTO> IBList(String IBWhere) {
		List<IBDTO> IBDTOList = ibMapper.IBList(IBWhere);
		return IBDTOList;
	}
	// 입고 등록
	@Override
	public int IBInsert(IBDTO dto) {
		int rtn = ibMapper.IBInsert(dto);
		return rtn;
	}

	@Override
	public int IBIvInsert(IBDTO dto) {
		int rtn = ibMapper.IBIvInsert(dto);
		return rtn;
	}

	// 거래처 조회
	@Override
	public List<IBDTO> IBCompanyList() {
		List<IBDTO> IBCompanyList = new ArrayList<>();
		IBCompanyList = ibMapper.IBCompanyList();
		return IBCompanyList;
	}
	// 자재 조회
	@Override
	public List<IBDTO> IBMaterialList() {
		List<IBDTO> IBMaterialList = ibMapper.IBMaterialList();

		return IBMaterialList;
	}
	// 입고 수정
	@Override
	public int IBUpdate(String IB_ID, IBDTO dto) {
		int rtn = ibMapper.IBUpdate(IB_ID, dto);

		return rtn;
	}
	// 입고 수정조회
	@Override
	public IBDTO IBSelectOne(Long IB_ID) {
		return ibMapper.IBSelectOne(IB_ID);
	}

	// 카운트
	@Override
	public Integer IBAllCount() {
		Integer count = ibMapper.IBAllCount();
		return count;
	}
	@Override
	public Integer RequestCount() {
		Integer count = ibMapper.RequestCount();
		return count;
	}
	@Override
	public Integer PartialIBCount() {
		Integer count = ibMapper.PartialIBCount();
		return count;
	}

	@Override
	public Integer IBCount() {
		Integer count = ibMapper.IBCount();
		return count;
	}
	@Override
	public Integer UnderReviewIBCount() {
		Integer count = ibMapper.UnderReviewIBCount();
		return count;
	}
	@Override
	public Integer CompletedIBCount() {
		Integer count = ibMapper.CompletedIBCount();
		return count;
	}
}
