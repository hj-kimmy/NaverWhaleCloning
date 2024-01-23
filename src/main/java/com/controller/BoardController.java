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

        if (command.equals("/BoardListNewAction.do")) {
            requestBoardNewList(request);    // 게시판 목록 가져오는 사용자 정의 함수
            RequestDispatcher rd = request.getRequestDispatcher("./guide.jsp");
            rd.forward(request, response);
        } else if (command.equals("/BoardListAction.do")) {
            requestBoardList(request);    // 게시판 목록 가져오는 사용자 정의 함수
            RequestDispatcher rd = request.getRequestDispatcher("./Boards/boardList.jsp");
            rd.forward(request, response);
        }else if(command.equals("/BoardViewAction.do")) {
            requestBoardView(request);
            RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
            rd.forward(request, response);
        }else if(command.equals("/BoardView.do")) { // 글 상세 페이지 출력하기
            RequestDispatcher rd = request.getRequestDispatcher("./Boards/boardView.jsp");
            rd.forward(request, response);
        }
    }

    public void requestBoardNewList(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        List<BoardDTO> pressBoardlist = new ArrayList<BoardDTO>();
        List<BoardDTO> updateBoardlist = new ArrayList<BoardDTO>();

        int pageNum = 1;
        int limit = LISTCOUNT;

        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }

        String category = request.getParameter("category");
        String text = request.getParameter("text");
        String tableName = request.getParameter("table");

        int total_record = dao.getListCount(category, text, tableName);

        pressBoardlist = dao.getBoardList(pageNum, limit, category, text, "press");
        updateBoardlist = dao.getBoardList(pageNum, limit, category, text, "update");

        request.setAttribute("pageNum", pageNum);
        request.setAttribute("total_record", total_record);

        int total_page;

        if (total_record % limit == 0) {
            total_page = total_record / limit;
        } else {
            total_page = total_record / limit;
            total_page = total_page + 1;
        }

        request.setAttribute("total_page", total_page);
        request.setAttribute("pressBoardlist", pressBoardlist);
        request.setAttribute("updateBoardlist", updateBoardlist);
        request.setAttribute("category", category);
        request.setAttribute("text", text);
    }

    public void requestBoardList(HttpServletRequest request) {
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

    public void requestBoardView(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        BoardDTO dto1 = new BoardDTO();
        BoardDTO dto2 = new BoardDTO();
        BoardDTO dto3 = new BoardDTO();

        int num = Integer.parseInt(request.getParameter("num"));
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
