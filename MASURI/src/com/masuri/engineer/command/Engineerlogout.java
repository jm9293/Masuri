package com.masuri.engineer.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Engineerlogout implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EngineerLogin.engineerID.remove((String)request.getSession().getAttribute("enlogin"),request.getSession());
		
		request.getSession().removeAttribute("enlogin");
		
		request.setAttribute("logoutres", true);

	}

}
