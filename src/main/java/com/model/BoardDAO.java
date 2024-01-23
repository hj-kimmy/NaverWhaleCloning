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

    public ArrayList<BoardDTO> getBoardList(int page, int limit, String category, String text, String tableName) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;

        int total_record = getListCount(category, text, tableName);
        int start = (page - 1) * limit;
        int index = start + 1;

        if(tableName==null){
            sql = "select * from whale_board order by num desc";
        }else {
            if (category == null && (text == null || text.equals(""))) {
                sql = "select * from whale_board where tablename = '"+ tableName +"' order by num desc";
            } else if (category == null && (text != null || !text.equals(""))) {
                sql = "select * from whale_board where subject like '%" + text + "%' or content like '%" + text + "%' order by num desc";
            } else if (category != null && (text == null || text.equals(""))) {
                sql = "select * from whale_board where category = '" + category + "' order by num desc";
            } else {
                sql = "select * from whale_board where category = '" + category + "' and (subject like '%" + text + "%' or content like '%" + text + "%') order by num desc";
            }
        }

        ArrayList<BoardDTO> list = new ArrayList<>();

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = pstmt.executeQuery();

            while (rs.absolute(index)) {
                BoardDTO board = new BoardDTO();

                board.setNum(rs.getInt("num"));
                board.setTableName(rs.getString("tablename"));
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
            System.out.println("getUpdateBoardList()에러" + e);
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

    public BoardDTO getBoardByNum(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDTO dto = null;

        updateHit(num);
        String sql = "select * from whale_board where num = ?";
        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1,num);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                dto = new BoardDTO();

                dto.setNum(rs.getInt("num"));
                dto.setTableName(rs.getString("tablename"));
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setSubject(rs.getString("subject"));
                dto.setContents(rs.getString("content"));
                dto.setRegist_day(rs.getDate("regist_day"));
                dto.setUpdate_day(rs.getDate("update_day"));
                dto.setHit(rs.getInt("hit"));
                dto.setIp(rs.getString("ip"));
            }
        } catch (Exception e) {
            System.out.println("getBoardByNum()에러" + e);
        } finally {
            shutDownConn(conn,pstmt,rs);
        }
        return dto;
    }

    public BoardDTO getBoardNextByNum(int num, String table) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDTO dto = null;

        String sql = null;
        try {
            sql = "Select * From whale_board where num = (Select min(num) From (Select * From whale_board Where num > "+ num +" and tablename='"+ table +"'))";
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                dto = new BoardDTO();

                dto.setNum(rs.getInt("num"));
                dto.setTableName(rs.getString("tablename"));
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setSubject(rs.getString("subject"));
                dto.setContents(rs.getString("content"));
                dto.setRegist_day(rs.getDate("regist_day"));
                dto.setUpdate_day(rs.getDate("update_day"));
                dto.setHit(rs.getInt("hit"));
                dto.setIp(rs.getString("ip"));
            }
        } catch (Exception e) {
            System.out.println("getBoardByNum()에러" + e);
        } finally {
            shutDownConn(conn,pstmt,rs);
        }
        return dto;
    }

    public BoardDTO getBoardPrevByNum(int num, String table) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDTO dto = null;

        String sql = "Select * From whale_board where num = (Select max(num) From (Select * From whale_board Where num < "+ num +" and tablename='"+ table +"'))";
        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                dto = new BoardDTO();

                dto.setNum(rs.getInt("num"));
                dto.setTableName(rs.getString("tablename"));
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setSubject(rs.getString("subject"));
                dto.setContents(rs.getString("content"));
                dto.setRegist_day(rs.getDate("regist_day"));
                dto.setUpdate_day(rs.getDate("update_day"));
                dto.setHit(rs.getInt("hit"));
                dto.setIp(rs.getString("ip"));
            }
        } catch (Exception e) {
            System.out.println("getBoardByNum()에러" + e);
        } finally {
            shutDownConn(conn,pstmt,rs);
        }
        return dto;
    }



    public void updateHit(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;

        try {
            sql = "select hit from whale_board where num = ?";
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1,num);
            rs = pstmt.executeQuery();
            int hit = 0;

            if(rs.next()) {
                hit = rs.getInt("hit")+1;
            }

            sql = "update whale_board set hit = ? where num = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,hit);
            pstmt.setInt(2,num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateHit()에러" + e);
        } finally {
            shutDownConn(conn, pstmt, rs);
        }
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

    public int getListCount(String category, String text, String tableName) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x = 0;

        String sql;

        if(tableName==null){
            sql = "select count (*) from whale_board order by num desc";
        }else {
            if (category == null && (text == null || text.equals(""))) {
                sql = "select count (*) from whale_board where tablename = '"+ tableName +"' order by num desc";
            } else if (category == null && (text != null || !text.equals(""))) {
                sql = "select count (*) from whale_board where subject like '%" + text + "%' or content like '%" + text + "%' order by num desc";
            } else if (category != null && (text == null || text.equals(""))) {
                sql = "select count (*) from whale_board where category = '" + category + "' order by num desc";
            } else {
                sql = "select count (*) from whale_board where category = '" + category + "' and (subject like '%" + text + "%' or content like '%" + text + "%') order by num desc";
            }
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

