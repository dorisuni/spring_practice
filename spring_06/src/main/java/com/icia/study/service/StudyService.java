package com.icia.study.service;

import com.icia.study.dto.StudyDTO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StudyService {
    public void req1() {
        System.out.println("StudyService.req1");
    }

    public void req2(String p1, String p2) {
        System.out.println("StudyService.req2");
        System.out.println("p1 = " + p1 + " q2 = " + p2);
    }

    public void req3(StudyDTO studyDTO) {
        System.out.println("StudyService.req3");
        System.out.println("studyDTO = " + studyDTO);
    }

    public StudyDTO req4() {
        StudyDTO studyDTO = new StudyDTO();
        studyDTO.setP1("p1데이터");
        studyDTO.setP2("p2데이터");
        studyDTO.setP3(100);
        return studyDTO;
    }

    public List<StudyDTO> req5() {
        List<StudyDTO> studyDTOList = new ArrayList<>();
        for (int i = 0; i <= 10; i++) {
            StudyDTO studyDTO = new StudyDTO();
            studyDTO.setP1("p1값" + i);
            studyDTO.setP2("p2값" + i);
            studyDTO.setP3(i);
            studyDTOList.add(studyDTO);
        }
        return studyDTOList;
    }
    /*
     * req4메서드
     * StudyDTO 객체를 리턴한다.
     * index.jsp에서 req4 주소를 요청하면
     * 서비스 클래스의 req4가 리턴한 객체 데이터 값을 req4.jsp에 출력함.
     *
     * req5 메서드
     * StudyDTO가 담긴 리스트 객체를 리턴한다.
     * index.jsp에서 req5주소를 요청하면
     * 서비스 클래스의 req5메서드가 리턴한 객체 데이터 값을 req5.jsp에 출력함.
     */


}
