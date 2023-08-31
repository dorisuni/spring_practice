package repository;

import dto.MemberDTO;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class MemberRepository {
    Scanner scanner = new Scanner(System.in);

    List<MemberDTO> memberDTOList = new ArrayList<>();

    public boolean save(MemberDTO memberDTO) {
        return memberDTOList.add(memberDTO);
    }


    public MemberDTO login(String memberEmail, String memberPassword) {
        for (MemberDTO memberDTO: memberDTOList) {
            if (memberEmail.equals(memberDTO.getMemberEmail()) && memberPassword.equals(memberDTO.getMemberPassword())) {
                return memberDTO;
            }
        }
        return null;
    }

    public boolean emailCheck(String memberEmail) {
        for (MemberDTO memberDTO: memberDTOList) {
            if (memberEmail.equals(memberDTO.getMemberEmail())) {
                // 일치하는 값이 있다는 것이므로 사용 불가능
                return false;
            }
        }
        // 일치하는 것을 못찾았으므로 사용 가능
        return true;
    }

    public List<MemberDTO> findAll() {
        return memberDTOList;
    }

    public boolean update(String loginEmail, String updateMobile) {
        for (MemberDTO memberDTO: memberDTOList) {
            if (loginEmail.equals(memberDTO.getMemberEmail())) {
                memberDTO.setMemberMobile(updateMobile);
                return true;
            }
        }
        return false;
    }

    public boolean delete(Long id){
        for (int i=0; i<memberDTOList.size(); i++) {
            if (id.equals(memberDTOList.get(i).getId())){
                memberDTOList.remove(i);
                return true;
            }
        }
        System.out.println("없는 회원입니다.");
        return false;
    }
}