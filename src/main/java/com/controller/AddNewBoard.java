package com.controller;

import com.model.BoardDAO;
import com.model.BoardDTO;

import javax.servlet.http.HttpServletRequest;

public class AddNewBoard implements RequestBoard{
    @Override
    public void boardWork(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        BoardDTO dto = new BoardDTO();

        dto.setId(request.getParameter("id"));
        dto.setTableName(request.getParameter("table"));
        dto.setName(request.getParameter("name"));
        dto.setCategory(request.getParameter("category"));
        dto.setSubject(request.getParameter("subject"));
        dto.setContents(request.getParameter("content"));

        dto.setHit(0);
        dto.setIp(request.getRemoteAddr());
        dao.insertBoard(dto);
    }
}
