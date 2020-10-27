package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;
import com.masuri.dto.UserDTO;

public class UserBlackChkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int cnt = 0;
		boolean blackChk = !Boolean.parseBoolean(request.getParameter("chk"));
		System.out.println("!!!!!!!!!!!"+blackChk);
		String id = request.getParameter("uid");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		UserDTO dto = new UserDTO();
		
		dto.setId(id);
		dto.setName(name);
		dto.setPassword(password);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setBlack(blackChk);
		
		if(id != null && id.trim().length() >0) {
			
			try {
				cnt = UserDAO.update(dto);
				
				request.setAttribute("result", cnt);
				request.setAttribute("uid", id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
