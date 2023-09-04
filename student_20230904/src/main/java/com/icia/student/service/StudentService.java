package com.icia.student.service;

import com.icia.demo.dto.DemoDTO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StudentService {

    /*
    2. 컨트롤러에서는 이 값을 받아서 서비스의 req1 메서드로 전달함
    3. 서비스에서는 전달받은 name, age를 DTO 객체에 담아서 리턴함
    4. 컨트롤러에서 리턴받은 DTO객체를 model에 담아서 req1.jsp로 가져가고 req1.jsp에서 값을 출력함.
     */
    public DemoDTO req1(String name, int age) {
        DemoDTO demoDTO = new DemoDTO();
        demoDTO.setName(name);
        demoDTO.setAge(age);
        return demoDTO;
    }

    // 입력: DTO
    // 출력: List
    public List<DemoDTO> req2(DemoDTO demoDTO) {
        System.out.println("demoDTO = " + demoDTO);
        List<DemoDTO> demoDTOList = new ArrayList<>();
        demoDTOList.add(demoDTO);
        return demoDTOList;
    }

}
