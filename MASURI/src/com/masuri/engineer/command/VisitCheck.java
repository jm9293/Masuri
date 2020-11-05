package com.masuri.engineer.command;

import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.dao.ReslistDAO;
import com.masuri.dto.ReslistDTO;

public class VisitCheck implements Command{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		response.setCharacterEncoding("utf-8");
		
		String id = (String)request.getSession().getAttribute("enlogin");
		String no = request.getParameter("no");
		
		if(id!=null&&!id.equals("")) {
			
			if(no!=null&&!no.equals("")) {
				
				try {	//번호로 해당 신청서 불러오기
					ReslistDTO dto = ReslistDAO.select(Integer.parseInt(no));
					dto.setState("수리완료");
					
					/// 방문완료 업데이트
					ReslistDAO.updateState(dto);
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				request.setAttribute("visit", 0);
			}else {
				request.setAttribute("off", 1);
			}
			
			
			
			
		}
		
		
		
		
		
	}

}
