package com.idea.board.repository;

import com.idea.board.dto.CommentDTO;
import com.idea.board.dto.CommentLikeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return sql.selectList("Comment.findAll", boardId);
    }

    public CommentDTO findById(Long id) {
        return sql.selectOne("Comment.findById",id);
    }

    public void updateLikeAmount(Long commentId) {
        sql.update("Comment.updateLikeAmount", commentId);
    }

    public void deleteLikeAmount(Long commentId) {
        sql.update("Comment.deleteLikeAmount", commentId);
    }

    public void updateLikeMemberJson(CommentDTO commentDTO) {
        sql.update("Comment.updateLikeMemberJson",commentDTO);
    }
    public void deleteLikeMemberJson(CommentDTO commentDTO) {
        sql.update("Comment.updateLikeMemberJson",commentDTO);
    }
}
