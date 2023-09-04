package com.icia.student.service;

import com.icia.student.dto.StudentDTO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StudentService {


    public StudentDTO save(String studentNumber, String studentName, String studentMajor, String studentMobile) {
        StudentDTO studentDTO = new StudentDTO();
        studentDTO.setStudentNumber(studentNumber);
        studentDTO.setStudentName(studentName);
        studentDTO.setStudentMajor(studentMajor);
        studentDTO.setStudentMobile(studentMobile);
        return studentDTO;
    }

    // 입력: DTO
    // 출력: List
    public List<StudentDTO> list(StudentDTO studentDTO) {
        System.out.println("studentDTO = " + studentDTO);
        List<StudentDTO> studentDTOList = new ArrayList<>();
        studentDTOList.add(studentDTO);
        return studentDTOList;
    }

}
