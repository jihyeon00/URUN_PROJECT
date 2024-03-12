package kr.co.urun.controller;

import kr.co.urun.dto.BomDTO;
import kr.co.urun.service.BOMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

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
            Model model){

        if (searchText == null) {
            searchText="";
        }

        List<BomDTO> selectOneItemBom = bomService.selectOneItemBom(searchText);
        List<BomDTO> selectMaterial = bomService.selectMaterial();

        model.addAttribute("selectOneItemBom", selectOneItemBom);
        model.addAttribute("selectMaterial", selectMaterial);
        model.addAttribute("searchText", searchText);

        return "bomRegistration";
    }
	
	
}
