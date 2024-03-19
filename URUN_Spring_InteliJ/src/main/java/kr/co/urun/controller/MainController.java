package kr.co.urun.controller;

import jakarta.servlet.http.HttpSession;
import kr.co.urun.dto.MemberDTO;
import kr.co.urun.dto.NoticeDTO;
import kr.co.urun.dto.ProductionDTO;
import kr.co.urun.service.MainService;
import kr.co.urun.service.MemberService;
import kr.co.urun.service.ProductionService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.extern.log4j.Log4j;

import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MainService mainService;

    @Autowired
    private ProductionService productionService;

    @GetMapping(value = {"", "/", "/main"})
    public String home(HttpSession session, Model model) {
        String MEMBER_ID = (String) session.getAttribute("member");
        if(MEMBER_ID!=null){
            MemberDTO selectMemberInfo = memberService.selectMemberInfo(MEMBER_ID);
            model.addAttribute("selectMemberInfo", selectMemberInfo);

            List<NoticeDTO> selectNoticeFetch = mainService.selectNoticeFetch();
            model.addAttribute("selectNoticeFetch", selectNoticeFetch);

            List<ProductionDTO> selectStatusList = productionService.getStatusLists();
            model.addAttribute("selectStatusList", selectStatusList);

            return "main";
        }
        return "redirect:/signIn";
    }



}
