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
    public static final int LISTCOUNT = 5;		// 게시판 글이 한 페이지에 표시되는 개수

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String RequestURI = request.getRequestURI();
        System.out.println("RequestURI : "+RequestURI);
        String contextPath = request.getContextPath();
        System.out.println("contextPath : "+contextPath);
        String command = RequestURI.substring(contextPath.length());
//		예)/board/list.jsp => /list.jsp

        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding("utf-8");

//		mapping
        if(command.equals("/BoardListAction.do")) {
            requestBoardList(request);	// 게시판 목록 가져오는 사용자 정의 함수
            RequestDispatcher rd = request.getRequestDispatcher("./guide.jsp");
            rd.forward(request, response);
        }
    }

    //	등록된 글 목록을 가져오는 함수
    protected void requestBoardList(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        List<BoardDTO> pressBoardlist = new ArrayList<BoardDTO>();
        List<BoardDTO> updateBoardlist = new ArrayList<BoardDTO>();

        int pageNum = 1;
        int limit = LISTCOUNT;

        if(request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        // 사용자가 게시판 하단의 검색창을 이용해서 option(items)를 선택하고 문자열을 입력 후 검색버튼을 클릭하면 request 객체에 저장 후 얻어와 해당 변수에 초기화

        String items = request.getParameter("items");
        String text = request.getParameter("text");
        int total_record = dao.getListCount(items, text);

        pressBoardlist = dao.getPressBoardList(pageNum, limit, items, text);
        updateBoardlist = dao.getUpdateBoardList(pageNum, limit, items, text);
        // 옵션별로 검색한 단어와 관련된 갯수를 리턴해서 total record에 저장

        request.setAttribute("pageNum", pageNum);
        request.setAttribute("total_record", total_record);

        int total_page; // 총 게시판 페이지 수

        // 조건에 맞는 게시글 행을 limit(5)로 나누어 나머지가 0이면 그냥 몫을 게시판 페이지수로 설정

        if(total_record % limit == 0 ) {
            total_page = total_record/limit;
        }else {
            total_page = total_record/limit;
            total_page = total_page+1;
        }// 나머지가 0이 아니면 총 게시판 페이수에 1을 더해 저장한다.

        request.setAttribute("total_page", total_page);
        request.setAttribute("pressBoardlist", pressBoardlist);
        request.setAttribute("updateBoardlist", updateBoardlist);

        request.setAttribute("items", items);
        request.setAttribute("text", text);
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
