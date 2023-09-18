package com.idea.board.controller;

import com.idea.board.dto.CommentDTO;
import com.idea.board.dto.CommentLikeDTO;
import com.idea.board.service.CommentLikeService;
import com.idea.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
    public ResponseEntity save(@ModelAttribute CommentLikeDTO commentLikeDTO){
        CommentLikeDTO checkDTO = commentLikeService.find(commentLikeDTO);
        if(checkDTO==null) {
            commentLikeService.save(commentLikeDTO);
        }else{
            commentLikeService.delete(commentLikeDTO);
        }
        List<CommentLikeDTO> commentLikeDTOList = commentLikeService.findAll(commentLikeDTO.getCommentId());
        return new ResponseEntity<>(commentLikeDTOList, HttpStatus.OK);
    }



}