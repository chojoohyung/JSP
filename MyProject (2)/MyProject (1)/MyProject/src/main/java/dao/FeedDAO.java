package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.*;

public class FeedDAO {

    public boolean insert(String uid, String ucon, String uimages) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO feed(id, content, images) VALUES(?, ?, ?)";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, ucon);
            stmt.setString(3, uimages);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public ArrayList<FeedObj> getList() throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id, content, ts, images FROM feed ORDER BY ts DESC";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
            while(rs.next()) {
                feeds.add(new FeedObj(rs.getString("id"), rs.getString("content"), rs.getString("ts"), rs.getString("images")));
            }
            return feeds;
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    public class BbsDAO {
    	private Connection conn;
    	private ResultSet rs;
    	
    	public BbsDAO() {
    		try {
    			String dbURL="jdbc:mysql://localhost:3306/BBS?serverTimezone=Asia/Seoul&useSSL=false";	
    			String dbID="root";
    			String dbPassword="root";
    			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로드
    			conn =DriverManager.getConnection(dbURL,dbID,dbPassword); // 연결 얻기 

    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    	}

    	public String getDate() {
    		String SQL="select now()";
    		try {
    		
    			PreparedStatement pstmt=conn.prepareStatement(SQL);
    			rs=pstmt.executeQuery();
    			if(rs.next()) {
    				return rs.getString(1);  // 현재 날짜 반환
    			}
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    		return "";
    	}
    	
    	public int getNext() {
    		String SQL="select bbsID FROM BBS ORDER BY bbsID DESC";
    		try {
    		
    			PreparedStatement pstmt=conn.prepareStatement(SQL);
    			rs=pstmt.executeQuery();
    			if(rs.next()) {
    				System.out.println(rs.getInt(1)); // select문에서 첫번째 값
    				return rs.getInt(1)+1;  // 현재 인덱스(현재 게시글 개수) +1 반환
    			}
    			return 1;
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    		return -1;
    	}
    }
}
    	

    	

