package kr.co.urun.controller;

import kr.co.urun.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
    private MemberService memberService;

    @GetMapping(value = {"", "/"})
    public String home() {
        return "redirect:/signIn";
    }
    @GetMapping("/signIn")
    public String signIn() {
        return "signIn";
    }
    @GetMapping("/signInOk")
    public String signInOk() {
        return "signIn";
    }
    @GetMapping("/signUp")
    public String signUp() {
        return "signUp";
    }
    @GetMapping("/signUpCheck")
    public String signUpCheck() {
        return "signUp";
    }

}
