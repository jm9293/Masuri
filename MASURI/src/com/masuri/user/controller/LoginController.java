package com.masuri.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.file.DefaultImgSet;
import com.masuri.user.command.IDsearchCommand;
import com.masuri.user.command.IdchkCommand;
import com.masuri.user.command.KakaoLoginCommand;
import com.masuri.user.command.LoginCommand;
import com.masuri.user.command.LogoutCommand;
import com.masuri.user.command.NaverLoginCommand;
import com.masuri.user.command.PWsearchCommand;
import com.masuri.user.command.SignupCommand;
import com.masuri.user.command.UserUpdateCommand;
import com.masuri.user.command.UserUpdateGoCommand;


@WebServlet(urlPatterns = {"/user/basic/login/login.do","/user/basic/login/logout.do",
		"/user/basic/login/idchk.do","/user/basic/signup.do","/user/basic/updateuser.do","/user/basic/updateGo.do",
		"/user/basic/idsearchres.do","/user/basic/pwsearchres.do","/user/basic/navercallback.do","/user/basic/kakaocallback.do"})
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
		request.setCharacterEncoding("utf-8");
		
		// URL, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.length());
		 	
		Command command = null; 
		String viewPage = null;
			
		switch (com) {
		
		case "login.do":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "/user/basic/loginres.jsp";
			break;
			
		case "logout.do":
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "/user/basic/logout.jsp";
			break;
		case "idchk.do":
			command = new IdchkCommand();
			command.execute(request, response);
			break;
		case "signup.do":
			command = new SignupCommand();
			command.execute(request, response);
			viewPage = "/user/basic/signupres.jsp";
			break;
			
		case "updateuser.do":
			command = new UserUpdateCommand();
			command.execute(request, response);
			viewPage = "/user/basic/updateuser.jsp";
			break;
		case "updateGo.do":
			command = new UserUpdateGoCommand();
			command.execute(request, response);
			viewPage = "/user/basic/updateres.jsp";
			break;
			
		case "idsearchres.do":
			command = new IDsearchCommand();
			command.execute(request, response);
			viewPage = "/user/basic/idsearchres.jsp";
			break;
		case "pwsearchres.do":
			command = new PWsearchCommand();
			command.execute(request, response);
			viewPage = "/user/basic/pwsearchres.jsp";
			break;
			
		case "navercallback.do":
			command = new NaverLoginCommand();
			command.execute(request, response);
			viewPage = "/user/basic/naverloginres.jsp";
			break;
		case "kakaocallback.do":
			command = new KakaoLoginCommand();
			command.execute(request, response);
			viewPage = "/user/basic/kakaologinres.jsp";
			break;
		}
		
		
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
