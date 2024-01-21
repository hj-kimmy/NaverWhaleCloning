package com.model;

import com.database.DataBaseConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    private static MemberDAO instance;

    public MemberDAO() {
    }

    public static MemberDAO getInstance() {
        if (instance == null) instance = new MemberDAO();
        return instance;
    }

    public int getMemberCountbyLogin(String id, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        int x = 0;

        String sql = "select count(*) from whale_member where id = ? and password = ?";

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getMemberCountbyLogin 에러");
            System.out.println(e.getMessage());
        } finally {
            shutDownAll(conn, pstmt, rs);
        }
        return x;
    }

    public MemberDTO getMemberbyLogin(String id, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO dto = new MemberDTO();

        String sql = "select * from whale_member where id = ? and password = ?";

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto.setNum(rs.getInt("num"));
                dto.setId(rs.getString("id"));
                dto.setPassword(rs.getString("password"));
                dto.setEmail(rs.getString("email"));
                dto.setName(rs.getString("name"));
                dto.setBirth(rs.getString("birth"));
                dto.setGender(rs.getString("gender"));
                dto.setItc(rs.getString("itc"));
                dto.setPhone(rs.getString("phone"));
            }
        } catch (Exception e) {
            System.out.println("getMemberbyLogin 에러");
            System.out.println(e.getMessage());
        } finally {
            shutDownAll(conn, pstmt, rs);
        }
        return dto;
    }

    public MemberDTO getMemberbyIdInfo(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO dto = new MemberDTO();

        String sql = "select * from whale_member where id = ?";

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto.setNum(rs.getInt("num"));
                dto.setId(rs.getString("id"));
                dto.setPassword(rs.getString("password"));
                dto.setEmail(rs.getString("email"));
                dto.setName(rs.getString("name"));
                dto.setBirth(rs.getString("birth"));
                dto.setGender(rs.getString("gender"));
                dto.setItc(rs.getString("itc"));
                dto.setPhone(rs.getString("phone"));
            }
        } catch (Exception e) {
            System.out.println("getMemberbyIdInfo 에러");
            System.out.println(e.getMessage());
        } finally {
            shutDownAll(conn, pstmt, rs);
        }
        return dto;
    }

    public int getMemberbyId(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = 0;

        String sql = "select count(*) from whale_member where id = ?";

        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getMemberbyId 에러");
            System.out.println(e.getMessage());
        } finally {
            shutDownAll(conn, pstmt, rs);
        }
        return x;
    }

    public void joinMember(MemberDTO dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String name = null;
        String sql = "insert into whale_member values (mem_seqNum.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPassword());
            pstmt.setString(3, dto.getEmail());
            pstmt.setString(4, dto.getName());
            pstmt.setString(5, dto.getBirth());
            pstmt.setString(6, dto.getGender());
            pstmt.setString(7, dto.getItc());
            pstmt.setString(8, dto.getPhone());

            pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("joinMember()에러" + e);
        } finally {
            shutDownPrepared(conn, pstmt);
        }
    }

    public void updateMember(MemberDTO dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String name = null;
        String sql = "update whale_member set password= ?, email=?,name=?, birth=?, gender=?, itc=?, phone=? where id = ?";
        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getPassword());
            pstmt.setString(2, dto.getEmail());
            pstmt.setString(3, dto.getName());
            pstmt.setString(4, dto.getBirth());
            pstmt.setString(5, dto.getGender());
            pstmt.setString(6, dto.getItc());
            pstmt.setString(7, dto.getPhone());
            pstmt.setString(8, dto.getId());

            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateMember()에러" + e);
        } finally {
            shutDownPrepared(conn, pstmt);
        }
    }

    public void deleteMember(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String name = null;
        String sql = "delete whale_member where id = ?";
        try {
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);

            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("deleteMember()에러" + e);
        } finally {
            shutDownPrepared(conn, pstmt);
        }
    }

    public void shutDownAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void shutDownPrepared(Connection conn, PreparedStatement pstmt) {
        try {
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
