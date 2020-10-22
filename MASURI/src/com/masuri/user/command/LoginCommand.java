package com.masuri.user.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;


public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			String inputID = request.getParameter("inputID");
			String inputPW = request.getParameter("inputPW");
			
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute("login")!=null) { //로그인중인지
				System.out.println("이미로그인중");
				request.setAttribute("logincheck", 2);
			}else {
				boolean check =  UserDAO.logincheck(inputID,inputPW);
				
				if(check) {
					session.setAttribute("login", inputID);
					request.setAttribute("logincheck", 0);
				}else {
					request.setAttribute("logincheck", 1);
				}

			}
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
