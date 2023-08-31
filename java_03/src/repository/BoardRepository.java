package repository;

import dto.BoardDTO;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BoardRepository {

    Scanner scanner = new Scanner(System.in);
    List<BoardDTO> boardDTOList = new ArrayList<>();

    public boolean post(BoardDTO boardDTO) {
        return boardDTOList.add(boardDTO);
    }

    public List<BoardDTO> findAll() {

        return boardDTOList;
    }

    public BoardDTO read(Long id) {
        for (BoardDTO boardDTO : boardDTOList) {
            if (boardDTO.getId().equals(id)) {
                return boardDTO;
            }
        }
        return null;
    }

    public boolean update(Long id, String boardHead, String boardContents) {
        for (BoardDTO boardDTO1 : boardDTOList) {
            if (id.equals(boardDTO1.getId())) {
                boardDTO1.setBoardTitle(boardHead);
                boardDTO1.setBoardContents(boardContents);
                return true;
            }
        }
        return false;
    }

    public boolean delete(Long id) {
        for (int i = 0; i < boardDTOList.size(); i++) {
            if (id.equals(boardDTOList.get(i).getId())) {
                boardDTOList.remove(i);
                return true;
            }
        }
        return false;
    }
}
