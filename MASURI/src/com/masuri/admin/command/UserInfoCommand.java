package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;
import com.masuri.dto.UserDTO;

public class UserInfoCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserDTO dto = new UserDTO();
		String uid = request.getParameter("uid");
		
		try {
			dto = UserDAO.select(uid);
			
			request.setAttribute("uid", dto);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
