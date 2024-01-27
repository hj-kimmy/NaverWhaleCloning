package com.controller;

import com.model.BoardDAO;

import javax.servlet.http.HttpServletRequest;

public class DeleteBoard implements RequestBoard{
    @Override
    public void boardWork(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();

        String[] strIds = request.getParameterValues("editCheck");

        if(request.getParameter("num")!=null){
            strIds = new String[1];
            strIds[0] = request.getParameter("num");
        }
        dao.deleteBoard(strIds);
    }
}
