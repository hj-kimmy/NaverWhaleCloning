package com.controller;

import com.model.BoardDAO;
import com.model.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class GetLoignMemberTable implements RequestBoard {
    @Override
    public void boardWork(HttpServletRequest request) {
        String id = request.getParameter("id");
        String table = request.getParameter("table");
        BoardDAO dao = BoardDAO.getInstance();

        String name = dao.getLoginNameById(id);
        request.setAttribute("name", name);
        request.setAttribute("table", table);
    }
}
