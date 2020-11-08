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


import com.masuri.dto.MonthscheduleDTO;

public class MonthscheduleDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet rs;
	
	private MonthscheduleDAO() {}
	
	public static Connection getConnection() throws NamingException,SQLException{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/masuri");
		
		return ds.getConnection();	
	}
	
	public static ArrayList<MonthscheduleDTO> select(int month, String engID) throws SQLException { //해당하는 월스케줄 가져오기
		ArrayList<MonthscheduleDTO> list = new ArrayList<MonthscheduleDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Monthschedule WHERE ENGID = ? AND MONTH = ?");
			pstmt.setString(1, engID);
			pstmt.setInt(2, month);
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				MonthscheduleDTO schedule = new MonthscheduleDTO();
				schedule.setEngid(rs.getString("engid"));
				schedule.setHoliday(rs.getDate("holiday"));
				schedule.setMonth(rs.getInt("month"));
				list.add(schedule);
			}

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return list;
	}
	
	
	
	
	public static int insert(MonthscheduleDTO monthschedule) throws SQLException { //MonthscheduleDTO 객체로 인서트하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
		    pstmt = conn.prepareStatement("INSERT INTO MONTHSCHEDULE (ENGID,MONTH, HOLIDAY) " + 
		    		"VALUES(?, ?, ?)");
		    
		    pstmt.setString(1, monthschedule.getEngid());
		    pstmt.setInt(2, monthschedule.getMonth());
		    pstmt.setDate(3, monthschedule.getHoliday());
			
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
	
	
	public static int delete(int month, String engID) throws SQLException { //Monthschedule 해당월 전체삭제
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("DELETE FROM Monthschedule WHERE ENGID = ? AND MONTH = ?");
		    pstmt.setString(1, engID);
		    pstmt.setInt(2, month);
			
			
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
