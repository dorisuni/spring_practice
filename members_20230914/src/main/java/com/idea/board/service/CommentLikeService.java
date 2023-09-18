package com.idea.board.service;

import com.idea.board.dto.CommentDTO;
import com.idea.board.dto.CommentLikeDTO;
import com.idea.board.repository.CommentLikeRepository;
import com.idea.board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentLikeService {
    @Autowired
    private CommentLikeRepository commentLikeRepository;

    public void save(CommentLikeDTO commentLikeDTO) {
        commentLikeRepository.save(commentLikeDTO);
    }

    public void delete(CommentLikeDTO commentLikeDTO){
        commentLikeRepository.delete(commentLikeDTO);
    }

    public List<CommentLikeDTO> findAll(Long commentId) {
        return commentLikeRepository.findAll(commentId);
    }

    public CommentLikeDTO find(CommentLikeDTO commentLikeDTO){
        return commentLikeRepository.find(commentLikeDTO);
    }

}
