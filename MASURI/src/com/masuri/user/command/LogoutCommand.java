package com.masuri.user.command;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;


public class LogoutCommand implements Command {
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
			try {
				request.setCharacterEncoding("utf-8");
				String id = (String) request.getSession().getAttribute("login");
				System.out.println(id);
				LoginCommand.Users.get(id).removeAttribute("login");
				try {
					LoginCommand.Users.get(id).invalidate();
				} catch (Exception e) {
					
				}
				
				LoginCommand.Users.remove(id);
				
				
				request.setAttribute("logoutres", true);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				request.setAttribute("logoutres", false);
			}
			
			
		

	}

}
