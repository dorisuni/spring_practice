package main;

import service.StudentService;

import java.util.Scanner;

public class MainClass {
    // 스캐너를 이용하여
    // 1. 학생등록
    // 2. 학생상세조회
    // 3. 학생목록조회
    // 를 선택하는 코드를 작성합시다.
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        StudentService studentService = new StudentService();
        boolean run = true;
        while (run) {
            System.out.println("====== 학생관리 ======");
            System.out.println("1.회원가입 2.로그인 3.회원목록조회 4.정보수정 5.삭제 0.종료");
            System.out.println("선택>  ");
            int sel = scanner.nextInt();
            if (sel == 1) {
                System.out.println("회원가입 메뉴");
                studentService.save();
            } else if (sel == 2) {
                System.out.println("로그인 메뉴");


                studentService.findById();
                /*
                    service 의 findById 메서드를 호출함.

                    service의 findById
                    - id값을 입력받고 repository의 findById로 id값을 넘김
                    - 입력받은 id에 해당하는 학생 데이터를 리턴받음.
                    - 리턴받은 값을 출력함.
                 */
            } else if (sel == 3) {
                System.out.println("회원목록조회 메뉴");
                studentService.findAll();
            } else if (sel == 4) {
                System.out.println("정보수정 메뉴");
            } else if (sel == 5) {
                System.out.println("삭제 메뉴");
                studentService.delete();
            } else if (sel == 0) {
                System.out.println("종료");
            }
        }
    }
}
