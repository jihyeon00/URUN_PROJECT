package kr.co.urun.controller;

import kr.co.urun.dto.BomDTO;
import kr.co.urun.service.BOMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

import java.util.List;

@RestController
@Log4j
public class BOMController {
    @Autowired
    private BOMService bomService;
    @GetMapping("/allBomManagement")
    public String allBomManagement(
            @RequestParam(value="searchText", required = false) String searchText,
            Model model){
        List<BomDTO> selectAllBom = bomService.selectAllBom(searchText);

        if (searchText == null) {
            searchText = "";
        }

        model.addAttribute("selectAllBom", selectAllBom);
        model.addAttribute("searchText", searchText);
        return "allBomManagement";
    }
    @GetMapping("/oneBomManagement")
    public String oneBomManagement(){
        return "oneBomManagement";
    }

	
	
}
