package kr.co.urun.controller;

import jakarta.servlet.http.HttpSession;
import kr.co.urun.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Log4j
@AllArgsConstructor
public class MemberController {

    @Autowired
    private MemberService memberService;

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
    public String signIn(String MEMBER_ID, String MEMBER_PW, HttpSession session) {
        String member = memberService.selectMember(MEMBER_ID, MEMBER_PW);
        if(member == null){ // 로그인 실패
            return "redirect:/signIn";
        }
        session.setAttribute("member", member);

        return "redirect:/main";
    }

    @GetMapping("/logOut")
    public String logOut(HttpSession session) {
        session.invalidate();
        return "redirect:/signIn";
    }

    @GetMapping("/signUp")
    public String signUp() {
        return "signUp";
    }
}
