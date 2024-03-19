package kr.co.urun.controller;

import jakarta.servlet.http.HttpSession;
import kr.co.urun.dto.MemberDTO;
import kr.co.urun.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    // 회원가입
    @GetMapping("/signUp")
    public String toSignUpPage(){
        return "signUp";
    }

    // Id 중복 확인
    @PostMapping("/idCheck")
    @ResponseBody
    public ResponseEntity<Boolean> idCheck(String MEMBER_ID){
        boolean result = true;

        if(MEMBER_ID.trim().isEmpty()) {
            log.info("MEMBER_ID : " + MEMBER_ID);
            result = false;
        } else {
            if (memberService.selectMemberId(MEMBER_ID)) {
                result = false;
            } else {
                result = true;
            }
        }

        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    // 회원가입 전송
    @PostMapping("/signUp")
    public String signUp(MemberDTO memberDTO) {
        try{
            memberService.insertMember(memberDTO);
        } catch (DuplicateKeyException e){
            return "redirect:/signUp?error_code=-1";
        } catch (Exception e){
            return "redirect:/signUp?error_code=-99";
        }
        return "redirect:/signIn";
    }

    // 로그아웃
    @GetMapping("/logOut")
    public String logOut(HttpSession session) {
        session.invalidate();
        return "redirect:/signIn";
    }

}
