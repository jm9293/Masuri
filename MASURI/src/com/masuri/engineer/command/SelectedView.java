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
		String register = request.getParameter("register").split("시")[0];		
		String select = request.getParameter("selDate").split("일")[0];
		Date date = new Date();
		
		if(id!=null&&!id.equals("")) {
			
			
			if(register!=null&&!register.equals("")&&!register.equals("off")) {
						
				ArrayList<String> test = new ArrayList<String>();
				
				date.setDate(Integer.parseInt(select));
				date.setHours(Integer.parseInt(register));
			
			}else{
				request.setAttribute("off", 1);
				/// 신청서 페이지 안뜨고 alert		
			}
					
			SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd-hh");
			boolean timeChk = false;
			
			
			try {
				
				ArrayList<ReslistDTO> list = ReslistDAO.select();
				
				for (ReslistDTO dto : list) {
					if(dto.getEngid().equals(id)) {
						
						date = sdf.parse(sdf.format(date));
						if(sdf.parse(sdf.format(dto.getTime())).equals(date)) {
							
							sdf= new SimpleDateFormat("yy-MM-dd - hh:mm:ss");
							timeChk = true;
							request.setAttribute("time", sdf.format(dto.getTime()));
							
							if(dto.getNum()!=null&&!dto.getNum().equals("")) {
								request.setAttribute("No", dto.getNum());
							}
							
							if(dto.getUserid()!=null&&!dto.getUserid().equals("")) {
								request.setAttribute("userId", dto.getUserid());
							}
							
							if(dto.getEngid()!=null&&!dto.getEngid().equals("")) {
								request.setAttribute("Engid", dto.getEngid());
								System.out.println(timeChk +" timeChk");
							}
							
							if(dto.getAddress()!=null&&!dto.getAddress().equals("")) {
								request.setAttribute("Address", dto.getAddress());
							}
							
							if(dto.getFactory()!=null&&!dto.getFactory().equals("")) {
								request.setAttribute("Factory", dto.getFactory());
							}
							
							if(dto.getModel()!=null&&!dto.getModel().equals("")) {
								request.setAttribute("model", dto.getModel());
							}
							
							if(dto.getFailsit()!=null&&!dto.getFailsit().equals("")) {
								request.setAttribute("Failsit", dto.getFailsit());
							}
							
							if(dto.getFailmsg()!=null&&!dto.getFailmsg().equals("")) {
								request.setAttribute("Failmsg", dto.getFailmsg());
							}
							
							if(dto.getState()!=null&&!dto.getState().equals("")) {
								request.setAttribute("state", dto.getState());
							}
				
							
						}
						
					}
				}
				
				if(!timeChk) {
					request.setAttribute("off", 1);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch(ParseException e2) {
				e2.printStackTrace();
			}
			
		}else {
			request.setAttribute("chk", 1);
		}
		
		
	}
	

}
