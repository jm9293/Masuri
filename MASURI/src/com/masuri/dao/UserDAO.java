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

import org.apache.jasper.tagplugins.jstl.core.ForEach;

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
	
	public static void select() throws SQLException {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM userdata");
			rs = pstmt.executeQuery();
			ArrayList<UserDTO> list = new ArrayList<UserDTO>();
			while (rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("ID"));
				user.setUsernum(rs.getInt("num"));
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
		 
		
	}
	
	public static void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} 
	

}
