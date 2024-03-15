package kr.co.urun.service;

import kr.co.urun.dto.BomDTO;
import kr.co.urun.mapper.BomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BOMServiceImpl implements BOMService{

	@Autowired
	private BomMapper bomMapper;

	// 전체 BOM 조회 : allBomManagement
	@Override
	public List<BomDTO> selectAllBom(String searchText){
		List<BomDTO> selectAllBom = bomMapper.selectAllBom(searchText);
		return selectAllBom;
	}

	// 상세 BOM 조회 : oneBomManagement
	@Override
	public List<BomDTO> selectOneBom(int bomNum, String searchText){
		Map<String, Object> paramOneBom = new HashMap<>();
		paramOneBom.put("bomNum", bomNum);
		paramOneBom.put("searchText", searchText);
		List<BomDTO> selectOneBom = bomMapper.selectOneBom(paramOneBom);
		return selectOneBom;
	}

	// 상세 BOM 조회2 : bomRegistration item의 BOM
	@Override
	public List<BomDTO> selectOneItemBom(String searchText) {
		List<BomDTO> selectOneItemBom = bomMapper.selectOneItemBom(searchText);
		return selectOneItemBom;
	}

	// 전체 Material 조회 : bomRegistration
	@Override
	public List<BomDTO> selectMaterial() {
		List<BomDTO> selectMaterial = bomMapper.selectMaterial();
		return selectMaterial;
	}

	// 상세 Material 조회 : bomRegistration
	@Override
	public BomDTO selectOneMaterial(Long MATERIAL_ID) {
		return bomMapper.selectOneMaterial(MATERIAL_ID);
	}

	@Override
	public void materialInsert(BomDTO bomDTO) {
		bomMapper.materialInsert(bomDTO);
	}

	// Material 삭제 : bomRegistration
	@Override
	public int materialDelete(BomDTO bomDTO) {
		int materialDelete = bomMapper.materialDelete(bomDTO);
		return materialDelete;
	}
}
