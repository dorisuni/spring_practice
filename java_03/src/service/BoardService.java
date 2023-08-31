package service;

import dto.BoardDTO;
import repository.BoardRepository;

import java.util.List;
import java.util.Scanner;

public class BoardService {
    Scanner scanner = new Scanner(System.in);
    BoardRepository boardRepository = new BoardRepository();

    public void post() {
        System.out.println("제목을 입력하세요>");
        String boardTitle = scanner.nextLine();
        System.out.println("작성자를 입력하세요");
        String boardWriter = scanner.nextLine();
        System.out.println("내용을 입력하세요");
        String boardContents = scanner.nextLine();
        System.out.println("비밀번호를 입력하세요");
        String boardPass = scanner.nextLine();
        BoardDTO boardDTO = new BoardDTO(boardTitle, boardWriter, boardContents, boardPass);
        boolean result = boardRepository.post(boardDTO);
        if (result) {
            System.out.println("게시물 게시 성공!");
        } else {
            System.out.println("게시물 게시 실패!");
        }

    }

    public void findAll() {
        List<BoardDTO> boardDTOList = boardRepository.findAll();
        for (BoardDTO boardDTO : boardDTOList) {
            System.out.println("boardDTO = " + boardDTO);
        }
    }

    public void read() {
        System.out.print("조회할 글번호를 입력해 주세요.");
        Long id = scanner.nextLong();
        BoardDTO searchBoard = boardRepository.read(id);
        if (searchBoard == null) {
            System.out.println("해당 게시글이 존재하지 않습니다.");
        } else {
            String boardContents = searchBoard.getBoardContents();
            System.out.println(boardContents);
            int hits = searchBoard.getBoardHits();
            searchBoard.setBoardHits(hits + 1);
        }
    }

    public void update() {
        String forBugFix;
        System.out.print("수정할 글번호를 입력해 주세요.");
        Long id = scanner.nextLong();
        BoardDTO searchBoard = boardRepository.read(id);
        if (searchBoard == null) {
            System.out.println("해당 게시글이 존재하지 않습니다.");
        } else {
            forBugFix = scanner.nextLine();
            System.out.print("비밀번호를 입력해 주세요.");
            String boardPassword = scanner.nextLine();
            if (boardPassword.equals(searchBoard.getBoardPass())) {
                System.out.println(searchBoard);
                System.out.print("수정할 제목을 입력해 주세요.>");
                String boardHead = scanner.nextLine();
                System.out.print("수정할 내용을 입력해 주세요.");
                String boardContents = scanner.nextLine();
                boolean result = boardRepository.update(id, boardHead, boardContents);
                if (result) {
                    System.out.println("수정이 완료되었습니다.");

                } else {
                    System.out.println("수정 실패!");
                }
            }
        }

    }

    public void delete() {
        System.out.println("삭제를 원하는 글번호를 입력해 주세요.");
        Long id = scanner.nextLong();
        BoardDTO searchBoard = boardRepository.read(id);
        if (searchBoard == null) {
            System.out.println("해당 게시글이 존재하지 않습니다.");
        } else {
            System.out.print("비밀번호를 입력해 주세요.");
            String boardPassword = scanner.next();
            if (boardPassword.equals(searchBoard.getBoardPass())) {
                System.out.println("삭제가 완료되었습니다.");
                boolean result = boardRepository.delete(id);
                if (result) {
                    System.out.println("삭제가 완료되었습니다.");
                } else {
                    System.out.println("삭제 실패!");
                }
            }
        }
    }

    public void search(){
        System.out.println("원하는 글제목을 입력해 주세요.");
        String searchTitle = scanner.next();
        boolean find = false;
        List<BoardDTO> boardDTOList = boardRepository.findAll();
        for(int i=0;i<boardDTOList.size();i++){
            if(boardDTOList.get(i).getBoardTitle().equals(searchTitle)){
                System.out.println(boardDTOList.get(i));
                if(i==boardDTOList.size()-1){
                    find=true;
                }
            }
        }
        if(!find){
            System.out.println("해당하는 글이 존재하지 않습니다.");
        }
    }
}
