package kr.co.urun.controller;

import jakarta.servlet.http.HttpSession;
import kr.co.urun.dto.Criteria;
import kr.co.urun.dto.MemberDTO;
import kr.co.urun.dto.ProductionDTO;
import kr.co.urun.service.MemberService;
import kr.co.urun.service.ProductionService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
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
    public MemberService memberService;

    // 생산불량현황
    @GetMapping(value="/DefectStatusList")
    public String DefectStatusList(HttpSession session, Criteria cri, Model model){
        // 헤더 멤버
        String MEMBER_ID = (String) session.getAttribute("member");
        MemberDTO selectMemberInfo = memberService.selectMemberInfo(MEMBER_ID);
        model.addAttribute("selectMemberInfo", selectMemberInfo);

        // 생산불량현황 리스트
        List<ProductionDTO> getStatusList = service.getStatusList(cri);
        model.addAttribute("getStatusList", getStatusList);
        model.addAttribute("Criteria", cri);
        return "DefectStatusList";
    }

    // 생산작업관리
    @GetMapping(value = "ProcessList")
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
}
