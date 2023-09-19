package com.idea.board.controller;

import com.idea.board.dto.CommentDTO;
import com.idea.board.dto.CommentLikeDTO;
import com.idea.board.dto.CommentResponseDTO;
import com.idea.board.service.CommentLikeService;
import com.idea.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.xml.stream.events.Comment;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    CommentLikeService commentLikeService;
    @PostMapping("/save")
    public ResponseEntity save(@ModelAttribute CommentDTO commentDTO) {
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }

    @PostMapping("/like")
    public ResponseEntity save(@ModelAttribute CommentLikeDTO commentLikeDTO, Model model){
        System.out.println("commentLikeDTO = " + commentLikeDTO);
        int check = commentLikeService.findLike(commentLikeDTO);
        if(check == 0) {
            commentLikeService.save(commentLikeDTO);
            commentService.updateLikeAmount(commentLikeDTO.getCommentId());
            CommentDTO commentDTO = new CommentDTO();
            commentDTO.setId(commentLikeDTO.getCommentId());
            commentDTO.setBoardId(commentLikeDTO.getBoardId());
            commentDTO.setLikeMemberJson(String.valueOf(commentLikeDTO.getMemberId()));
            System.out.println("commentDTO = " + commentDTO);
            commentService.updateLikeMemberJson(commentDTO);
        }else{
            CommentDTO commentDTO = new CommentDTO();
            commentDTO.setId(commentLikeDTO.getCommentId());
            commentDTO.setBoardId(commentLikeDTO.getBoardId());
            commentDTO.setLikeMemberJson(String.valueOf(commentLikeDTO.getMemberId()));
            commentLikeService.delete(commentLikeDTO);
            commentService.deleteLikeAmount(commentLikeDTO.getCommentId());
            commentService.deleteLikeMemberJson(commentDTO);
        }

        List<CommentDTO> commentDTOList = commentService.findAll(commentLikeDTO.getBoardId()); // 댓글 리스트 가져오는 예시
        List<CommentLikeDTO> commentLikeDTOList = commentLikeService.findAll(commentLikeDTO.getCommentId());
        CommentResponseDTO responseDTO = new CommentResponseDTO();

        CommentDTO commentDTO = commentService.findById(commentLikeDTO.getCommentId());
        return new ResponseEntity<>(commentDTO, HttpStatus.OK);
    }



}