package com.masuri.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import com.masuri.dto.FixlistDTO;

public class FixlistDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet rs;
	
	private FixlistDAO() {}
	
	public static Connection getConnection() throws NamingException,SQLException{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/masuri");
		
		return ds.getConnection();	
	}
	
	public static ArrayList<FixlistDTO> select() throws SQLException { //전체 fixlist가져오기
		ArrayList<FixlistDTO> list = new ArrayList<FixlistDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM fixlist ORDER BY NUM DESC");
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				FixlistDTO fixlist = new FixlistDTO();
				
				fixlist.setNum(rs.getInt("num"));
				fixlist.setFactory(rs.getString("factory"));
				fixlist.setModel(rs.getString("model"));
				
				list.add(fixlist);
			}
			
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return list;
	}
	
	public static FixlistDTO select(int num) throws SQLException { // 하나만 가져오기
		FixlistDTO fixlist = new FixlistDTO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM fixlist WHERE num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				fixlist.setNum(rs.getInt("num"));
				fixlist.setFactory(rs.getString("factory"));
				fixlist.setModel(rs.getString("model"));
			}
		
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return fixlist;
	}
	
	public static ArrayList<String> selectFactory() throws SQLException { // 제조사 전부가져오기
		ArrayList<String> factoryList = new ArrayList<String>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT factory FROM fixlist GROUP by factory");
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				factoryList.add(rs.getString("factory"));
				
			}
		
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return factoryList;
	}
	
	
	public static ArrayList<String> selectModel(String factory) throws SQLException { // 해당제조사 모델 전부 가져오기
		ArrayList<String> modelList = new ArrayList<String>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT model FROM fixlist WHERE factory = ? ORDER BY rownum DESC");
			pstmt.setString(1, factory);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				modelList.add(rs.getString("model"));
			}
		
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return modelList;
	}
	
	
	public static HashMap<String, ArrayList<String>> selectModelMap() throws SQLException { // 해당제조사 모델 전부 가져오기
		HashMap<String, ArrayList<String>> fixlistmap =  new HashMap<String, ArrayList<String>>();
		
		for (String factory : selectFactory()) {
			fixlistmap.put(factory, selectModel(factory));
		}
		 
		return fixlistmap;
	}
	
	public static int update(FixlistDTO fixlist) throws SQLException { //FixlistDTO 객체로 업데이트하기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE FIXLIST SET " + 
					"FACTORY = ?" + 
					"MODEL = ?" + 
					"WHERE NUM = ?");
		   
			
			pstmt.setString(1, fixlist.getFactory());
			pstmt.setString(2, fixlist.getModel());
			pstmt.setInt(3, fixlist.getNum());
		
			
			cnt = pstmt.executeUpdate();
		
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static int insert(FixlistDTO fixlist) throws SQLException { //FixlistDTO 로 인서트
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO FIXLIST (NUM ,FACTORY, MODEL) " + 
					"VALUES (FIXLIST_SEQ.nextval, ?, ?)");
		   
			
			pstmt.setString(1, fixlist.getFactory().trim());
			pstmt.setString(2, fixlist.getModel().trim());
			
			
			
			cnt = pstmt.executeUpdate();
		
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static int delete(int num) throws SQLException { // 수리기종 삭제
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("DELETE FROM FIXLIST WHERE NUM = ?");
		    pstmt.setInt(1, num);
	
			
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
	
	public static void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} 
	

}
