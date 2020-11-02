package com.masuri.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.FixlistDAO;
import com.masuri.dto.FixlistDTO;

public class AdOptionEXOKCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String optionFac = request.getParameter("plusOptionFac");
		String optionMod = request.getParameter("plusOptionMod");
		int result = 0;
		FixlistDTO dto = new FixlistDTO();
		
		dto.setFactory(optionFac);
		dto.setModel(optionMod);
		
		try {
			
			result = FixlistDAO.insert(dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		request.setAttribute("result", result);
		
		
		
		
	}

}
