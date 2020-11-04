package com.masuri.engineer.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.engineer.command.Command;

public class LoginAlert implements Command{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		response.setCharacterEncoding("UTF-8");
		
//		int chk = Integer.parseInt(request.getParameter("chk"));
		
		HttpSession session = request.getSession();
		
		System.out.println("chkchkchckchkchk  :::"+request.getParameter("id"));
		System.out.println(request.getAttribute("chk"));
		
	}
	
}
