package com.study.basic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {
    @GetMapping("/")
    public String welcome() {
        return "welcome";
    }

    //req1 요청을 처리하는 메서드
    //링크를 타고 오는건무조건 get
//    @GetMapping("/req1")
//    public String req1(){
//        System.out.println("HomeController.req1");
//        return "req1";

    //겟보다 포괄적인것
    @RequestMapping(method = RequestMethod.GET, value = "/req1")
    public String req1() {
        System.out.println("HomeController.req1");
        return "req1";
    }

    @GetMapping("/req2")
    //파라미터이름 = 변수이름 일 경우 파라미터이름 생략 가능
    //파라미터 이름 변수이름을 동일하게 하는게 일반적임.
    public String req2(@RequestParam("q1") String q1, @RequestParam("q2") int q2) {
        System.out.println("q1 = " + q1 + ", q2 = " + q2);
        return "welcome"; //->해당하는 jsp로 이동하라는 뜻.
    }

//    @GetMapping("/req3")
//    public String req3(@RequestParam("p1") String p1, @RequestParam("p2") String p2) {
//        System.out.println("p1 = " + p1 + " ,p2= " + p2);
//        return "welcome";
//    }

    @PostMapping("/req3")
    public String req3(@RequestParam("p1") String p1,@RequestParam("p2") String p2){
        System.out.println("p1 = " + p1 + " p2 = "+ p2);
        return "welcome";
    }
}

