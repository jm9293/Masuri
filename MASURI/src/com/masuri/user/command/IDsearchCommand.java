package com.masuri.user.command;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;

public class IDsearchCommand implements Command {
	
	String [] regarr = {
			"[a-z0-9]{4,6}",
			"(?=.*[a-zA-Z])(?=.*\\d).{6,8}",
			"[가-힣]{2,}",
			"[0-9]{10,11}",
			"[a-z0-9_+.-]+@([a-z0-9-]+\\.)+[a-z0-9]{2,4}"
			};

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			if(email!=null&&Pattern.matches(regarr[4], email)&&
			   name!=null&&Pattern.matches(regarr[2], name)) {
				System.out.println("여기들어옴?");
			 String id = UserDAO.idSearch(name, email);
			 
			 if(id==null) {
				 request.setAttribute("res",0);
				 return;
			 }
				
			 request.setAttribute("id", id);
			 request.setAttribute("res",1);
			}else {
			 request.setAttribute("res",0);
			}
			
		} catch (Exception e) {
			request.setAttribute("res",0);
		}

	}

}
