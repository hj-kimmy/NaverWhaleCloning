package com.model;

import com.database.DataBaseConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
    private static BoardDAO instance;

    public BoardDAO() {
    }

    public static BoardDAO getInstance() {
        if (instance == null)
            instance = new BoardDAO();
        return instance;
    }

    public ArrayList<BoardDTO> getPressBoardList(int page, int limit, String items, String text) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int total_record = getListCount(items, text);
//		현재 페이지 넘버에서 1을 뺀 후 limt(5)를 곱한 값으로 start에 저장 => 0,5,15...
        int start = (page - 1) * limit;
        // rs에서 활용할 index를 정의
        int index = start + 1; // 1, 6, 11 ...

        String sql;

        // 검색어가 없으면 최신글이 맨 앞에 오도록 오름차순으로 모든 게시글을 읽어옴
        /*
         * if (items == null && text == null) { sql =
         * "select*from board order by num desc"; }
         *
         * => 조건이 이상함
         */

        if (items == null && text == null)
            sql = "select * from press_board order by num desc";
        else
            sql = "select * from press_board where " + items + " like '%" + text + "%' order by num desc";

        ArrayList<BoardDTO> list = new ArrayList<>();

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            // rs.absolute(index)를 사용하기 위해 매개변수를 sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
            // ResultSet.CONCUR_READ_ONLY를 사용함.
            // ResultSet.TYPE_SCROLL_INSENSITIVE : rs에서 화면 이용에 사용할 수 잇는 커서로 rs.next()를 사용하면
            // 다음 결과 행을 가져오고 다음에는 이전 값을 사용 못하지만 이 옵션값을 설정하여 rx 를 만들 한번 커서가 지나간 다음에도 다시 커서를
            // 앞으로 되돌릴 수 없다.
            // ResultSet.CONCUR_READ_ONLY : rs로 가져온 row의 값을 insert, update로 사용하지 않고 데이터를 읽기만
            // 한다.
            rs = pstmt.executeQuery();

            while (rs.absolute(index)) {
                // rs.absolute(index) : rs커서를 원하는 위치(index)의 검색행으로 이동하는 메서드로 rs에서 가져온 행의 1,16,11
                // ... 이런식으로 loop를 돌면서 dto 객체를 생성하고 각 컬럼의 데이터를 얻어와 설정
                BoardDTO board = new BoardDTO();

                board.setNum(rs.getInt("num"));
                board.setId(rs.getString("id"));
                board.setName(rs.getString("name"));
                board.setCategory(rs.getString("category"));
                board.setSubject(rs.getString("subject"));
                board.setContents(rs.getString("content"));
                board.setHit(rs.getInt("hit"));
                board.setRegist_day(rs.getDate("regist_day"));
                board.setUpdate_day(rs.getDate("update_day"));
                board.setIp(rs.getString("ip"));
                list.add(board);

                if (index < (start + limit) && index <= total_record)
                    index++;
                    // page : 1, start : 0, limit : 5, index: 1, total_record:6이라고 가정
                    // 1<(0+5) && 1<=6
                    // ...
                    // 5<(0+5) && 5<=6 => index는 1증가 안하고 : 5
                else
                    break;
            }

            return list;
        } catch (Exception e) {
            System.out.println("getBoardList()에러" + e);
        } finally {
            shutDownConn(conn, pstmt, rs);
        }
        return null;
    }

    public ArrayList<BoardDTO> getUpdateBoardList(int page, int limit, String items, String text) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int total_record = getListCount(items, text);
//		현재 페이지 넘버에서 1을 뺀 후 limt(5)를 곱한 값으로 start에 저장 => 0,5,15...
        int start = (page - 1) * limit;
        // rs에서 활용할 index를 정의
        int index = start + 1; // 1, 6, 11 ...

        String sql;

        // 검색어가 없으면 최신글이 맨 앞에 오도록 오름차순으로 모든 게시글을 읽어옴
        /*
         * if (items == null && text == null) { sql =
         * "select*from board order by num desc"; }
         *
         * => 조건이 이상함
         */

        if (items == null && text == null)
            sql = "select * from update_board order by num desc";
        else
            sql = "select * from update_board where " + items + " like '%" + text + "%' order by num desc";

        ArrayList<BoardDTO> list = new ArrayList<>();

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = pstmt.executeQuery();

            while (rs.absolute(index)) {
                BoardDTO board = new BoardDTO();

                board.setNum(rs.getInt("num"));
                board.setId(rs.getString("id"));
                board.setName(rs.getString("name"));
                board.setCategory(rs.getString("category"));
                board.setSubject(rs.getString("subject"));
                board.setContents(rs.getString("content"));
                board.setHit(rs.getInt("hit"));
                board.setRegist_day(rs.getDate("regist_day"));
                board.setUpdate_day(rs.getDate("update_day"));
                board.setIp(rs.getString("ip"));
                list.add(board);

                if (index < (start + limit) && index <= total_record)
                    index++;
                else
                    break;
            }

            return list;
        } catch (Exception e) {
            System.out.println("getBoardList()에러" + e);
        } finally {
            shutDownConn(conn, pstmt, rs);
        }
        return null;
    }

    public String getLoginNameById(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String name = null;
        String sql = "select * from member where id = ?";

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
                return name;
            }
        } catch (Exception e) {
            System.out.println("getBoardList()에러" + e);
        } finally {
            shutDownConn(conn, pstmt, rs);
        }
        return null;
    }

    public void insertBoard(BoardDTO board) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String name = null;
        String sql = "insert into press_board values (num.nextval, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";
        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getId());
            pstmt.setString(2, board.getName());
            pstmt.setString(3, board.getSubject());
            pstmt.setString(4, board.getContents());
            pstmt.setInt(5, board.getHit());
            pstmt.setString(6, board.getIp());

            pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("getBoardList()에러" + e);
        } finally {
            shutDownConn(conn, pstmt);
        }
    }

    public int getListCount(String items, String text) {
        // items : 컬럼명 , text : 사용자가 입락현 키워드 문자열

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x = 0; // 선택된 총 게시글의 갯수

        String sql;

        // 검색어가 없으면 리스트 모두 가져오고 검색어가 있으면 검색한 리스트 가져올 때 매개변수로 받은 items 와 text의 값이 들어갈 수
        // 있도록 한다.
        if (items == null && text == null) {
            sql = "select count(*) from PRESS_BOARD";
        } else {
            sql = "select count(*) from PRESS_BOARD where " + items + " like '%" + text + "%'";
        }

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next())
                x = rs.getInt(1);
            // rs의 첫번째 결과 값을 가지고 와서 정수타입의 x(선택된 총 게시글의 갯수) 에 저장

        } catch (Exception e) {
            System.out.println("getBoardList()에러" + e);
        } finally {
            shutDownConn(conn, pstmt, rs);
        }
        return x; // 선택된 총 게시글의 갯수를 리턴
    }


    public void shutDownConn(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void shutDownConn(Connection conn, PreparedStatement pstmt) {
        try {
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}


