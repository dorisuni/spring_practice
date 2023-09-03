package com.icia.demo.controller;

import com.icia.demo.dto.DemoDTO;
import com.icia.demo.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class DemoController {
    // DemoService 클래스 객체 주입
    @Autowired
    private DemoService demoService;

    // demo1 주소 요청을 받아서 demo1.jsp를 출력
    @GetMapping("/demo1")
    public String demo1() {
        return "demo1";
    }

    @GetMapping("/demo2")
    public String demo2() {
        return "demo2";
    }

    @GetMapping("/req1")
    public String req1(@RequestParam("name") String name,
                       @RequestParam("age") int age,
                       Model model) {
        DemoDTO demoDTO = demoService.req1(name, age);
        model.addAttribute("demo", demoDTO);
        return "req1";
    }

    @PostMapping("/req2")
    public String req2(@ModelAttribute DemoDTO demoDTO, Model model) {
        System.out.println("demoDTO = " + demoDTO);
        List<DemoDTO> demoDTOList = demoService.req2(demoDTO);
        model.addAttribute("demoList", demoDTOList);
        return "req2";
    }
}

