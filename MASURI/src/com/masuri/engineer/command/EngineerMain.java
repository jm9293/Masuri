package com.masuri.engineer.command;

import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.dao.DayscheduleDAO;
import com.masuri.dao.EngineerDAO;
import com.masuri.dto.DayscheduleDTO;
import com.masuri.dto.EngineerDTO;

public class EngineerMain implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userid = (String)request.getSession().getAttribute("enlogin");
		EngineerDTO enguser = null;
		DayscheduleDTO daysch = null;
		try {
			enguser = EngineerDAO.select(userid);
			daysch = DayscheduleDAO.select(userid, new java.sql.Date(new Date().getTime()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int daycnt =0;
		if(daysch!=null) {
			if(daysch.getTime1()!=0) {
				daycnt++;
			}
			if(daysch.getTime2()!=0) {
				daycnt++;
			}
			if(daysch.getTime2()!=0) {
				daycnt++;
			}
		}
		
		request.setAttribute("dto", enguser);
		request.setAttribute("daycnt", daycnt);
		
		

	}

}
