package com.icia.student.service;

import com.icia.student.dto.StudentDTO;
import com.icia.student.repository.StudentDBRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentDBService {
    @Autowired
    private StudentDBRepository studentDBRepository;

    public void save(StudentDTO studentDTO) {
        studentDBRepository.save(studentDTO);
    }

    public List<StudentDTO> findAll() {
//        List<StudentDTO> studentDTOList = studentDBRepository.findAll();
//        return studentDTOList;
        return studentDBRepository.findAll();
    }

    public StudentDTO findById(Long id) {
        return studentDBRepository.findById(id);
    }

//    public void update(StudentDTO studentDTO){
//        studentDBRepository.update(studentDTO);
//    }
//
//    public void delete(Long id) {
//        studentDBRepository.delete(id);
//    }

}
