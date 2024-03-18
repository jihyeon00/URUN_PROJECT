package kr.co.urun.controller;

import kr.co.urun.dto.OBDTO;
import kr.co.urun.service.OBService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
public class OBController {
    private OBService obService;

    /**** 출고 현황 조회 ****/
    @GetMapping(value ="/OBList")
    public String OBList(
            @RequestParam(value = "OBWhere", required = false) String OBWhere,
            @RequestParam(value = "OB_ID", required = false) Long OB_ID,
            Model model){
        // 출고 현황 조회
        List<OBDTO> OBList = obService.OBList(OBWhere);

        model.addAttribute("OBList", OBList);
        model.addAttribute("OBWhere", OBWhere);

        // 출고 등록 (거래처, 자재) 조회
        List<OBDTO> OBCompanyList = obService.OBCompanyList();
        List<OBDTO> OBItemList = obService.OBItemList();
        model.addAttribute("OBCompanyList", OBCompanyList);
        model.addAttribute("OBItemList", OBItemList);

        // 출고 수정 조회
        if (OB_ID != null) {
            OBDTO OBSelectOne = obService.OBSelectOne(OB_ID);
            model.addAttribute("OB", OBSelectOne);
            log.info("OBSelectOne: "+ OBSelectOne);
        }

        // 카운트
        int OBAllCount = obService.OBAllCount();
        int ExpectedCount = obService.ExpectedCount();
        int ProceedingCount = obService.ProceedingCount();
        int completedCount = obService.completedCount();
        model.addAttribute("OBAllCount", OBAllCount);
        model.addAttribute("ExpectedCount", ExpectedCount);
        model.addAttribute("ProceedingCount", ProceedingCount);
        model.addAttribute("completedCount", completedCount);

        return "OBList";
    }

    /**** 출고 등록 ****/
    @PostMapping(value = "/OBInsert")
    public String OBInsert(OBDTO dto, RedirectAttributes rttr){
        int OBInsert = obService.OBInsert(dto);
        int OBIvInsert = obService.OBIvInsert(dto);
        log.info("OBInsert: "+ dto);

        rttr.addFlashAttribute("insertSuccessCount1", OBInsert);
        rttr.addFlashAttribute("insertSuccessCount2", OBIvInsert);
        return "redirect:/OBList";
    }

    /**** 출고 수정 ****/
    @PostMapping(value = "/OBUpdate")
    public String OBUpdate(OBDTO dto, RedirectAttributes rttr){
        String OB_Complete_Date = dto.getOB_Complete_Date_date() + dto.getOB_Complete_Date_time();
        dto.setOB_Complete_Date(OB_Complete_Date);

        int rtn = obService.OBUpdate(dto);
        log.info("OBUpdate dto: "+ dto);
        rttr.addFlashAttribute("updateSuccessCount", rtn);
        return "redirect:/OBList";
    }
}
