package com.icia.student.controller;

import com.icia.student.dto.StudentDTO;
import com.icia.student.service.StudentDBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StudentDBController {
    @Autowired
    private StudentDBService studentDBService;

    @GetMapping("/save")
    public String save() {
        return "save";
    }

    @PostMapping("/save1")
    public String save(@ModelAttribute StudentDTO studentDTO) {
        System.out.println("studentDTO = " + studentDTO);
        studentDBService.save(studentDTO);
        return "index";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<StudentDTO> studentDTOList = studentDBService.findAll();
        System.out.println("studentDTOList = " + studentDTOList);
        return "list";
    }

    @GetMapping("/find")
    public String findById(@RequestParam("id") Long id) {
        StudentDTO studentDTO = studentDBService.findById(id);
        return "detail";
    }

//    @GetMapping("/delete")
//    public String delete(@RequestParam("id") Long id){
//        studentDBService.delete(id);
//        return "list";
//    }
//
//    @PostMapping("/update")
//    public String update(@ModelAttribute StudentDTO studentDTO){
//        studentDBService.update(studentDTO);
//        return "list";
//    }
//
//    @GetMapping("/update")
//    public String update(@RequestParam("id") Long id){
//        StudentDTO studentDTO = studentDBService.findById(id);
//        return "update";
//    }


}
