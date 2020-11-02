package com.masuri.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.masuri.dto.DayscheduleDTO;
import com.masuri.dto.ReslistDTO;

public class ReslistDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet rs;
	
	private ReslistDAO() {}
	
	public static Connection getConnection() throws NamingException,SQLException{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/masuri");
		
		return ds.getConnection();	
	}
	
	public static ArrayList<ReslistDTO> select() throws SQLException { //전체 Reslistlist가져오기
		ArrayList<ReslistDTO> list = new ArrayList<ReslistDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Reslist");
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				ReslistDTO reslist = new ReslistDTO();
				reslist.setNum(rs.getInt("num"));
				reslist.setTime(rs.getTimestamp("time"));
				reslist.setAddress(rs.getString("address"));
				reslist.setUserid(rs.getString("userid"));
				reslist.setEngid(rs.getString("engid"));
				reslist.setFactory(rs.getString("factory"));
				reslist.setModel(rs.getString("model"));
				reslist.setFailsit(rs.getString("failsit"));
				reslist.setFailmsg(rs.getString("failmsg"));
				reslist.setState(rs.getString("state"));

				list.add(reslist);
			}
			for (ReslistDTO userDTO : list) {
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
	
	public static int getMaxPage() throws SQLException { //전체 예약리스트 페이지 최대갯수 가져오기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select COUNT(*) as \"count\" from Reslist");
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
	
	
	public static int getMaxPageFromEng(String id) throws SQLException { // 최대페이지수 엔지니어 아이디로 가져오기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select COUNT(*) as \"count\" from Reslist WHERE ENGID =?");
			pstmt.setString(1, id);
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
	
	
	public static int getMaxPageFromUser(String id) throws SQLException { // 최대페이지수 유저아이디로 가져오기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select COUNT(*) as \"count\" from Reslist WHERE USERID =?");
			pstmt.setString(1, id);
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
	
	public static ArrayList<ReslistDTO> selectpage(int num) throws SQLException { //전체 Reslistlist가져오기
		ArrayList<ReslistDTO> list = new ArrayList<ReslistDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM as \"RNUM\",Reslist.* FROM Reslist ORDER BY NUM DESC) Reslist2 WHERE rnum>="+(1+(num-1)*7)+" and rnum<="+((num)*7));    
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				ReslistDTO reslist = new ReslistDTO();
				reslist.setNum(rs.getInt("num"));
				reslist.setTime(rs.getTimestamp("time"));
				reslist.setAddress(rs.getString("address"));
				reslist.setUserid(rs.getString("userid"));
				reslist.setEngid(rs.getString("engid"));
				reslist.setFactory(rs.getString("factory"));
				reslist.setModel(rs.getString("model"));
				reslist.setFailsit(rs.getString("failsit"));
				reslist.setFailmsg(rs.getString("failmsg"));
				reslist.setState(rs.getString("state"));
				list.add(reslist);
			}
			for (ReslistDTO userDTO : list) {
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
	
	
	public static ArrayList<ReslistDTO> selectpageFromEng(int num , String id) throws SQLException { // 페이지번호 ,엔지니어 id로 가져오기
		ArrayList<ReslistDTO> list = new ArrayList<ReslistDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM as \"RNUM\",Reslist.* FROM Reslist WHERE ENGID =? ORDER BY NUM DESC) Reslist2 WHERE rnum>="+(1+(num-1)*7)+" and rnum<="+((num)*7));
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				ReslistDTO Reslist = new ReslistDTO();
				Reslist.setNum(rs.getInt("num"));
				
				list.add(Reslist);
			}
			for (ReslistDTO userDTO : list) {
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
	
	
	
	public static ArrayList<ReslistDTO> selectpageFromUser(int num ,String id) throws SQLException { //페이지 번호, 유저 id로 가져오기
		ArrayList<ReslistDTO> list = new ArrayList<ReslistDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM as \"RNUM\",Reslist.* FROM Reslist WHERE USERID =? ORDER BY NUM DESC) Reslist2 WHERE rnum>="+(1+(num-1)*7)+" and rnum<="+((num)*7));
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				ReslistDTO Reslist = new ReslistDTO();
				Reslist.setNum(rs.getInt("num"));
				
				list.add(Reslist);
			}
			for (ReslistDTO userDTO : list) {
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
	
	
	
	
	public static ReslistDTO select(int num) throws SQLException { //num으로 하나만 가져오기
		ReslistDTO Reslist = new ReslistDTO();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM Reslist WHERE NUM = ?");
			pstmt.setInt(1, num);
			 
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Reslist.setNum(rs.getInt("num"));
				
			}
			
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return Reslist;
	}
	
	public static synchronized int insert(ReslistDTO reslist) throws SQLException { //ReslistDTO 객체로 인서트하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("INSERT INTO RESLIST (NUM ,TIME, ADDRESS, USERID, ENGID, FACTORY, MODEL, FAILSIT, FAILMSG, STATE) " + 
					"VALUES(RESLIST_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, '신청완료')");
			
			pstmt.setTimestamp(1, reslist.getTime());
			pstmt.setString(2, reslist.getAddress());
			pstmt.setString(3, reslist.getUserid());
			pstmt.setString(4, reslist.getEngid());
			pstmt.setString(5, reslist.getFactory());
			pstmt.setString(6, reslist.getModel());
			pstmt.setString(7, reslist.getFailsit());
			pstmt.setString(8, reslist.getFailmsg());
			
			
		   cnt = pstmt.executeUpdate();
		   
		   pstmt = conn.prepareStatement("SELECT RESLIST_SEQ.CURRVAL AS count FROM DUAL");
		   
		   rs = pstmt.executeQuery();
		   int resNum =0;
		   
		   if(rs.next()) {
			   resNum = rs.getInt("count");
		   }
		   
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		   
		   java.util.Date utildate = new java.util.Date(reslist.getTime().getTime());
		   
		   utildate = sdf.parse(sdf.format(utildate));
		   
		   
		   Date day = new Date(utildate.getTime());
		   
		   
		   
		   int timeNum = 0 ; 
		   switch (reslist.getTime().getHours()) {
		   case 9:
			   timeNum=1;
			   break;
		   case 13:
			   timeNum=2;
			   break;
		   case 16:
			   timeNum=3;
			   break;
		   }
		   
		  
		   cnt = DayscheduleDAO.updateTime(reslist.getEngid(), day, timeNum, resNum);
		   
		   if(cnt>0) {
			   conn.commit();
		   }
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	
	
	public static int update(ReslistDTO reslist) throws SQLException { //ReslistDTO 객체로 모든 컬럼 업데이트하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(
					"UPDATE RESLIST SET " + 
					"TIME = ?, " + 
					"ADDRESS = '?', " + 
					"USERID = ?, " + 
					"ENGID = ?, " + 
					"FACTORY = ?, " + 
					"MODEL = ?, " + 
					"FAILSIT = ?, " + 
					"FAILMSG = ?, " + 
					"STATE = ? " + 
					"WHERE NUM = ?");
			
		   pstmt.setTimestamp(1, reslist.getTime());
		   pstmt.setString(2, reslist.getAddress());
		   pstmt.setString(3, reslist.getUserid());
		   pstmt.setString(4, reslist.getEngid());
		   pstmt.setString(5, reslist.getFactory());
		   pstmt.setString(6, reslist.getModel());
		   pstmt.setString(7, reslist.getFailsit());
		   pstmt.setString(8, reslist.getFailmsg());
		   pstmt.setString(9, reslist.getState());
		   pstmt.setInt(10, reslist.getNum());
			
			
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
	
	
	public static int updateState(ReslistDTO reslist) throws SQLException { //ReslistDTO 객체로 state만 업데이트하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(
					"UPDATE RESLIST SET " + 
					"STATE = ? " + 
					"WHERE NUM = ?");
			
		   
		   pstmt.setString(1, reslist.getState());
		   pstmt.setInt(2, reslist.getNum());
			
			
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
	
	
	public static int delete(ReslistDTO Reslist) throws SQLException {  // 공지사항삭제하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("DELETE FROM Reslist WHERE NUM = ?");
		    pstmt.setInt(1, Reslist.getNum());
			
			
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
