package kr.co.urun.service;

import kr.co.urun.dto.BomDTO;

import java.util.List;

public interface BOMService {
    // 전체 BOM 조회 : allBomManagement
    List<BomDTO> selectAllBom(String searchText);

    // 상세 BOM 조회 : oneBomManagement
    List<BomDTO> selectOneBom(int bomNum, String searchText);

    // 상세 BOM 조회2 : bomRegistration item의 BOM
    List<BomDTO> selectOneItemBom(String searchText);

    // 전체 Material 조회 : bomRegistration
    List<BomDTO> selectMaterial();

    // 상세 Material 조회 : bomRegistration
    BomDTO selectOneMaterial(Long MATERIAL_ID);

    // Material 추가 : bomRegistration
    void materialInsert(BomDTO bomDTO);

    // Material 삭제 : bomRegistration
    int materialDelete(BomDTO bomDTO);


}
