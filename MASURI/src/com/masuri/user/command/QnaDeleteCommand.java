package com.masuri.user.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class QnaDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int uid = Integer.parseInt(request.getParameter("uid"));
		QnaDTO dto = new QnaDTO();
		dto.setNum(uid);
		if(uid > 0) {
			
			try {
				cnt = QnaDAO.delete(dto);
				
				request.setAttribute("result", cnt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
