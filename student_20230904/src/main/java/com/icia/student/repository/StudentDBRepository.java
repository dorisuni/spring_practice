package com.icia.student.repository;

import com.icia.student.dto.StudentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentDBRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(StudentDTO studentDTO) {
        sql.insert("Student.save", studentDTO);
    }

    public List<StudentDTO> findAll() {
        return sql.selectList("Student.findAll");
    }

    public StudentDTO findById(Long id) {
        return sql.selectOne("Student.findById", id);
    }
}
