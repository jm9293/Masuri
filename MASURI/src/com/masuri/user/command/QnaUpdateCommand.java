package com.masuri.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class QnaUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		String page2 = request.getParameter("page");
		String regExp = "^[0-9]+$";
		String uid2 = request.getParameter("uid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String openstr = request.getParameter("open");
		boolean open = openstr == null;
		QnaDTO dto = new QnaDTO();
		int uid = 0;
		int page = 0;

		try {
			if (title != null && content != null && title.trim().length() > 0 && content.trim().length() > 0
					&& uid2.matches(regExp) && page2.matches(regExp)) {

				page = Integer.parseInt(request.getParameter("page"));
				uid = Integer.parseInt(request.getParameter("uid"));
				dto.setNum(uid);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setOpen(open);
			}
			if (dto.getNum() != 0) {

				cnt = QnaDAO.update(dto);
				request.setAttribute("uid", uid);
				request.setAttribute("page", page);
				request.setAttribute("result", cnt);
			} else {
				request.setAttribute("result", cnt);
			}
		} catch (Exception e) {
			request.setAttribute("result", cnt);
		}

	}
}
