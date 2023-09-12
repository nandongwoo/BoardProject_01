package com.icia.board.dto;

import lombok.Data;

import java.sql.Timestamp;
@Data
public class CommentDTO {
    private Long id;
    private String commentWriter;
    private String commentContents;
    private Long boardId;
    private String commentCreateDate;
}
