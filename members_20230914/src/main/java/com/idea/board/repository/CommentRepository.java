package com.idea.board.repository;

import com.idea.board.dto.CommentDTO;
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

    public List<CommentDTO> findById(CommentDTO commentDTO) {
        return sql.selectList("Comment.findById",commentDTO);
    }

    public void updateHits(Long id) {
        sql.update("Comment.updateLikeAmount", id);
    }

}
