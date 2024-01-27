package com.controller;

import com.model.BoardDAO;
import com.model.BoardDTO;

import javax.servlet.http.HttpServletRequest;

public class GetBoardView implements RequestBoard{
    @Override
    public void boardWork(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        BoardDTO dto1 = new BoardDTO();
        BoardDTO dto2 = new BoardDTO();
        BoardDTO dto3 = new BoardDTO();
        int num;
        if(request.getParameter("num")==null || request.getParameter("num").isEmpty()){
            num = Integer.parseInt(request.getParameterValues("editCheck")[0]);
        }else {
            num = Integer.parseInt(request.getParameter("num"));
        }

        String tablename = request.getParameter("table");
        dto1 = dao.getBoardByNum(num);
        dto2 = dao.getBoardNextByNum(num,tablename);
        dto3 = dao.getBoardPrevByNum(num,tablename);

        request.setAttribute("num", num);
        request.setAttribute("table",tablename);
        request.setAttribute("now", dto1);
        request.setAttribute("next", dto2);
        request.setAttribute("prev", dto3);
    }
}
