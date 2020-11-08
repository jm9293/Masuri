package com.masuri.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import com.masuri.dto.DayscheduleDTO;

public class DayscheduleDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet rs;
	
	private DayscheduleDAO() {}
	
	public static Connection getConnection() throws NamingException,SQLException{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/masuri");
		
		return ds.getConnection();	
	}
	
	public static ArrayList<DayscheduleDTO> select() throws SQLException { //전체 Dayschedule가져오기
		ArrayList<DayscheduleDTO> list = new ArrayList<DayscheduleDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Dayschedule");
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				DayscheduleDTO dayschedule = new DayscheduleDTO();
				
				dayschedule.setEngid(rs.getString("engid"));
				dayschedule.setDay(rs.getDate("day"));
				dayschedule.setTime1(rs.getInt("time1"));
				dayschedule.setTime2(rs.getInt("time2"));
				dayschedule.setTime3(rs.getInt("time3"));
				
				list.add(dayschedule);
			}
			
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return list;
	}
	
	public static DayscheduleDTO select(String engid, Date day) throws SQLException { // 하나만 가져오기
		DayscheduleDTO dayschedule = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Dayschedule WHERE engid = ? and day = ?");
			pstmt.setString(1, engid);
			pstmt.setDate(2, day);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dayschedule = new DayscheduleDTO();
				dayschedule.setEngid(rs.getString("engid"));
				dayschedule.setDay(rs.getDate("day"));
				dayschedule.setTime1(rs.getInt("time1"));
				dayschedule.setTime2(rs.getInt("time2"));
				dayschedule.setTime3(rs.getInt("time3"));
			}
		
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return dayschedule;
	}
	
	public static synchronized int updateTime(String engid, Date day, int timeNum , int resNum) throws SQLException { // 예약신청
		int cnt = 0;
		try {
			
			
			DayscheduleDTO daysch = select(engid, day);
			if(daysch==null) { // 해당하는 로우가 없으면 인서트
				daysch = new DayscheduleDTO();
				daysch.setEngid(engid);
				daysch.setDay(day);
				insert(daysch);
			}
			conn = getConnection();
			
			pstmt = conn.prepareStatement("UPDATE DAYSCHEDULE SET " + 
					"TIME"+timeNum+" = ? " + 
					"WHERE ENGID = ? AND DAY = ? AND TIME"+timeNum+" IS NULL");

			pstmt.setInt(1, resNum);
			pstmt.setString(2, engid);
			pstmt.setDate(3, day);
		
			
			cnt = pstmt.executeUpdate();
		
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	
	public static int update(DayscheduleDTO dayschedule) throws SQLException { //DayscheduleDTO 객체로 업데이트하기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE DAYSCHEDULE SET " + 
					"TIME1 = ?, " + 
					"TIME2 = ?, " + 
					"TIME3 = ? " + 
					"WHERE ENGID = ? AND DAY = ?");
		   
			
			pstmt.setInt(1, dayschedule.getTime1());
			pstmt.setInt(2, dayschedule.getTime2());
			pstmt.setInt(3, dayschedule.getTime3());
			pstmt.setString(4, dayschedule.getEngid());
			pstmt.setDate(5, dayschedule.getDay());
		
			
			cnt = pstmt.executeUpdate();
		
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	
	
	
	public static int insert(DayscheduleDTO dayschedule) throws SQLException { //DayscheduleDTO 스케쥴만 생성
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO DAYSCHEDULE (ENGID,DAY) VALUES (?, ?)");
			pstmt.setString(1, dayschedule.getEngid());
			pstmt.setDate(2, dayschedule.getDay());
			
			
			
			cnt = pstmt.executeUpdate();
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static int delete(String engid, Date day) throws SQLException { 
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("DELETE FROM Dayschedule WHERE engid = ? and day = ?");
			pstmt.setString(1, engid);
			pstmt.setDate(2, day);
	
			
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
