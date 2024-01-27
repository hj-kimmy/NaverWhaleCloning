package com.controller;

import com.model.BoardDAO;
import com.model.BoardDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class BoardController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
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
        else if(command.equals("/BoardWriteForm.do")) {
            req = new GetLoignMemberTable();
            req.boardWork(request);
            rd = request.getRequestDispatcher("./Boards/boardForm.jsp");
        }else if(command.equals("/BoardWriteAction.do")) {
            req = new AddNewBoard();
            req.boardWork(request);
            rd = request.getRequestDispatcher("/BoardListAction.do");
        }else if(command.equals("/BoardDeleteAction.do")) {
            req = new DeleteBoard();
            req.boardWork(request);
            rd = request.getRequestDispatcher("/BoardListAction.do");
        }else if(command.equals("/BoardUpdateForm.do")){
            req = new GetBoardView();
            req.boardWork(request);
            rd = request.getRequestDispatcher("./Boards/boardForm.jsp");
        }else if(command.equals("/BoardUpdateAction.do")) { // 본인 게시글 내용 수정하기
            req = new UpdateBoard();
            req.boardWork(request);
            rd = request.getRequestDispatcher("/BoardListAction.do");
        }
        if(rd!=null) rd.forward(request, response);
    }

}
