package com.masuri.admin.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.FaqDAO;
import com.masuri.dao.NoticeDAO;
import com.masuri.dto.FaqDTO;
import com.masuri.dto.NoticeDTO;

public class AdViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeDTO dto = new NoticeDTO();
		int uid = Integer.parseInt(request.getParameter("uid"));
		int page = Integer.parseInt(request.getParameter("page"));
		try {
			dto = NoticeDAO.select(uid,false);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}

		request.setAttribute("list", dto);
		request.setAttribute("page", page);
	}

}
