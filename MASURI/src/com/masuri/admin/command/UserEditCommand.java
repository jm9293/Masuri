package com.masuri.admin.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;
import com.masuri.dto.UserDTO;

public class UserEditCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<UserDTO> list = null;
		
		try {
			list = UserDAO.select();
			
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
