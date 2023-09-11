package com.icia.board.service;

import com.icia.board.dto.BoardDTO;
import com.icia.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    BoardRepository boardRepository;

    public void save(BoardDTO boardDTO){
        boardRepository.save(boardDTO);
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
}
