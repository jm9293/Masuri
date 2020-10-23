package com.masuri.user.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.FaqDAO;
import com.masuri.dao.NoticeDAO;
import com.masuri.dto.FaqDTO;
import com.masuri.dto.NoticeDTO;

public class NoticeCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<NoticeDTO> list = null;
		int page = Integer.parseInt(request.getParameter("page"));
		
		try {
			int max = NoticeDAO.getMaxPage();
			if(page < 1) {
				page = 1;
			}else if(page > max) {
				page = max;
			}
			list = NoticeDAO.selectpage(page);
			
			request.setAttribute("list", list);
			request.setAttribute("max", max);
			request.setAttribute("page", page);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}

	}

}
