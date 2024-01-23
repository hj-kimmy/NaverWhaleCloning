package com.controller;

import com.model.BoardDAO;
import com.model.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class GetBoardList implements RequestBoard {
    @Override
    public void boardWork(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        String table = request.getParameter("table");

        int pageNum = 1;
        int limit = 10;

        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        String category = request.getParameter("category");
        String text = request.getParameter("text");
        int total_record = dao.getListCount(category, text, table);

        List<BoardDTO> list = new ArrayList<BoardDTO>();

        list = dao.getBoardList(pageNum, limit, category, text, table);

        request.setAttribute("boardlist", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("total_record", total_record);

        int total_page;
        if (total_record % limit == 0) {
            total_page = total_record / limit;
        } else {
            total_page = total_record / limit;
            total_page = total_page + 1;
        }
        request.setAttribute("table", table);
        request.setAttribute("total_page", total_page);
        request.setAttribute("category", category);
        request.setAttribute("text", text);
    }
}
