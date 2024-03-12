package kr.co.urun.mapper;

import kr.co.urun.dto.BomDTO;

import java.util.List;

public interface BomMapper {
    List<BomDTO> selectAllBom(String searchText);

    List<BomDTO> selectOneBom(int bomNum,String searchText);



	
}
