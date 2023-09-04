package com.icia.student.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class StudentDTO {
    private Long id;
    private String studentNumber;
    private String studentName;
    private String studentMajor;
    private String studentMobile;
}
