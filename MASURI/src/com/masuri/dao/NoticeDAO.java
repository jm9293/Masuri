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


import com.masuri.dto.NoticeDTO;

public class NoticeDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet rs;
	
	private NoticeDAO() {}
	
	public static Connection getConnection() throws NamingException,SQLException{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/masuri");
		
		return ds.getConnection();	
	}
	
	public static ArrayList<NoticeDTO> select() throws SQLException { //전체 Noticelist가져오기
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM notice");
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNum(rs.getInt("num"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setViewcount(rs.getInt("viewcount"));
				notice.setWrtime(rs.getTimestamp("wrtime"));
				list.add(notice);
			}
			for (NoticeDTO userDTO : list) {
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
	
	public static int getMaxPage() throws SQLException { //전체 Noticelist가져오기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select COUNT(*) as \"count\" from notice");
			rs = pstmt.executeQuery();
		   
			if(rs.next()) {
				cnt =  (int)Math.ceil(rs.getInt("count")/7.0);
				System.out.println(cnt);
			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	
	public static int getMaxNum() throws SQLException {
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT NOTICE_SEQ.CURRVAL AS count FROM DUAL");
			rs = pstmt.executeQuery();
		   
			if(rs.next()) {
				cnt =  rs.getInt("count");
				System.out.println(cnt);
			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static ArrayList<NoticeDTO> selectpage(int num) throws SQLException { //전체 Noticelist가져오기
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		int max = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select COUNT(*) as \"count\" from notice");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			max = rs.getInt("count");
			}
			
			System.out.println("1:"+(max-(6+((num-1)*7))));
			System.out.println("2:"+(max-((num-1)*7)));
	
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM as \"RNUM\",NOTICE.* FROM notice ORDER BY NUM DESC) NOTICE2 WHERE RNUM>="+(max-(6+((num-1)*7)))+" and RNUM<="+(max-((num-1)*7)));
			rs = pstmt.executeQuery();
		   
			while(rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNum(rs.getInt("num"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setViewcount(rs.getInt("viewcount"));
				notice.setWrtime(rs.getTimestamp("wrtime"));
				list.add(notice);
			}
			for (NoticeDTO userDTO : list) {
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
	
	
	
	
	public static NoticeDTO select(int num , boolean view) throws SQLException { //num으로 하나만 가져오기, 가져올때마다 조회수증가
		NoticeDTO notice = new NoticeDTO();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM notice WHERE NUM = ?");
			pstmt.setInt(1, num);
			 
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				notice.setNum(rs.getInt("num"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setViewcount(rs.getInt("viewcount")+1);
				notice.setWrtime(rs.getTimestamp("wrtime"));
		
			}
			if(view) {
			pstmt = conn.prepareStatement("UPDATE NOTICE SET VIEWCOUNT = ? WHERE NUM = ?");
			
			pstmt.setInt(1, notice.getViewcount());
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
			System.out.println(notice);
			}
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return notice;
	}
	
	public static int insert(NoticeDTO notice) throws SQLException { //NoticeDTO 객체로 인서트하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(
					"INSERT INTO NOTICE " + 
					"    (NUM,  " + 
					"    TITLE,  " + 
					"    CONTENT,  " + 
					"    VIEWCOUNT,  " + 
					"    WRTIME) " + 
					"VALUES\r\n" + 
					"    (NOTICE_SEQ.nextval, " + 
					"    ?, " + 
					"    ?, " + 
					"    0, " + 
					"    sysdate)");
			
		   pstmt.setString(1, notice.getTitle());
		   pstmt.setString(2, notice.getContent());
		   
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
	
	
	
	public static int update(NoticeDTO notice) throws SQLException { //NoticeDTO 객체로 업데이트하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(
					"UPDATE NOTICE " + 
					"SET " + 
					"TITLE = ?,  " + 
					"CONTENT = ?,  " + 
					"WRTIME = sysdate " + 
					"WHERE NUM = ?");
		   pstmt.setString(1, notice.getTitle());
		   pstmt.setString(2, notice.getContent());
		   pstmt.setInt(3, notice.getNum());
			
			
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
	
	
	public static int delete(NoticeDTO notice) throws SQLException {  // 공지사항삭제하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("DELETE FROM notice WHERE NUM = ?");
		    pstmt.setInt(1, notice.getNum());
			
			
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
