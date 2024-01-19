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

    public static MemberDAO getInstance(){
        if(instance == null) instance = new MemberDAO();
        return instance;
    }

    public int getMemberCountbyLogin(String id, String password){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO dto= null;
        int x = 0;

        String sql = "select count(*) from whale_member where id = ? and password = ?";

        try{
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if(rs.next()){
                x = rs.getInt(1);
            }
        }catch (Exception e){
            System.out.println("getMemberCountbyLogin 에러");
            System.out.println(e.getMessage());
        }finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                System.out.println(e.getMessage());
            }
        }
        return x;
    }

    public MemberDTO getMemberbyLogin(String id, String password){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO dto= new MemberDTO();

        String sql = "select * from whale_member where id = ? and password = ?";

        try{
            conn = DataBaseConnect.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if(rs.next()){
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
        }catch (Exception e){
            System.out.println("getMemberbyLogin 에러");
            System.out.println(e.getMessage());
        }finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                System.out.println(e.getMessage());
            }
        }
        return dto;
    }

    public void joinMember(MemberDTO dto){
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
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
