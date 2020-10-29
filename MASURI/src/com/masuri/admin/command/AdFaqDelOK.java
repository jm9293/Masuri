package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.FaqDAO;
import com.masuri.dto.FaqDTO;

public class AdFaqDelOK implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("uid"));
		
		int result = 0;
		FaqDTO dto = new FaqDTO();
		dto.setNum(num);
		
		try {
			result = FaqDAO.delete(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
		
	}

}
