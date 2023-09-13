package com.icia.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
    private int offset;
    private int page = 1;
    private int pageSize = 10;
    private String key;
    private String query="";




}
