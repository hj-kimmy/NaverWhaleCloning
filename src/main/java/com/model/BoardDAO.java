package com.model;

import com.database.DataBaseConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
    private static BoardDAO instacne;

    public BoardDAO() {
    }

    public static BoardDAO getInstacne() {
        if (instacne == null)
            instacne = new BoardDAO();
        return instacne;
    }

    public ArrayList<BoardDTO> getBoardList(int page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from board order by num desc";
        ArrayList<BoardDTO> list = new ArrayList<>();

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardDTO board = new BoardDTO();

                board.setNum(rs.getInt("num"));
                board.setId(rs.getString("id"));
                board.setName(rs.getString("name"));
                board.setSubject(rs.getString("subject"));
                board.setContents(rs.getString("content"));
                board.setHit(rs.getInt("hit"));
                board.setRegist_day(rs.getString("regist_day"));
                board.setUpdate_day(rs.getString("update_day"));
                board.setIp(rs.getString("ip"));
                list.add(board);
            }
            return list;
        } catch (Exception e) {
            System.out.println("getBaordList() 에러" + e);
        } finally {
            shutDownConn(conn, pstmt, rs);
        }
        return null;
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


