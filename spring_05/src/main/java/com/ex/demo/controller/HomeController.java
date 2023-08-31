package com.ex.demo.controller;

import com.ex.demo.dto.DemoDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/demo1")
    public String demo1() {
        System.out.println("demo1로 이동합니다.");
        return "demo1"; //->해당하는 jsp로 이동하라는 뜻.
    }

    @PostMapping("/demo2")
    public String req3(@RequestParam("param1") String param1,@RequestParam("param2") String param2){
        System.out.println("param1 = " + param1 + " param2 = " + param2);
        DemoDTO demoDTO = new DemoDTO();
        //스프링 사용 전에는 dto를 만들어서 셋터메소드
        return "demo2";
    }

    @PostMapping("/demo3")
    //모델어트리뷰트 어노테이션 역할은 기본 전달된 파라미터를 필드에 객체로 담아버림.
    public String demo3(@ModelAttribute DemoDTO demoDTO){
        System.out.println("demoDTO = " + demoDTO);
        return "index";
    }
}
