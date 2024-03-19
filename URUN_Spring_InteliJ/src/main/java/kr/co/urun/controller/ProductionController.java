package kr.co.urun.controller;

import jakarta.servlet.http.HttpSession;
import kr.co.urun.dto.Criteria;
import kr.co.urun.dto.MemberDTO;
import kr.co.urun.dto.OBDTO;
import kr.co.urun.dto.ProductionDTO;
import kr.co.urun.service.MemberService;
import kr.co.urun.service.OBService;
import kr.co.urun.service.ProductionService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
public class ProductionController {
    public ProductionService service;
    public MemberService memberService;
    public OBService obService;

    /**** 생산불량현황 ****/
    @GetMapping(value="/DefectStatusList")
    public String DefectStatusList(HttpSession session, Criteria cri, Model model){
        // 헤더 멤버
        String MEMBER_ID = (String) session.getAttribute("member");
        MemberDTO selectMemberInfo = memberService.selectMemberInfo(MEMBER_ID);
        model.addAttribute("selectMemberInfo", selectMemberInfo);

        // 아이템 리스트
        List<OBDTO> selectItem = obService.OBItemList();
        model.addAttribute("selectItem", selectItem);

        // 생산불량현황 리스트
        List<ProductionDTO> getStatusList = service.getStatusList(cri);
        model.addAttribute("getStatusList", getStatusList);
        model.addAttribute("Criteria", cri);
        return "DefectStatusList";
    }

    /**** 생산작업관리 ****/
    @GetMapping(value = "/ProcessList")
    public String ProcessList(HttpSession session, Criteria cri, Model model){
        // 헤더 멤버
        String MEMBER_ID = (String) session.getAttribute("member");
        MemberDTO selectMemberInfo = memberService.selectMemberInfo(MEMBER_ID);
        model.addAttribute("selectMemberInfo", selectMemberInfo);

        // 생산작업 리스트
        List<ProductionDTO> getProcessList = service.getProcessList(cri);
        model.addAttribute("getProcessList", getProcessList);
        model.addAttribute("Criteria", cri);

        return "ProcessList";
    }

    /**** 생산작업관리 등록 ****/
    @PostMapping(value = "/ProcessInsert")
    public String ProcessInsert (ProductionDTO dto, RedirectAttributes rttr) {
        int rtn = service.ProcessInsert(dto);
        rttr.addFlashAttribute("processInsertSuccessCount", rtn);
        return "redirect:/ProcessList";
    }

    /**** 생산작업관리 수정 ****/
    @PostMapping(value = "/ProcessUpdate")
    public String ProcessUpdate(ProductionDTO dto, RedirectAttributes rttr){
        int rtn = service.ProcessUpdate(dto);
        log.info("ProcessUpdate dto: "+ dto);
        rttr.addFlashAttribute("updateSuccessCount", rtn);
        return "redirect:/ProcessList";
    }

    /**** 당일 작엄 등록 ****/
    @PostMapping(value = "/WorkInsert")
    public String WorkInsert(ProductionDTO dto, RedirectAttributes rttr){
        int WorkInsert = service.WorkInsert(dto);
        int WInventoryInsert = service.WInventoryInsert(dto);
        int WorkUpdate = service.WorkUpdate(dto);
        rttr.addFlashAttribute("insertSuccessCount1", WorkInsert);
        rttr.addFlashAttribute("insertSuccessCount2", WInventoryInsert);
        rttr.addFlashAttribute("insertSuccessCount3", WorkUpdate);
        return "redirect:/ProcessList";
    }
}
