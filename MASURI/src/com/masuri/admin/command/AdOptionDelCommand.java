package com.masuri.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.ReslistDAO;
import com.masuri.dto.ReslistDTO;

public class AdOptionDelCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num =  Integer.parseInt(request.getParameter("uid"));
		int result = 0;
		ReslistDTO dto = new ReslistDTO();
		dto.setNum(num);
		
		try {
			result = ReslistDAO.delete(dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
	}

}
