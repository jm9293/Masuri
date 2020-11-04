package com.masuri.engineer.command;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.dao.ReslistDAO;
import com.masuri.dto.ReslistDTO;

public class SelectedView implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("enlogin");
		String register = request.getParameter("register");		
		Date date = new Date();
		boolean timeChk = false;
		
		if(id!=null&&!id.equals("")) {
			
			
			if(register!=null&&!register.equals("")&&!register.equals("off")) {

				
				try {
					SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd - hh:mm:ss");
					
					timeChk=true;
					
					ReslistDTO dto = ReslistDAO.select(Integer.parseInt(register));
					request.setAttribute("time", sdf.format(dto.getTime()));
					request.setAttribute("Address", dto.getAddress());
					request.setAttribute("userId", dto.getUserid());
					request.setAttribute("EngId", dto.getEngid());
					request.setAttribute("Factory", dto.getFactory());
					request.setAttribute("model", dto.getModel());
					request.setAttribute("Failsit", dto.getFailsit());
					request.setAttribute("Failmsg", dto.getFailmsg());
					request.setAttribute("state", dto.getState());
					
					request.setAttribute("No", dto.getNum());
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
					
			}else{
				request.setAttribute("off", 1);
				/// 신청서 페이지 안뜨고 alert		
			}
				
			
				if(!timeChk) {
					request.setAttribute("off", 1);
				}
				
			
			
		}else {
			request.setAttribute("chk", 1);
		}
		
		
	}
	

}
