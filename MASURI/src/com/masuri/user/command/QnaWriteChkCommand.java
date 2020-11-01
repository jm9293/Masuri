package com.masuri.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;

public class QnaWriteChkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int result = 0;

		String page2 = request.getParameter("page");
		String regExp = "^[0-9]+$";
		try {

			if (page2.matches(regExp)) {
				int page = Integer.parseInt(request.getParameter("page"));
				result = 1;
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
