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
		String regExp = "^[0-9]+$";
		String uid = request.getParameter("uid");
		QnaDTO dto = new QnaDTO();

		try {
			if (uid.matches(regExp)) {

				int uid2 = Integer.parseInt(request.getParameter("uid"));
				dto.setNum(uid2);
			}
			if (dto.getNum() != 0) {
				cnt = QnaDAO.delete(dto);

				request.setAttribute("result", cnt);
			}

		} catch (SQLException e) {
			request.setAttribute("result", cnt);
		}
	}

}
