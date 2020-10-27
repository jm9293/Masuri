package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class AdQnaViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		QnaDTO dto = new QnaDTO();
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		int page = Integer.parseInt(request.getParameter("page"));
		try {
			dto = QnaDAO.select(uid,false);
			
			request.setAttribute("list", dto);
			request.setAttribute("page", page);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	}

}
