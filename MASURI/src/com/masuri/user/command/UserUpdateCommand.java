package com.masuri.user.command;






import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;
import com.masuri.dto.UserDTO;




public class UserUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = (String)request.getSession().getAttribute("login");
		
		 UserDTO user =null;
		 try {
			 if(id!=null) {
				 user = UserDAO.select(id);
			 }
			
			
		} catch (Exception e) {
			
		}
		
		if(user!=null) {
			request.setAttribute("user", user);
		}

	}

}
