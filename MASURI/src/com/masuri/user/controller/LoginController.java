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
import com.masuri.user.command.IdchkCommand;
import com.masuri.user.command.LoginCommand;
import com.masuri.user.command.LogoutCommand;
import com.masuri.user.command.SignupCommand;


@WebServlet(urlPatterns = {"/user/basic/login/login.do","/user/basic/login/logout.do","/user/basic/login/idchk.do","/user/basic/signup.do"})
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
		
		System.out.println(com);
		
		switch (com) {
		
		case "login.do":
			System.out.println("여기는 들어와?");
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "/user/basic/loginres.jsp";
			break;
			
		case "logout.do":
			System.out.println("여기는 들어와?");
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "/user/basic/logout.jsp";
			break;
		case "idchk.do":
			System.out.println("idchk");
			command = new IdchkCommand();
			command.execute(request, response);
			break;
		case "signup.do":
			System.out.println("signup");
			command = new SignupCommand();
			command.execute(request, response);
			viewPage = "/user/basic/signupres.jsp";
			break;
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
