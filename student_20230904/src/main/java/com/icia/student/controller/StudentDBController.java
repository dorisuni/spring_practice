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
    public String save(@ModelAttribute StudentDTO studentDTO, Model model) {
        System.out.println("studentDTO = " + studentDTO);
        studentDBService.save(studentDTO);
        model.addAttribute("student",studentDTO);
        return "index";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<StudentDTO> studentDTOList = studentDBService.findAll();
        System.out.println("studentDTOList = " + studentDTOList);
        model.addAttribute("studentList", studentDTOList);
        return "list";
    }

    @GetMapping("/find")
    public String findById(@RequestParam("id") Long id, Model model) {
        StudentDTO studentDTO = studentDBService.findById(id);
        model.addAttribute("student", studentDTO);
        return "detail";
    }
}
