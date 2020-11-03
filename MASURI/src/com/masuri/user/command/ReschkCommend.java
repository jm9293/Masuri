package com.masuri.user.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dao.ReslistDAO;
import com.masuri.dto.ReslistDTO;

public class ReschkCommend implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String userID = (String)request.getSession().getAttribute("login");
			
			if(userID==null) {
				request.setAttribute("result", 2); //로그인중아님!
				return;
			}
			String pagestr = request.getParameter("page");
			if(pagestr==null) {
				pagestr = "1";
			}
			
			
			int page = Integer.parseInt(pagestr);
			int max = ReslistDAO.getMaxPageFromUser(userID, false);
			if (page < 1) {
				page = 1;
			} else if (page > max) {
				page = max;
			}
			
			
			
			ArrayList<ReslistDTO> list = ReslistDAO.selectpageFromUser(page, userID, false);
			for (ReslistDTO reslistDTO : list) {
				reslistDTO.setEngid(EngineerDAO.select(reslistDTO.getEngid()).getName());
			}
			
			
			request.setAttribute("list", list);
			request.setAttribute("max", max);
			request.setAttribute("result", 1);
			request.setAttribute("page", page);
			
		} catch (Exception e) {
			request.setAttribute("result", 0);
		}

	}

}
