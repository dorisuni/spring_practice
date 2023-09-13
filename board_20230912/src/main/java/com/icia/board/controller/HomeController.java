package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.PageDTO;
import com.icia.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    BoardService boardService;
    @GetMapping("/")
    String listBoards(Model model){

        PageDTO pageDTO = new PageDTO();
        pageDTO.setOffset(0);
        pageDTO.setKey("boardWriter");
        pageDTO.setQuery("");
        System.out.println("pageDTO = " + pageDTO);
        int total = boardService.getTotal(pageDTO);
        System.out.println("total = " + total);
        int totalEndPage = (int) Math.ceil((double) total /pageDTO.getPageSize());
        System.out.println("totalEndPage = " + totalEndPage);
        model.addAttribute("total",total);
        model.addAttribute("totalEndPage",totalEndPage);
        List<BoardDTO> boardDTOList = boardService.getListPage(pageDTO);
        model.addAttribute("boardList", boardDTOList);
        System.out.println("boardDTOList = " + boardDTOList);
        return "index";
    }
}
