package com.masuri.user.controller;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.user.command.FaqCommand;
import com.masuri.user.command.LoginCommand;


@WebServlet(urlPatterns = {"/user/basic/login/login.do","/login2.do"})
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("actionDo() 호출");
		request.setCharacterEncoding("utf-8");
		
		// URL, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.length());
		 
		
	
		System.out.println("uri: " + uri);
		System.out.println("conPath " + conPath);
		System.out.println("com " + com);
		
		Command command = null; 
		String viewPage = null; 
		
		switch (com) {
		case "login.do":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "";
			break;
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
