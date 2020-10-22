package com.masuri.user.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.FaqDAO;
import com.masuri.dto.FaqDTO;

public class FaqCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<FaqDTO> list = null;
		
		try {
			list = FaqDAO.select();
			System.out.println("dd");
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("dd");
		}

	}

}
