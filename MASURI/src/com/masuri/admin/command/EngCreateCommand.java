package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dto.EngineerDTO;

public class EngCreateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		EngineerDTO dto = new EngineerDTO();
		
		String id = request.getParameter("id").trim();
		String password = request.getParameter("pw").trim();
		String name = request.getParameter("name").trim();
		String emailtext = request.getParameter("emailtext").trim();
		String phone = request.getParameter("phone").trim();
		String intro = request.getParameter("intro").trim();
		String [] guArea = request.getParameterValues("guArea");
		String emailSelect = request.getParameter("emailSelect");
		String inputEmaildirect = request.getParameter("inputEmaildirect");
		String email = "";
		
		if(inputEmaildirect.equals("직접입력")) {
			email = emailtext+"@"+emailSelect;
		}else {
			email = emailtext+"@"+inputEmaildirect;
		}
		
		dto.setId(id);
		dto.setPassword(password);
		dto.setName(name);
		dto.setEmail(email);
		dto.setPhone(phone);
		dto.setIntro(intro);
		dto.setArea(guArea[0].trim());
		
		if(dto != null) {
			try {
				cnt = EngineerDAO.insert(dto);

				request.setAttribute("result", cnt);
				request.setAttribute("id", id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
