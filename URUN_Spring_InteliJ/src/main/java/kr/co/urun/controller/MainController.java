package kr.co.urun.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/main")
public class MainController {
    @RequestMapping("/")
    public String home() {
        return "redirect:/signIn";
    }
    @RequestMapping("/signIn")
    public String signIn() {
        return "signIn";
    }
    @PostMapping("/signUp")
    public String signUp() {
        return "signUp";
    }

}
