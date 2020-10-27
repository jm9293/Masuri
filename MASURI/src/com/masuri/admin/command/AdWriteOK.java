package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.NoticeDAO;
import com.masuri.dto.NoticeDTO;

public class AdWriteOK implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String title = request.getParameter("TITLE");
		String content = request.getParameter("CONTENT");
		int result = 0;
		NoticeDTO dto = new NoticeDTO();
		
		try {
			dto.setTitle(title);
			dto.setContent(content);
			
			result = NoticeDAO.insert(dto);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("result", result);
		
	}

}
