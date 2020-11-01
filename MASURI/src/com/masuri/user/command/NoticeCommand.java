package com.masuri.user.command;


import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.dao.NoticeDAO;
import com.masuri.dto.NoticeDTO;

public class NoticeCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		try {
			ArrayList<NoticeDTO> list = null;

			String page2 = request.getParameter("page");
			String regExp = "^[0-9]+$";

			if (page2.matches(regExp)) {
				int page = Integer.parseInt(request.getParameter("page"));
				int max = NoticeDAO.getMaxPage();
				if (page < 1) {
					page = 1;
				} else if (page > max) {
					page = max;
				}
				list = NoticeDAO.selectpage(page);
				result = 1;
				request.setAttribute("list", list);
				request.setAttribute("max", max);
				request.setAttribute("page", page);
				request.setAttribute("result", result);
			} else {
				request.setAttribute("result", result);
			}
		} catch (Exception e) {

			request.setAttribute("result", result);
		}
	}

}
