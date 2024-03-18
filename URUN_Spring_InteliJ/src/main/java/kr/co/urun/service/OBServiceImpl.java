package kr.co.urun.service;

import kr.co.urun.dto.OBDTO;
import kr.co.urun.mapper.OBMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Log4j
@Service
public class OBServiceImpl implements OBService{
	@Autowired
	private OBMapper obMapper;
	// 출고현황 조회
	@Override
	public List<OBDTO> OBList(String OBWhere) {
		List<OBDTO> OBDTOList = obMapper.OBList(OBWhere);
		return OBDTOList;
	}
	// 출고등록
	@Override
	public int OBInsert(OBDTO dto) {
		int rtn = obMapper.OBInsert(dto);
		return rtn;
	}
	// 출고 창고 등록
	@Override
	public int OBIvInsert(OBDTO dto) {
		int rtn = obMapper.OBIvInsert(dto);
		return rtn;
	}
	// 거래처 조회
	@Override
	public List<OBDTO> OBCompanyList() {
		List<OBDTO> OBCompanyList = new ArrayList<>();
		OBCompanyList = obMapper.OBCompanyList();
		return OBCompanyList;
	}
	// 제품 조회
	@Override
	public List<OBDTO> OBItemList() {
		List<OBDTO> OBItemList = obMapper.OBItemList();
		return OBItemList;
	}
	// 출고 수정
	@Override
	public int OBUpdate(OBDTO dto) {
		int rtn = obMapper.OBUpdate(dto);
		return rtn;
	}
	// 츨고 수정 조회
	@Override
	public OBDTO OBSelectOne(Long OB_ID) {
		return obMapper.OBSelectOne(OB_ID);
	}

	// 카운트
	@Override
	public Integer OBAllCount() {
		Integer count = obMapper.OBAllCount();
		return count;
	}
	@Override
	public Integer ExpectedCount() {
		Integer count = obMapper.ExpectedCount();
		return count;
	}
	@Override
	public Integer ProceedingCount() {
		Integer count = obMapper.ProceedingCount();
		return count;
	}
	@Override
	public Integer completedCount() {
		Integer count = obMapper.completedCount();
		return count;
	}
}
