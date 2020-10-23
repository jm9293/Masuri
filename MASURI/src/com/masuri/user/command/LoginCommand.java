package com.masuri.user.command;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.masuri.command.Command;
import com.masuri.dao.UserDAO;


public class LoginCommand implements Command {
	
	public static final HashMap<String,HttpSession> Users = new HashMap<String,HttpSession>();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			String inputID = request.getParameter("inputID");
			String inputPW = request.getParameter("inputPW");
			
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute("login")!=null) { //로그인중인지
				if(Users.containsKey(inputID)) {
					System.out.println("이미로그인중");
					request.setAttribute("logincheck", 2);
				}else {
					session.removeAttribute("login");
					session.invalidate();
					request.setAttribute("logincheck", 3);
				}
			}else {
				boolean check =  UserDAO.logincheck(inputID,inputPW);
				
				if(check) {
					session.setAttribute("login", inputID);
					
					if(Users.containsKey(inputID)) {
						Users.get(inputID).invalidate();
						request.setAttribute("logincheck", 4);
					}else {
						request.setAttribute("logincheck", 0);
					}
					Users.put(inputID, session);
					
					System.out.println(Users);
					
				}else {
					request.setAttribute("logincheck", 1);
				}

			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
