package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dto.EngineerDTO;

public class EngInfoCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EngineerDTO dto = new EngineerDTO();
		String uid = request.getParameter("uid");
		
		try {
			dto = EngineerDAO.select(uid);
			
			request.setAttribute("uid", dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
