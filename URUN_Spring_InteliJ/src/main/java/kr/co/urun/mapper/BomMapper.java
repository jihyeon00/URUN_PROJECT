package kr.co.urun.mapper;

import kr.co.urun.dto.BomDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface BomMapper {
    // 전체 BOM 조회 : allBomManagement
    List<BomDTO> selectAllBom(String searchText);

    // 상세 BOM 조회 : oneBomManagement
    List<BomDTO> selectOneBom(Map<String, Object> map);

    // 상세 BOM 조회2 : bomRegistration
    List<BomDTO> selectOneItemBom(String searchText);

    // 전체 Material 조회 : bomRegistration
    List<BomDTO> selectMaterial();

    // 상세 Material 조회 : bomRegistration
    BomDTO selectOneMaterial(Long MATERIAL_ID);

    // Material 추가 : bomRegistration
    int materialInsert(BomDTO bomDTO);

    // Material 삭제 : bomRegistration
    int materialDelete(BomDTO bomDTO);

}