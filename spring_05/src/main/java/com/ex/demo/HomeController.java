package com.ex.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
        return "demo2";
    }

}
