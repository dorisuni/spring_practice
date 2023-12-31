package com.icia.board.service;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.BoardFileDTO;
import com.icia.board.dto.PageDTO;
import com.icia.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class BoardService {

    @Autowired
    BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        /*
            - 파일 있다.
            1. fileAttached=1, board_table에 저장 후 id값 받아오기
            2. 파일원본 이름 가져오기
            3. 저장용 이름 만들기
            4. 파일 저장용 폴더에 파일 저장 처리
            5. board_file_table에 관련 정보 저장

            - 파일 없다.
                fileAttached=0, 나머지는 기존 방식과 동일
         */
        if (boardDTO.getBoardFile().get(0).isEmpty()) {
            // 파일 없다.
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        } else {
            // 파일 있다.
            boardDTO.setFileAttached(1);
            // 게시글 저장 후 id값 활용을 위해 리턴 받음.
            BoardDTO savedBoard = boardRepository.save(boardDTO);
            //파일이 여러개이기 때문에 반복문으로 파일 하나씩 꺼내서 저장 처리
            for(MultipartFile boardFile:boardDTO.getBoardFile()){
                // 파일 이름 가져오기
                String originalFilename = boardFile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);
                // 저장용 이름 만들기
                System.out.println(System.currentTimeMillis());
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);
                // BoardFileDTO 세팅
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFileName(originalFilename);
                boardFileDTO.setStoredFileName(storedFileName);
                boardFileDTO.setBoardId(savedBoard.getId());
                // 파일 저장용 폴더에 파일 저장 처리
                String savePath = "C:\\spring_img\\" + storedFileName;
                boardFile.transferTo(new File(savePath));
                // board_file_table 저장 처리
                boardRepository.saveFile(boardFileDTO);
            }

            // 파일만 따로 가져오기
//            List<MultipartFile> boardFile = boardDTO.getBoardFile();
            // 파일 이름 가져오기

        }


    }

    public List<BoardDTO> findAll(){
        return boardRepository.findAll();
    }

    public BoardDTO findById(Long id){
        return boardRepository.findById(id);
    }

    public void incrementBoardHits(Long id){
        boardRepository.incrementBoardHits(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public List<BoardDTO> getListPage(PageDTO pageDTO){
        pageDTO.setOffset((pageDTO.getPage()-1)* pageDTO.getPageSize());
        return boardRepository.getListPage(pageDTO);
    }

    public int getTotal(PageDTO pageDTO) {
        return boardRepository.getTotal(pageDTO);
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);

    }

    public List<BoardFileDTO> findFile(Long id) {
        return boardRepository.findFile(id);
    }
}
