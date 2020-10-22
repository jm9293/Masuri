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
		UserDTO user = new UserDTO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM USERDATA WHERE ID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
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
	
	
	
	
	public static void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} 
	

}