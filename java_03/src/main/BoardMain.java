package main;

import service.BoardService;

import java.util.Scanner;

public class BoardMain {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        BoardService boardService = new BoardService();
        boolean run = true;
        while (run) {
            System.out.println("====== 게시판관리 ======");
            System.out.println("1.글작성 2.글목록 3.글조회 4.글수정 5.글삭제 6.검색 0.종료");
            System.out.print("선택>  ");
            int sel = scanner.nextInt();
            if (sel == 1) {
                System.out.println("글작성 메뉴");
                boardService.post();
            } else if (sel == 2) {
                System.out.println("글목록 메뉴");
                boardService.findAll();
            } else if (sel == 3) {
                System.out.println("글조회 메뉴");
                boardService.read();
            } else if (sel == 4) {
                System.out.println("글수정 메뉴");
                boardService.update();
            } else if (sel == 5) {
                System.out.println("글삭제 메뉴");
                boardService.delete();
            } else if (sel == 6) {
                System.out.println("검색 메뉴");
                boardService.search();
            } else if (sel == 0) {
                run=false;
                System.out.println("종료");
            }
        }
    }
}

