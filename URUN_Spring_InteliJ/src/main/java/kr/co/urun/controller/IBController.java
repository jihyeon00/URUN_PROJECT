package kr.co.urun.controller;

import jakarta.servlet.http.HttpSession;
import kr.co.urun.dto.IBDTO;
import kr.co.urun.dto.MemberDTO;
import kr.co.urun.service.IBService;
import kr.co.urun.service.MemberService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import lombok.extern.log4j.Log4j;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
public class IBController {
    private IBService ibService;
    public MemberService memberService;

    /**** 입고 현황 조회 ****/
    @GetMapping(value ="/IBList")
    public String IBList(
            @RequestParam(value = "IBWhere", required = false) String IBWhere,
            @RequestParam(value = "IB_ID", required = false) Long IB_ID,
            HttpSession session,
            Model model){
        // 헤더 멤버
        String MEMBER_ID = (String) session.getAttribute("member");
        MemberDTO selectMemberInfo = memberService.selectMemberInfo(MEMBER_ID);
        model.addAttribute("selectMemberInfo", selectMemberInfo);

        // 입고 현황 조회
        List<IBDTO> IBList = ibService.IBList(IBWhere);

        model.addAttribute("IBList", IBList);
        model.addAttribute("IBWhere", IBWhere);

        // 입고 등록 (거래처, 자재) 조회
        List<IBDTO> IBCompanyList = ibService.IBCompanyList();
        List<IBDTO> IBMaterialList = ibService.IBMaterialList();
        model.addAttribute("IBCompanyList", IBCompanyList);
        model.addAttribute("IBMaterialList", IBMaterialList);

        // 입고 수정 조회
        if (IB_ID != null) {
            IBDTO IBSelectOne = ibService.IBSelectOne(IB_ID);
            model.addAttribute("IB", IBSelectOne);
            log.info("IBSelectOne: "+ IBSelectOne);
        }

        // 카운트
        int IBAllCount = ibService.IBAllCount();
        int RequestCount = ibService.RequestCount();
        int PartialIBCount = ibService.PartialIBCount();
        int IBCount = ibService.IBCount();
        int UnderReviewIBCount = ibService.UnderReviewIBCount();
        int CompletedIBCount = ibService.CompletedIBCount();
        model.addAttribute("IBallCount", IBAllCount);
        model.addAttribute("RequestCount", RequestCount);
        model.addAttribute("PartialIBCount", PartialIBCount);
        model.addAttribute("IBCount", IBCount);
        model.addAttribute("UnderReviewIBCount", UnderReviewIBCount);
        model.addAttribute("CompletedIBCount", CompletedIBCount);

        return "IBList";
    }

    /**** 입고 등록 ****/
    @PostMapping(value = "/IBInsert")
    public String IBInsert(IBDTO dto, RedirectAttributes rttr){
        int IBInsert = ibService.IBInsert(dto);
        int IBIvInsert = ibService.IBIvInsert(dto);
        log.info("IBInsert: "+ dto);

        rttr.addFlashAttribute("insertSuccessCount1", IBInsert);
        rttr.addFlashAttribute("insertSuccessCount2", IBIvInsert);
        return "redirect:/IBList";
    }

    /**** 입고 수정 ****/
    @PostMapping(value = "/IBUpdate")
    public String IBUpdate(IBDTO dto, RedirectAttributes rttr){
        String IB_Complete_Date = dto.getIB_Complete_Date_date()+dto.getIB_Complete_Date_time();
        dto.setIB_Complete_Date(IB_Complete_Date);

        int rtn = ibService.IBUpdate(dto);
        log.info("IBUpdate dto: "+ dto);
        rttr.addFlashAttribute("updateSuccessCount", rtn);
        return "redirect:/IBList";
    }

}


