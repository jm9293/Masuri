package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.ReslistDAO;
import com.masuri.dto.ReslistDTO;

public class AdOptionView implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ReslistDTO dto = new ReslistDTO();
		int uid =  Integer.parseInt(request.getParameter("uid"));
		int page =  Integer.parseInt(request.getParameter("page"));
		
		
		try {
			dto = ReslistDAO.select(uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.setAttribute("list", dto);
		request.setAttribute("page", page);
	}

}
