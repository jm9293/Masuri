package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.NoticeDAO;
import com.masuri.dto.NoticeDTO;

public class AdNoticeUpdate implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		NoticeDTO dto = new NoticeDTO();
		
		try {
			
			dto = NoticeDAO.select(uid, true);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", dto);
	}

}
