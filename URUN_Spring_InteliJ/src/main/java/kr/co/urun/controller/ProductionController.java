package kr.co.urun.controller;

import kr.co.urun.dto.Criteria;
import kr.co.urun.dto.ProductionDTO;
import kr.co.urun.service.ProductionService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import lombok.extern.log4j.Log4j;
import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
public class ProductionController {
    public ProductionService service;

    // 생산불량현황
    @GetMapping(value="/DefectStatusList")
    public String DefectStatusList(Criteria cri, Model model){
        List<ProductionDTO> getStatusList = service.getStatusList(cri);
        model.addAttribute("getStatusList", getStatusList);
        model.addAttribute("Criteria", cri);
        return "DefectStatusList";
    }
}
