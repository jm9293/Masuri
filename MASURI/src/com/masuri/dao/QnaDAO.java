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


import com.masuri.dto.QnaDTO;

public class QnaDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet rs;
	
	private QnaDAO() {}
	
	public static Connection getConnection() throws NamingException,SQLException{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/masuri");
		
		return ds.getConnection();	
	}
	
	public static ArrayList<QnaDTO> select() throws SQLException { //전체 qnalist가져오기
		ArrayList<QnaDTO> list = new ArrayList<QnaDTO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM qna");
			rs = pstmt.executeQuery();
		   
			while (rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setNum(rs.getInt("num"));
				qna.setTitle(rs.getString("title"));
				qna.setContent(rs.getString("content"));
				qna.setViewcount(rs.getInt("viewcount"));
				qna.setWrtime(rs.getTimestamp("wrtime"));
				qna.setUserid(rs.getString("userid"));
				qna.setOpen(Boolean.parseBoolean(rs.getString("open")));
				qna.setAnswer(rs.getString("answer"));
				qna.setAntime(rs.getTimestamp("antime"));
				list.add(qna);
			}

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return list;
	}
	
	
	
	
	public static int getMaxPage() throws SQLException { //전체 qnalist가져오기
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select COUNT(*) as \"count\" from qna");
			rs = pstmt.executeQuery();
		   
			if(rs.next()) {
				cnt =  (int)Math.ceil(rs.getInt("count")/7.0);

			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static int getMaxPageSerach(String content ,String colName) throws SQLException { // content : 검색내용 , colName :검색할 컬럼(userid 나 title)
		content = "%"+content+"%";
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select COUNT(*) as \"count\" from qna where "+colName+" like ?");
			pstmt.setString(1, content);
			rs = pstmt.executeQuery();
		   
			if(rs.next()) {
				cnt =  (int)Math.ceil(rs.getInt("count")/7.0);

			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	public static ArrayList<QnaDTO> selectpageSearch(int num, String content ,String colName) throws SQLException { //전체 Noticelist가져오기
		content = "%"+content+"%";
		ArrayList<QnaDTO> list = new ArrayList<QnaDTO>();
		try {
			int max = 0;
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select COUNT(*) as \"count\" from qna");
			rs = pstmt.executeQuery();
		   
			if(rs.next()) {
				max =  rs.getInt("count");
			}
			
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM as \"RNUM\",qna.* FROM qna where "+colName+" like ? ORDER BY NUM DESC) qna2 WHERE RNUM>="+(max-(6+((num-1)*7)))+" and RNUM<="+(max-((num-1)*7)));
			pstmt.setString(1, content);
			
			
			rs = pstmt.executeQuery();
		   
			while(rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setNum(rs.getInt("num"));
				qna.setTitle(rs.getString("title"));
				qna.setContent(rs.getString("content"));
				qna.setViewcount(rs.getInt("viewcount"));
				qna.setWrtime(rs.getTimestamp("wrtime"));
				qna.setUserid(rs.getString("userid"));
				qna.setOpen(Boolean.parseBoolean(rs.getString("open")));
				qna.setAnswer(rs.getString("answer"));
				qna.setAntime(rs.getTimestamp("antime"));
				list.add(qna);
			}
	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return list;
	}
	
	
	public static ArrayList<QnaDTO> selectpage(int num) throws SQLException { //전체 Noticelist가져오기
		ArrayList<QnaDTO> list = new ArrayList<QnaDTO>();
		try {
			int max = 0;
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select COUNT(*) as \"count\" from qna");
			rs = pstmt.executeQuery();
		   
			if(rs.next()) {
				max =  rs.getInt("count");
			}
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM as \"RNUM\",qna.* FROM qna ORDER BY NUM DESC) qna2 WHERE RNUM>="+(max-(6+((num-1)*7)))+" and RNUM<="+(max-((num-1)*7)));
			rs = pstmt.executeQuery();
		   
			while(rs.next()) {
				QnaDTO qna = new QnaDTO();
				qna.setNum(rs.getInt("num"));
				qna.setTitle(rs.getString("title"));
				qna.setContent(rs.getString("content"));
				qna.setViewcount(rs.getInt("viewcount"));
				qna.setWrtime(rs.getTimestamp("wrtime"));
				qna.setUserid(rs.getString("userid"));
				qna.setOpen(Boolean.parseBoolean(rs.getString("open")));
				qna.setAnswer(rs.getString("answer"));
				qna.setAntime(rs.getTimestamp("antime"));
				list.add(qna);
			}

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return list;
	}
	
	
	
	
	public static QnaDTO select(int num , boolean view) throws SQLException { //num으로 하나만 가져오기, 가져올때마다 조회수증가
		QnaDTO qna = new QnaDTO();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM qna WHERE NUM = ?");
			pstmt.setInt(1, num);
			 
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				qna.setNum(rs.getInt("num"));
				qna.setTitle(rs.getString("title"));
				qna.setContent(rs.getString("content"));
				qna.setViewcount(rs.getInt("viewcount")+1);
				qna.setWrtime(rs.getTimestamp("wrtime"));
				qna.setUserid(rs.getString("userid"));
				qna.setOpen(Boolean.parseBoolean(rs.getString("open")));
				qna.setAnswer(rs.getString("answer"));
				qna.setAntime(rs.getTimestamp("antime"));
		
			}
			if(view) {
			pstmt = conn.prepareStatement("UPDATE QNA SET VIEWCOUNT = ? WHERE NUM = ?");
			
			pstmt.setInt(1, qna.getViewcount());
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();

			}
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return qna;
	}
	
	public static int insert(QnaDTO notice) throws SQLException { //QnaDTO 객체로 인서트하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(
					"INSERT INTO QNA(NUM,USERID,OPEN,TITLE,CONTENT,VIEWCOUNT,WRTIME)" + 
					"VALUES(QNA_SEQ.nextval,?,?,?,?,0,sysdate)");
			
		   pstmt.setString(1, notice.getUserid());
		   pstmt.setString(2, notice.getOpen()+"");
		   pstmt.setString(3, notice.getTitle());
		   pstmt.setString(4, notice.getContent());
 
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
	
	public static int getMaxNum() throws SQLException {
		int cnt = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT QNA_SEQ.CURRVAL AS count FROM DUAL");
			rs = pstmt.executeQuery();
		   
			if(rs.next()) {
				cnt =  rs.getInt("count");

			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return cnt;
	}
	
	
	public static int update(QnaDTO notice) throws SQLException { //QnaDTO 상담글수정하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(
					"UPDATE QNA SET OPEN = ? ,TITLE = ?, CONTENT = ?," + 
					"WRTIME = sysdate WHERE NUM = ?");
		    pstmt.setString(1, notice.getOpen()+"");
		    pstmt.setString(2, notice.getTitle());
		    pstmt.setString(3, notice.getContent());
		    pstmt.setInt(4, notice.getNum());
			
			
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
	
	public static int updateAnswer(QnaDTO qna) throws SQLException { //QnaDTO로 답변달기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(
					"UPDATE QNA SET" + 
					" ANSWER = ?, ANTIME = sysdate WHERE NUM = ?");
		   pstmt.setString(1, qna.getAnswer());
		   pstmt.setInt(2, qna.getNum());
			
			
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
	
	public static int delete(QnaDTO qna) throws SQLException { //QnaDTO로 게시글 삭제하기
		int cnt = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("DELETE FROM QNA WHERE NUM = ?");
		    pstmt.setInt(1, qna.getNum());
			
			
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
