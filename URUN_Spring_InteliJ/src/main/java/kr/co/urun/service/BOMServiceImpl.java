package kr.co.urun.service;

import kr.co.urun.dto.BomDTO;
import kr.co.urun.mapper.BomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BOMServiceImpl implements BOMService{

	@Autowired
	private BomMapper bomMapper;

	@Override
	public List<BomDTO> selectAllBom(String searchText){
		List<BomDTO> selectAllBom = bomMapper.selectAllBom(searchText);
		return selectAllBom;
	}
}
