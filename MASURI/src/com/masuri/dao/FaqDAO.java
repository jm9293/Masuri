package com.masuri.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import com.masuri.dto.FaqDTO;
import com.masuri.dto.QnaDTO;

public class FaqDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet rs;
	
	private FaqDAO() {}
	
	public static Connection getConnection() throws NamingException,SQLException{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/masuri");
		
		return ds.getConnection();	
	}
	
	public static ArrayList<FaqDTO> select() throws SQLException { //전체 userlist가져오기
		ArrayList<FaqDTO> list = new ArrayList<FaqDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM faq ORDER BY NUM DESC");
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				FaqDTO faq = new FaqDTO();
				faq.setNum(rs.getInt("num"));
				faq.setQuestion(rs.getString("question"));
				faq.setAnswer(rs.getString("answer"));

				list.add(faq);
			}
			for (FaqDTO userDTO : list) {
				System.out.println(userDTO);
			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return list;
	}
	
	public static FaqDTO select(int num) throws SQLException { //num으로 하나만 가져오기
		FaqDTO faq = new FaqDTO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM faq WHERE ID = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				faq.setNum(rs.getInt("num"));
				faq.setQuestion(rs.getString("question"));
				faq.setAnswer(rs.getString("answer"));
			}
		
			System.out.println(faq);
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return faq;
	}
	
	public static int update(FaqDTO faq) throws SQLException { //userDTO 객체로 업데이트하기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"UPDATE FAQ" + 
					"SET " + 
					"QUESTION = ?, " + 
					"ANSWER = ? " + 
					"WHERE NUM = ?");
		   
			
			pstmt.setString(1, faq.getQuestion());
			pstmt.setString(2, faq.getAnswer());
			pstmt.setInt(3, faq.getNum());
			
			
			cnt = pstmt.executeUpdate();
	
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static int insert(FaqDTO faq) throws SQLException { 
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"INSERT INTO FAQ (NUM,QUESTION,ANSWER)" + 
					"VALUES(FAQ_SEQ.nextval,?,?)");
		   
			
			pstmt.setString(1, faq.getQuestion());
			pstmt.setString(2, faq.getAnswer());
			
			
			
			cnt = pstmt.executeUpdate();
	
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static int delete(FaqDTO faq) throws SQLException { // 삭제하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("DELETE FROM FAQ WHERE NUM = ?");
		    pstmt.setInt(1, faq.getNum());
			
			
			cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				conn.commit();
			}
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	
	public static void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} 
	

}
