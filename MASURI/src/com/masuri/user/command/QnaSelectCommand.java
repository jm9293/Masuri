package com.masuri.user.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class QnaSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		QnaDTO dto = new QnaDTO();
		int uid = Integer.parseInt(request.getParameter("uid"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		try {
			dto = QnaDAO.select(uid, true);
			
			request.setAttribute("list", dto);
			request.setAttribute("page", page);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	}

}
