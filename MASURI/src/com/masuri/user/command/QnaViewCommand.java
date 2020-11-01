package com.masuri.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class QnaViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int result = 0;
		QnaDTO dto = new QnaDTO();

		String page = request.getParameter("page");
		String uid = request.getParameter("uid");
		String regExp = "^[0-9]+$";
		try {
			if (uid.matches(regExp) && page.matches(regExp)) {
				int uid2 = Integer.parseInt(request.getParameter("uid"));
				dto = QnaDAO.select(uid2, true);
			}

			if ((dto.getNum() != 0)) {

				result = 1;
				request.setAttribute("list", dto);
				request.setAttribute("result", result);
			}else{
				request.setAttribute("result", result);
			}

		} catch (Exception e) {
			request.setAttribute("result", result);
		}

	}

}
