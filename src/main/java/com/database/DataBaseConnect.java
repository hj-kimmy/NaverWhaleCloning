package com.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseConnect {
    public static Connection getConnection() throws Exception{
        Connection conn = null;

        try{
            String url = "jdbc:oracle:thin@localhost:1521:xe";
            String user = "C##dbexam";
            String password = "m1234";

            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("드라이버 등록 성공");

            conn = DriverManager.getConnection(url, user, password);

        }catch (Exception e){
            System.out.println("데이터 베이스 연결 실패");
            System.out.println("Exception Details : "+e.getMessage());
        }
        return conn;
    }
}
