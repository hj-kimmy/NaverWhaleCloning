package com.controller;

import com.model.BoardDAO;
import com.model.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class GetNewestBoard implements RequestBoard {
    @Override
    public void boardWork(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        List<BoardDTO> list1 = new ArrayList<BoardDTO>();
        List<BoardDTO> list2 = new ArrayList<BoardDTO>();

        BoardDTO dto1 = dao.getNewestBoard("Desktop");
        BoardDTO dto2 = dao.getNewestBoard("iOS");
        BoardDTO dto3 = dao.getNewestBoard("Android");

        list1.add(dto1);
        list1.add(dto2);
        list1.add(dto3);

        request.setAttribute("updateBoardList", list1);

        list2 = dao.getNewestBoard("press",5);
        request.setAttribute("pressBoardList", list2);
    }
}
