package service;

import dto.StudentDTO;
import respository.StudentRepository;

import java.util.List;
import java.util.Scanner;

public class StudentService {
    Scanner scanner = new Scanner(System.in);
    StudentRepository studentRepository = new StudentRepository();

    // 학생등록 메서드
    // 매개변수 없음.
    // 리턴 없음.
    // 메서드 이름: save()
    // 실행내용
    // 스캐너로 이름(studentName), 학과(studentMajor), 전화번호(studentMobile)를 입력받고
    // 입력값을 DTO객체에 담아서 StudentRepository의 save() 메서드로 전달
    public void save() {
        System.out.println("이름: ");
        String studentName = scanner.next();
        System.out.println("학과: ");
        String studentMajor = scanner.next();
        System.out.println("전화번호: ");
        String studentMobile = scanner.next();
        // DTO 객체
//        StudentDTO studentDTO = new StudentDTO();
//        studentDTO.setStudentName(studentName);
//        studentDTO.setStudentMajor(studentMajor);
//        studentDTO.setStudentMobile(studentMobile);
        StudentDTO studentDTO = new StudentDTO(studentName, studentMajor, studentMobile);

        // DTO 객체를 StudentRepository의 save() 메서드로 전달하여 리턴을 boolean으로 받음.
        boolean result = studentRepository.save(studentDTO);
        // repository의 save() 내용
        // 넘겨받은 dto 객체를 리스트에 추가하고 추가하면 true 리턴
        if (result) {
            System.out.println("등록 성공");
            System.out.println(studentRepository.findAll());
        } else {
            System.out.println("등록 실패");
        }
    }

    public void findAll() {
        // - Repository의 findAll 메서드를 호출하여 리스트를 리턴받음.
        List<StudentDTO> studentDTOList = studentRepository.findAll();
        for (StudentDTO studentDTO : studentDTOList) {
            System.out.println("studentDTO = " + studentDTO);
        }
//        for (int i=0; i<studentDTOList.size(); i++) {
//            System.out.println(studentDTOList.get(i));
//        }
    }

    public void findById() {
        System.out.println("StudentService.findById");
        // 조회기능 선택시 목록을 먼저 보여줌
        // 서비스클래스에서 정의한 findAll() 메서드 호출
        findAll();

        // 조회할 id 입력
        System.out.print("조회 id: ");
        long id = scanner.nextLong();
        // 입력받은 id를 repository로 넘겨서 DTO 객체를 리턴받음.
        StudentDTO studentDTO = studentRepository.findById(id);
        // 조회결과 출력
        if (studentDTO == null) {
            System.out.println("찾는 정보가 없습니다!");
        } else {
            System.out.println("조회학생 정보: " + studentDTO);
        }
    }

    public void delete() {
        findAll();
        // 삭제할 id 입력
        System.out.print("삭제 id: ");
        long id = scanner.nextLong();
        studentRepository.delete(id);
    }

    /*
        findAll() 메서드
        Main에서 3번 선택시 호출되는 메서드
        매개변수 리턴 없음.
        실행내용
          - Repository의 findAll 메서드를 호출하여 리스트를 리턴받음.
          - 리턴받은 리스트에 담긴 데이터를 for문을 이용하여 출력함.
     */

}