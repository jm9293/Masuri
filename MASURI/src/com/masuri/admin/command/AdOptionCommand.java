package com.masuri.admin.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.ReslistDAO;
import com.masuri.dto.ReslistDTO;

public class AdOptionCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<ReslistDTO> list = new ArrayList<ReslistDTO>();
		int page =1;
		
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
			
		} catch (Exception e) {
			
		}
		
		try {
			int max = ReslistDAO.getMaxPage();
			if(page < 1) {
				page = 1;
			}else if(page > max) {
				page = max;
			}
			list =  ReslistDAO.selectpage(page);
			
			
			request.setAttribute("list", list);
			request.setAttribute("max", max);
			request.setAttribute("page", page);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
