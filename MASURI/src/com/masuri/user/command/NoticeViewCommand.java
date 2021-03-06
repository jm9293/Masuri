package com.masuri.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.dao.NoticeDAO;
import com.masuri.dto.NoticeDTO;

public class NoticeViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int result = 0;

		NoticeDTO dto = new NoticeDTO();

		String regExp = "^[0-9]+$";
		String uid = request.getParameter("uid");
		String page = request.getParameter("page");

		try {
			if (uid.matches(regExp) && page.matches(regExp)) {
				int uid2 = Integer.parseInt(request.getParameter("uid"));

				dto = NoticeDAO.select(uid2, true);
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
