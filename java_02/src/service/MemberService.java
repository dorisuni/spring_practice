package service;

import dto.MemberDTO;
import repository.MemberRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class MemberService {
    Scanner scanner = new Scanner(System.in);
    MemberRepository memberRepository = new MemberRepository();
    // 로그인 여부를 판단하는 static 필드
    private static String loginEmail = null;

    public void save() {
        boolean checkResult = false;
        // do while 안에서 선언하면 while문을 벗어났을 때 사용하지 못하여 전역변수로 선언
        String memberEmail = null;
        do {
            System.out.print("이메일: ");
            memberEmail = scanner.next();
            // 사용가능: true, 중복: false 리턴
            checkResult = memberRepository.emailCheck(memberEmail);
            if (checkResult) {
                System.out.println("사용 가능한 이메일 입니다.");
            } else {
                System.out.println("이미 사용 중인 이메일 입니다.");
            }
        } while (!checkResult); // 사용가능이면 비밀번호를 받아야 하므로 반복문 종료
        System.out.print("비밀번호: ");
        String memberPassword = scanner.next();
        System.out.print("이름: ");
        String memberName = scanner.next();
        System.out.print("전화번호: ");
        String memberMobile = scanner.next();
        MemberDTO memberDTO = new MemberDTO(memberEmail, memberPassword, memberName, memberMobile);
        boolean result = memberRepository.save(memberDTO);
        if (result) {
            System.out.println("회원가입 성공");
        } else {
            System.out.println("회원가입 실패");
        }
    }

    public void login() {
        System.out.print("이메일: ");
        String memberEmail = scanner.next();
        System.out.print("비밀번호: ");
        String memberPassword = scanner.next();
        MemberDTO loginResult = memberRepository.login(memberEmail, memberPassword);
        if (loginResult != null) {
            System.out.println("로그인 성공");
            loginEmail = memberEmail;
        } else {
            System.out.println("로그인 실패");
        }
    }

    public void findAll() {
        List<MemberDTO> memberDTOList = memberRepository.findAll();
        for (MemberDTO memberDTO: memberDTOList) {
            System.out.println("memberDTO = " + memberDTO);
        }
    }

    public void update() {
        if (loginEmail == null) {
            System.out.println("로그인 해주세요");
        } else {
            System.out.print("수정 전화번호: ");
            String updateMobile = scanner.next();
            boolean result = memberRepository.update(loginEmail, updateMobile);
            if (result) {
                System.out.println("수정 완료");
            } else {
                System.out.println("수정 실패");
            }
        }
    }

    public void delete(){
        findAll();
        System.out.print("삭제할 회원의 id를 입력해 주세요.>");
        Long deleteId = scanner.nextLong();
        boolean result = memberRepository.delete(deleteId);
        if (result) {
            System.out.println("삭제 완료");
        } else {
            System.out.println("삭제 실패");
        }
    }

    public void logout(){
        System.out.println("로그아웃을 진행합니다.");
        loginEmail = null;
    }

}