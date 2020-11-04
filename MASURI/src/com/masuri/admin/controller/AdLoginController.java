package com.masuri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.admin.command.AdLoginCommand;
import com.masuri.command.Command;


@WebServlet(urlPatterns = {
		"/admin/adLoginOK.do","/admin/adLogin.do"
})
public class AdLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AdLoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		Command command = null; 
		String viewPage = null; 
		
		switch(com) {
		
		case "/admin/adLogin.do":
			command = new AdLoginCommand();
			command.execute(request, response);
			viewPage = "/admin/adLogin.jsp";
			break;
		
		case "/admin/adLoginOK.do":
			command = new AdLoginCommand();
			command.execute(request, response);
			viewPage = "/admin/adLoginOK.jsp";
			break;
		
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
	}
}
