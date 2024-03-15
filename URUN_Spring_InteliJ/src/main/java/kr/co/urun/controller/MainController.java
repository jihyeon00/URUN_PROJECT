package kr.co.urun.controller;

import jakarta.servlet.http.HttpSession;
import kr.co.urun.service.MainService;
import kr.co.urun.service.MemberService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MainService mainService;

    @GetMapping(value = {"", "/"})
    public String home(HttpSession session, Model model) {
        String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
        return "redirect:/signIn";
    }

    // 멤버 조회 : signIn - 로그인 되지 않은 상태
    @GetMapping("/signIn")
    public String toSignInPage(HttpSession session){
        String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
        if(MEMBER_ID!=null){ // 로그인 된 상태
            return "redirect:/main";
        }
        return "signIn"; // 로그인 되지 않은 상태
    }
    // 멤버 조회 : signIn - 로그인
    @PostMapping("/signIn")
    public String signIn(
            @RequestParam(value = "MEMBER_ID") String MEMBER_ID,
            @RequestParam(value = "MEMBER_PW") String MEMBER_PW,
            HttpSession session) {
        String memberInfo = memberService.selectMemberInfo(MEMBER_ID, MEMBER_PW);
        if(memberInfo == null){ // 로그인 실패
            return "redirect:/signIn";
        }
        session.setAttribute("memberInfo", memberInfo);

        return "redirect:/main";
    }

    @GetMapping("/signUp")
    public String signUp() {
        return "signUp";
    }

}
