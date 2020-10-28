package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dto.EngineerDTO;

public class EngStatusChkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		boolean statusChk = !Boolean.parseBoolean(request.getParameter("chk"));
		String id = request.getParameter("uid");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String intro = request.getParameter("intro");
		String area = request.getParameter("area");
		EngineerDTO dto = new EngineerDTO();
		
		dto.setId(id);
		dto.setName(name);
		dto.setPassword(password);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setState(statusChk);;
		dto.setArea(area);
		dto.setIntro(intro);
		
		if(id != null && id.trim().length() >0) {
			
			try {
				cnt = EngineerDAO.update(dto);
				
				request.setAttribute("result", cnt);
				request.setAttribute("uid", id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
