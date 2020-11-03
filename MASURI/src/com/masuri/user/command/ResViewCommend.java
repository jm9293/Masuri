package com.masuri.user.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dao.NoticeDAO;
import com.masuri.dao.ReslistDAO;
import com.masuri.dto.NoticeDTO;
import com.masuri.dto.ReslistDTO;

public class ResViewCommend implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;

		ReslistDTO reslist =null;

		String regExp = "^[0-9]+$";
		String uid = request.getParameter("uid");
		String page = request.getParameter("page");
		String userID = (String)request.getSession().getAttribute("login");
		try {
			if (uid.matches(regExp) && page.matches(regExp)) {
				int uid2 = Integer.parseInt(request.getParameter("uid"));

				reslist = ReslistDAO.select(uid2);
			}
			if ((reslist.getNum() != 0)&&userID.equals(reslist.getUserid())) {
				result = 1;
				request.setAttribute("engname", EngineerDAO.select(reslist.getEngid()).getName());
				request.setAttribute("list", reslist);
				request.setAttribute("result", result);
			}else{
				request.setAttribute("result", result);
			}
		} catch (Exception e) {
			request.setAttribute("result", result);

		}

	}

}
