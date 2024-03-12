package kr.co.urun.service;

import kr.co.urun.dto.BomDTO;

import java.util.List;

public interface BOMService {

    List<BomDTO> selectAllBom(String searchText);

    List<BomDTO> selectOneBom(int bomNum, String searchText);
}
