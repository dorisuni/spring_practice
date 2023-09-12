package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.CommentDTO;
import com.icia.board.dto.PageDTO;
import com.icia.board.service.BoardService;
import com.icia.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    // 시작 페이지 - index.jsp

    @Autowired
    BoardService boardService;


    // 글 작성 페이지 출력 - boardSave.jsp (GET)
    @GetMapping("/save")
    public String saveForm() {
        return "boardPages/boardSave";
    }

    // 글 작성 처리 (POST)
    @PostMapping("/save1")
    public String saveBoard(@ModelAttribute BoardDTO boardDTO) throws IOException {
        System.out.println("boardDTO = " + boardDTO);
//        boardService.save(boardDTO);
        return "redirect:/";
    }

//     상세 조회 - boardDetail.jsp (GET)
    @GetMapping("/detail")
    public String viewBoardDetail(@RequestParam("id") Long id, Model model) {
        // 글 상세 조회 로직을 구현
        System.out.println(id);
        BoardDTO boardDTO = boardService.findById(id);
        System.out.println("boardDTO = " + boardDTO);
        boardDTO.setBoardHits(boardDTO.getBoardHits()+1);
        boardService.incrementBoardHits(id);
        model.addAttribute("board", boardDTO);
        return "boardDetail";
    }

    // 글 삭제 (GET)
    @GetMapping("/delete/{id}")
    public String deleteBoard(@PathVariable Long id) {
        // 글 삭제 로직을 구현
        // 삭제 후, 리다이렉트 또는 결과 페이지 반환
        boardService.delete(id);
        return "redirect:/";
    }

    // 수정 화면 출력 - boardUpdate.jsp (GET)
    @GetMapping("/update")
    public String showBoardUpdatePage(@RequestParam("id") Long id, Model model) {
        // 수정할 글 정보를 가져와서 model에 추가
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardUpdate";
    }

    // 수정 처리 (POST)
    @PostMapping("/update")
    public String updateBoard(@ModelAttribute BoardDTO boardDTO, Model model) {
        // 글 수정 로직을 구현
        // 수정 후, 리다이렉트 또는 결과 페이지 반환
        System.out.println("boardDTO = " + boardDTO);
        boardService.update(boardDTO);
        model.addAttribute("id",boardDTO.getId());
        return "redirect:/board/detail";
    }

    // 검색 - boardList.jsp (GET)
    @GetMapping("/search")
    public String searchBoard(@RequestParam String searchType, @RequestParam String q, Model model) {
        // 검색 로직을 구현
//        List<BoardDTO> searchResults = ...; // 검색 결과를 가져오는 로직을 구현해야 함
//        model.addAttribute("searchResults", searchResults);
        return "boardList";
    }

    // 페이징 처리 - boardPaging.jsp (GET)
    @GetMapping("/paging")
    public String boardPaging(@ModelAttribute PageDTO pageDTO, Model model) {
        List<BoardDTO> boardDTOList = boardService.getListPage(pageDTO);
        model.addAttribute("pageDTO",pageDTO);
        model.addAttribute("boardList",boardDTOList);
        System.out.println("boardDTOList = " + boardDTOList);
        return "index";
    }




    // 댓글 작성 (POST)
    @PostMapping("/comment/save")
    public String saveComment(@ModelAttribute CommentDTO commentDTO) {
        // 댓글 저장 로직을 구현
        // 저장 성공 후, 리다이렉트 또는 결과 페이지 반환
        return "redirect:/board/";
    }
}
