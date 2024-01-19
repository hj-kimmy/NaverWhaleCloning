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
        } else if (command.equals("/joinMember.lo")) {
            requestJoinMember(request);
            RequestDispatcher rd = request.getRequestDispatcher("./login.jsp?msg=0");
            rd.forward(request, response);

        }
    }

    public boolean requestLogin(HttpServletRequest request) {
        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO dto = new MemberDTO();
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        dto = dao.getMemberbyLogin(id, password);
        request.setAttribute("memberDTO", dto);

        return dao.getMemberCountbyLogin(id, password) != 0;
    }

    public void requestJoinMember(HttpServletRequest request) {
        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO dto = new MemberDTO();

        dto.setId(request.getParameter("id"));
        dto.setPassword(request.getParameter("password"));
        dto.setEmail(request.getParameter("email"));
        dto.setName(request.getParameter("name"));
        dto.setBirth(request.getParameter("birth"));
        dto.setGender(request.getParameter("gender"));
        dto.setItc(request.getParameter("itc"));
        dto.setPhone(request.getParameter("phone"));

        System.out.println(request.getParameter("id"));
        System.out.println(request.getParameter("password"));
        System.out.println(request.getParameter("email"));
        System.out.println(request.getParameter("name"));
        System.out.println(request.getParameter("birth"));
        System.out.println(request.getParameter("gender"));
        System.out.println(request.getParameter("itc"));
        System.out.println(request.getParameter("phone"));

        dao.joinMember(dto);
    }
}
