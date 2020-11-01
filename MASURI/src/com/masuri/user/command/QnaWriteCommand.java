package com.masuri.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class QnaWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int result = 0;
		int page2 = 0;
		String userid = request.getParameter("userID");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String openstr = request.getParameter("open");
		boolean open = openstr == null;
		String page = request.getParameter("page");

		QnaDTO dto = new QnaDTO();
		String regExp = "(?=.*[a-zA-Z])(?=.*\\d).{6,8}";
		String regExp2 = "^[0-9]+$";

		try {
			if (userid != null && title != null && content != null && userid.trim().length() > 0
					&& title.trim().length() > 0 && content.trim().length() > 0 && userid.matches(regExp)
					&& page.matches(regExp2)) {
				page2 = Integer.parseInt(request.getParameter("page"));

				dto.setUserid(userid);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setOpen(open);
			}
			if (dto.getUserid() != null) {

				cnt = QnaDAO.insert(dto);
				result = QnaDAO.getMaxNum();
				request.setAttribute("result", cnt);
				request.setAttribute("page", page2);
				request.setAttribute("result2", result);
			} else {
				request.setAttribute("result", cnt);
			}
		} catch (Exception e) {
			request.setAttribute("result", cnt);
		}

	}

}
