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
		
		try {
			list = NoticeDAO.select();
			
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}

	}

}
