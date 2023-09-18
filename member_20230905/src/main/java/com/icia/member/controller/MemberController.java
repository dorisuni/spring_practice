package com.icia.member.controller;

import com.icia.member.dto.MemberDTO;
import com.icia.member.service.MemberService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
        private MemberService memberService;

    @GetMapping("/save")
    public String save(){
        return "memberSave";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        memberService.save(memberDTO);
        return "memberLogin";
    }

    @GetMapping("/login")
    public String login() {
        return "memberLogin";
    }

    @PostMapping("/login")
    public String login(@RequestParam("memberEmail") String memberEmail, @RequestParam("memberPassword") String memberPassword, Model model, HttpSession session)
     {
         MemberDTO memberDTO = memberService.loginByEmail(memberEmail);
         System.out.println("memberDTO1 = " + memberDTO);
         if (memberDTO != null && memberDTO.getMemberPassword().equals(memberPassword)) {
             // 로그인 성공
             model.addAttribute("member",memberDTO);
             //로그인 성공시 사용자의 이메일을 세션에 저장
             session.setAttribute("loginEmail",memberDTO.getMemberEmail());

             return "memberMain";
         } else {
             // 로그인 실패
             model.addAttribute("error", "로그인 실패");
             return "memberLogin"; // 로그인 폼으로 다시 이동
         }
    }

    @GetMapping("/members")
    public String members(Model model) {
        List<MemberDTO> memberDTOList =memberService.findAll();
        model.addAttribute("memberList",memberDTOList);
        return "memberList";
    }

    @GetMapping("/member")
    public String member(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        System.out.println("memberDTO = " + memberDTO);
        model.addAttribute("member",memberDTO);
        return "memberDetail";
    }

    @GetMapping("/member-ajax")
    public void member_ajax() {

    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id,Model model) {
        memberService.delete(id);
        return "redirect:/members";

    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Long id,Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member",memberDTO);
        return "memberUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO,Model model) {
        memberService.update(memberDTO);
        MemberDTO memberDTO1 = memberService.findById(memberDTO.getId());
        model.addAttribute("member",memberDTO1);
        return "memberDetail";
    }
    @PostMapping("/duplicate-check")
    public void duplicate_check(){

    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        //해당 파라미터만 없앨 경우
//        session.removeAttribute("loginEmail");
        //세션 전체를 없앨 경우
        session.invalidate();
        return "redirect:/";

    }

}
