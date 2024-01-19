package com.controller;

import com.model.BoardDAO;
import com.model.BoardDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MemberController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public static final int LISTCOUNT = 5;        // 게시판 글이 한 페이지에 표시되는 개수

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String RequestURI = request.getRequestURI();
        System.out.println("RequestURI : " + RequestURI);
        String contextPath = request.getContextPath();
        System.out.println("contextPath : " + contextPath);
        String command = RequestURI.substring(contextPath.length());

        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding("utf-8");

        if (command.equals("/LoginAction.lo")) {
            RequestDispatcher rd = null;
            if (!requestLogin(request)) {
                rd = request.getRequestDispatcher("./login.jsp?msg=1");
            } else {
                rd = request.getRequestDispatcher("./processLogin.jsp");
            }
            rd.forward(request, response);
        }
    }

    public boolean requestLogin(HttpServletRequest request) {
        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO dto = null;
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        dto = dao.getMemberbyLogin(id, password);
        request.setAttribute("memberDTO", dto);

        return dao.getMemberCountbyLogin(id, password) != 0;
    }
}
