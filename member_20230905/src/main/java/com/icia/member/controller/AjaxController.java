package com.icia.member.controller;

import com.icia.member.dto.MemberDTO;
import com.icia.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Member;
import java.util.List;

@Controller
public class AjaxController {
    @GetMapping("/ajax01")
    public String ajax01() {
        return "index";
    }

    @GetMapping("/ajax02")
    public String ajax02() {
        return "index";
    }

    @GetMapping(value = "/ajax03", produces = "application/text; charset=utf-8")
    public @ResponseBody String ajax03() {
        //리스폰스바디 어노테이션은 에이작스로리턴을줄때 여기서 바디가의마하는거는 http 통신에서의 바디 실제 데이터가 담기는 부분의
        //뭔가 추가를 하겠다 이런 의미이다. 그래서 이 부분이 의미하는것은 string 형태의 데이터를 바디에 실어서 응답 메시지를 보낸다.
        //그 데이터는 리턴한 값이 되는 것.
        String returnValue = "리턴 값 입니다.";
        return returnValue;
    }

    @GetMapping(value = "/ajax04", produces = "application/text; charset=utf-8")
    public @ResponseBody String ajax04(@RequestParam("p1") String p1, @RequestParam("p2") String p2) {
        System.out.println("p1 = " + p1 + ", p2" + p2);
        return "ok";
    }

    @PostMapping("/ajax06")
    public @ResponseBody String ajax06(@ModelAttribute MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        return "ok";
    }

    @Autowired
    private MemberService memberService;

    @GetMapping("/ajax07")
    public @ResponseBody MemberDTO ajax07() {
        MemberDTO memberDTO = memberService.findById(1L);
        return memberDTO;
    }

    @GetMapping("/ajax08")
    public @ResponseBody List<MemberDTO> ajax08() {
        List<MemberDTO> memberDTOList = memberService.findAll();
        return memberDTOList;
    }

    @PostMapping("/ajax09")
    public @ResponseBody MemberDTO ajax09(@RequestBody MemberDTO memberDTO) {
        //json형태의 바디를 보내는 것이므로 형태가 다름.
        System.out.println("memberDTO = " + memberDTO);
        return memberDTO;
    }


    @PostMapping(value = "/checkDuplicate", produces = "application/text; charset=utf-8")
    public ResponseEntity checkDuplicate(@RequestParam("memberEmail") String memberEmail) {
        MemberDTO memberDTO = memberService.loginByEmail(memberEmail);
        if (memberDTO == null) {
            return new ResponseEntity<>("사용가능한 이메일입니다.", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("이메일이 중복되었습니다!", HttpStatus.CONFLICT);
        }
    }
}


