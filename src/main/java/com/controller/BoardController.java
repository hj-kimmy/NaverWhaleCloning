package com.controller;

import com.model.BoardDAO;
import com.model.BoardDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BoardController extends HttpServlet {

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
        RequestDispatcher rd = null;
        RequestBoard req = null;

        if (command.equals("/BoardListNewAction.do")) {
            req = new GetNewestBoard();
            req.boardWork(request);  // 게시판 목록 가져오는 사용자 정의 함수
            rd = request.getRequestDispatcher("./guide.jsp");
        } else if (command.equals("/BoardListAction.do")) {
            req = new GetBoardList();
            req.boardWork(request);    // 게시판 목록 가져오는 사용자 정의 함수
            rd = request.getRequestDispatcher("./Boards/boardList.jsp");
        }else if(command.equals("/BoardViewAction.do")) {
            req = new GetBoardView();
            req.boardWork(request);
            rd = request.getRequestDispatcher("/BoardView.do");
        }else if(command.equals("/BoardView.do")) { // 글 상세 페이지 출력하기
            rd = request.getRequestDispatcher("./Boards/boardView.jsp");
        }
        if(rd!=null) rd.forward(request, response);
    }


    public void requestLoginName(HttpServletRequest request) {
        String id = request.getParameter("id");
        BoardDAO dao = BoardDAO.getInstance();

        String name = dao.getLoginNameById(id);
        request.setAttribute("name", name);
    }

    public void requestBoardWrite(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        BoardDTO dto = new BoardDTO();

        dto.setId(request.getParameter("id"));
        dto.setName(request.getParameter("name"));
        dto.setSubject(request.getParameter("subject"));
        dto.setContents(request.getParameter("content"));

        dto.setHit(0);
        dto.setIp(request.getRemoteAddr());
        dao.insertBoard(dto);
    }
}
