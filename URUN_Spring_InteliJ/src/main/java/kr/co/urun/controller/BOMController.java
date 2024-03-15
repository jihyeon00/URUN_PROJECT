package kr.co.urun.controller;

import kr.co.urun.dto.BomDTO;
import kr.co.urun.service.BOMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j
public class BOMController {
    @Autowired
    private BOMService bomService;

    // 전체 BOM 조회 : allBomManagement
    @GetMapping("/allBomManagement")
    public String allBomManagement(
            @RequestParam(value="searchText", required = false) String searchText,
            Model model){
        List<BomDTO> selectAllBom = bomService.selectAllBom(searchText);

        model.addAttribute("selectAllBom", selectAllBom);
        model.addAttribute("searchText", searchText);
        return "allBomManagement";
    }

    // 상세 BOM 조회 : oneBomManagement
    @GetMapping("/oneBomManagement")
    public String oneBomManagement(
            @RequestParam(value="searchText", required = false) String searchText,
            @RequestParam(value="bomNum", required = true) int bomNum,
            Model model){
        List<BomDTO> selectOneBom = bomService.selectOneBom(bomNum, searchText);


        model.addAttribute("selectOneBom", selectOneBom);
        model.addAttribute("bomNum", bomNum);
        log.info("bomNum : " + bomNum);
        model.addAttribute("searchText", searchText);
        return "oneBomManagement";
    }

    // 상세 BOM 조회2 : bomRegistration item의 BOM
    @GetMapping("/bomRegistration")
    public String bomRegistration(
            @RequestParam(value="searchText", required = false) String searchText,
            @RequestParam(value="MATERIAL_ID", required = false) Long MATERIAL_ID,
            Model model){

        if (searchText == null) {
            searchText = "";
        }

        List<BomDTO> selectOneItemBom = bomService.selectOneItemBom(searchText);
        List<BomDTO> selectMaterial = bomService.selectMaterial();

        model.addAttribute("selectOneItemBom", selectOneItemBom);
        model.addAttribute("selectMaterial", selectMaterial);

        // BOM 등록 시 자재 조회
        if (MATERIAL_ID != null) {
            BomDTO selectOneMaterial = bomService.selectOneMaterial(MATERIAL_ID);
            model.addAttribute("selectOneMaterial", selectOneMaterial);
            log.info("selectOneMaterial: " + selectOneMaterial);
        }
        model.addAttribute("searchText", searchText);

        return "bomRegistration";
    }


    @PostMapping("/materialInsert")
    public String materialInsert(
            BomDTO bomDTO,
            @RequestParam(value="searchText", required = false) String searchText,
            @RequestParam(value="MATERIAL_ID", required = false) String MATERIAL_ID,
            @RequestParam(value="BOM_MATERIAL_QUANTITY", required = false) int BOM_MATERIAL_QUANTITY,
            RedirectAttributes rttr){

        bomDTO.setSearchText(searchText);
        bomDTO.setBOM_ITEM_ID(searchText);
        bomDTO.setBOM_ID(searchText);
        bomDTO.setMATERIAL_ID(MATERIAL_ID);
        bomDTO.setBOM_MATERIAL_QUANTITY(BOM_MATERIAL_QUANTITY);


        log.info("insert searchText(BOM_ID, BOM_ITEM_ID) : " + searchText);
        bomService.materialInsert(bomDTO);
        rttr.addFlashAttribute("result", "insert success");
        return "redirect:/bomRegistration?searchText="+searchText;
    }

    @PostMapping("/materialDelete")
    public String materialDelete(
            BomDTO bomDTO,
            @RequestParam(value="searchText", required = false) String searchText,
            @RequestParam(value="BOM_MATERIAL_ID", required = false) String BOM_MATERIAL_ID,
            RedirectAttributes rttr){

        log.info("delete searchText(BOM_ID, BOM_ITEM_ID) : " + searchText);

        bomDTO.setSearchText(searchText);
        bomDTO.setBOM_ITEM_ID(searchText);
        bomDTO.setBOM_MATERIAL_ID(BOM_MATERIAL_ID);

        bomService.materialDelete(bomDTO);
        rttr.addFlashAttribute("result", "delete success");
        return "redirect:/bomRegistration?searchText="+searchText;
    }



}
