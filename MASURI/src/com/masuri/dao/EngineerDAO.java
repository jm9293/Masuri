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

import com.masuri.dto.EngineerDTO;
import com.masuri.dto.UserDTO;

public class EngineerDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet rs;
	
	private EngineerDAO() {}
	
	public static Connection getConnection() throws NamingException,SQLException{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/masuri");
		
		return ds.getConnection();	
	}
	
	public static ArrayList<EngineerDTO> select() throws SQLException { //전체 엔지니어list가져오기
		ArrayList<EngineerDTO> list = new ArrayList<EngineerDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Engineerdata");
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				EngineerDTO engineer = new EngineerDTO();
				
				engineer.setEngnum(rs.getInt("engnum"));
				engineer.setId(rs.getString("id"));
				engineer.setPassword(rs.getString("password"));
				engineer.setName(rs.getString("name"));
				engineer.setArea(rs.getString("area"));
				engineer.setEmail(rs.getString("email"));
				engineer.setIntro(rs.getString("intro"));
				engineer.setPhone(rs.getString("phone"));
				engineer.setState(Boolean.parseBoolean(rs.getString("state")));
				
				list.add(engineer);
			}
			for (EngineerDTO EngineerDTO : list) {
				System.out.println(EngineerDTO);
			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return list;
	}
	
	public static EngineerDTO select(String id) throws SQLException { //id로 하나만 가져오기
		EngineerDTO engineer = new EngineerDTO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Engineerdata WHERE ID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				engineer.setEngnum(rs.getInt("engnum"));
				engineer.setId(rs.getString("id"));
				engineer.setPassword(rs.getString("password"));
				engineer.setName(rs.getString("name"));
				engineer.setArea(rs.getString("area"));
				engineer.setEmail(rs.getString("email"));
				engineer.setIntro(rs.getString("intro"));
				engineer.setPhone(rs.getString("phone"));
				engineer.setState(Boolean.parseBoolean(rs.getString("state")));
			}
		
			System.out.println(engineer);
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return engineer;
	}
	
	public static int update(EngineerDTO engineer) throws SQLException { //DTO 객체로 업데이트하기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE ENGINEERDATA SET PASSWORD = ?, NAME = ?,"
					+ "PHONE = ?, EMAIL = ?, INTRO = ?, AREA = ?, STATE = ? WHERE ID = ?");
		    
			pstmt.setString(1, engineer.getPassword());
			pstmt.setString(2, engineer.getName());
			pstmt.setString(3, engineer.getPhone());
			pstmt.setString(4, engineer.getEmail());
			pstmt.setString(5, engineer.getIntro());
			pstmt.setString(6, engineer.getArea());
			pstmt.setString(7, engineer.getState()+"");
			pstmt.setString(8, engineer.getId());
			
			cnt = pstmt.executeUpdate();
		
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
			pstmt = conn.prepareStatement("SELECT * FROM ENGINEERDATA WHERE ID = ? AND PASSWORD = ?");
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
	
	
	public static int insert(EngineerDTO engineer) throws SQLException {
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO ENGINEERDATA VALUES (ENGINEERDATA_SEQ.nextval, ?, ?, ?, ?, "
					+ "?, ?, ?, 'false')");
			
			pstmt.setString(1, engineer.getId());
			pstmt.setString(2, engineer.getPassword());
			pstmt.setString(3, engineer.getName());
			pstmt.setString(4, engineer.getPhone());
			pstmt.setString(5, engineer.getEmail());
			pstmt.setString(6, engineer.getIntro());
			pstmt.setString(7, engineer.getArea());
			
			
			
			cnt = pstmt.executeUpdate();
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static boolean stateCheck(String id)  {
		boolean check = false;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT STATE FROM USERDATA WHERE ID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next() ;
			check = Boolean.parseBoolean(rs.getString("STATE"));
					
		
		} catch (Exception e) {
			check = false;
			e.printStackTrace();
		} finally {
			close();
		}
		 	
		return check;
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
