package com.idea.board.service;

import com.idea.board.dto.CommentDTO;
import com.idea.board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return commentRepository.findAll(boardId);
    }

    public CommentDTO findById(Long id) {
        return commentRepository.findById(id);
    }


    public void updateLikeAmount(Long commentId) {
        commentRepository.updateLikeAmount(commentId);
    }

    public void deleteLikeAmount(Long commentId) {
        commentRepository.deleteLikeAmount(commentId);
    }
}
