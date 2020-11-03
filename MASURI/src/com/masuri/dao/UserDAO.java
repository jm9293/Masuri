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


import com.masuri.dto.UserDTO;

public class UserDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet rs;
	
	private UserDAO() {}
	
	public static Connection getConnection() throws NamingException,SQLException{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/masuri");
		
		return ds.getConnection();	
	}
	
	public static ArrayList<UserDTO> select() throws SQLException { //전체 userlist가져오기
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM userdata");
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("ID"));
				user.setUsernum(rs.getInt("usernum"));
				user.setBlack(Boolean.parseBoolean(rs.getString("black")));
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setPassword(rs.getString("password"));
				list.add(user);
			}
			for (UserDTO userDTO : list) {
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
	
	public static UserDTO select(String id) throws SQLException { //id로 하나만 가져오기
		UserDTO user = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM USERDATA WHERE ID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				user = new UserDTO();
				user.setId(rs.getString("ID"));
				user.setUsernum(rs.getInt("usernum"));
				user.setBlack(Boolean.parseBoolean(rs.getString("black")));
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setPassword(rs.getString("password"));
			}
		
			System.out.println(user);
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return user;
	}
	
	public static int update(UserDTO user) throws SQLException { //userDTO 객체로 업데이트하기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE USERDATA SET PASSWORD = ?, NAME = ?, PHONE = ?, EMAIL = ?, BLACK = ? WHERE ID = ?");
		   
			
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPhone());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getBlack()+"");
			pstmt.setString(6, user.getId());
			
			cnt = pstmt.executeUpdate();
		
			System.out.println(user);
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static int insert(UserDTO user) throws SQLException { //userDTO 로 인서트
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO USERDATA "
					+ "(USERNUM ,ID, PASSWORD, NAME, PHONE,EMAIL,BLACK) "
					+ "VALUES(USERDATA_SEQ.nextval,?,?,?,?,?,'flase')");
		   
			
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getEmail());
			
			
			cnt = pstmt.executeUpdate();
		
			System.out.println(user);
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static boolean logincheck(String id , String pw)  {
		boolean check = false;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM USERDATA WHERE ID = ? AND PASSWORD = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			check = rs.next() ;
					
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 	
		return check;
	}
	
	public static boolean idcheck(String id)  {
		boolean check = false;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM USERDATA WHERE ID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			check = rs.next() ;
					
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 	
		return check;
	}
	
	public static boolean blcakCheck(String id)  {
		boolean check = false;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT BLACK FROM USERDATA WHERE ID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next() ;
			check = Boolean.parseBoolean(rs.getString("black"));
					
		
		} catch (Exception e) {
			check = false;
			e.printStackTrace();
		} finally {
			close();
		}
		 	
		return check;
	}
	
	
	public static String idSearch(String name, String email)  {
		String id = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT id FROM USERDATA WHERE name = ? and email = ?");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { ;
			id = rs.getString("id");
			}
					
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		 	
		return id;
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
