package com.icia.study.controller;

import com.icia.study.dto.StudyDTO;
import com.icia.study.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StudyController {
    @Autowired
    private StudyService studyService;

    @GetMapping("/req1")
    public String req1() {
        // StudyService 클래스의 req1메서드 호출
        studyService.req1();
        return "index";
    }

    // req2 메서드에서 q1,q2값 출력하기

    @GetMapping("/req2")
    public String req2(@RequestParam("p1") String p1, @RequestParam("p2") String p2) {
        studyService.req2(p1, p2);
        return "index";
    }


    @PostMapping("/req3")
    public String req3(@ModelAttribute StudyDTO studyDTO) {
        studyService.req3(studyDTO);
        return "index";
    }

    @GetMapping("/req4")
    public String req4(Model model) {
        StudyDTO studyDTO = studyService.req4();
        model.addAttribute("study",studyDTO);
        return "req4";
    }

    @GetMapping("/req5")
    public String req5(Model model) {
        List<StudyDTO> studyDTOList = studyService.req5();
        model.addAttribute("studyDTOList",studyDTOList);
        return "req5";
    }

    @PostMapping("/req6")
    public String req6(@ModelAttribute StudyDTO studyDTO){
        System.out.println("studyDTO = " + studyDTO);
        return "index";
    }

}

