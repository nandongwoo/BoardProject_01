package com.icia.board.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class BoardDTO {
    private Long id;
    private String boardWriter;
    private String boardPass;
    private String boardTitle;
    private String boardContents;
    private String createdAt;
    private int boardHits;
    private int fileAttached;
    private List<MultipartFile> boardFile; // 실제 파일을 주고받을 수있는 기능(스프링)

}
