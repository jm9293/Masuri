package com.masuri.user.command;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class QnaCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;

		try {
			ArrayList<QnaDTO> list = null;
			int page = Integer.parseInt(request.getParameter("page"));
			String page2 = request.getParameter("page");
			String regExp = "^[0-9]+$";

			if (page2.matches(regExp)) {
				int max = QnaDAO.getMaxPage();
				if (page < 1) {
					page = 1;
				} else if (page > max) {
					page = max;
				}
				list = QnaDAO.selectpage(page);
				result = 1;
				request.setAttribute("list", list);
				request.setAttribute("max", max);
				request.setAttribute("result", result);
				request.setAttribute("page", page);
			}else {
				request.setAttribute("result", result);
			}
		} catch (Exception e) {

			request.setAttribute("result", result);
		}
	}

}
