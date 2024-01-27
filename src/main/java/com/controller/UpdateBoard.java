package com.controller;

import com.model.BoardDAO;
import com.model.BoardDTO;

import javax.servlet.http.HttpServletRequest;

public class UpdateBoard implements RequestBoard{
    @Override
    public void boardWork(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        BoardDTO dto = new BoardDTO();

        int num = Integer.parseInt(request.getParameter("num"));

        dto.setNum(num);
        dto.setSubject(request.getParameter("subject"));
        dto.setContents(request.getParameter("content"));
        dto.setCategory(request.getParameter("category"));
        dto.setIp(request.getRemoteAddr());

        dao.updateBoard(dto);
    }
}
