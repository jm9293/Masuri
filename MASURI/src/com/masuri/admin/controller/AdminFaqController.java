package com.masuri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.admin.command.AdFaqCommand;
import com.masuri.admin.command.AdFaqDelOK;
import com.masuri.admin.command.AdFaqWriteCommand;
import com.masuri.admin.command.AdFaqWriteOKCommand;
import com.masuri.command.Command;

/**
 * Servlet implementation class AdminFaqController
 */
@WebServlet(urlPatterns = {
		"/admin/adNotice/adminFaq.do","/admin/adNotice/adminFaqWrite.do","/admin/adNotice/adminFaqWriteOK.do","/admin/adNotice/adminFaqDelOK.do"
		})


public class AdminFaqController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdminFaqController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		Command command = null; 
		String viewPage = null; 
		
		switch(com) {
		
		case "/admin/adNotice/adminFaq.do":
			command =  new AdFaqCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adminFaq.jsp";
			break;
			
			
		case "/admin/adNotice/adminFaqWrite.do":
			command =  new AdFaqWriteCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adminFaqWrite.jsp";
			break;
		
		case "/admin/adNotice/adminFaqWriteOK.do":
			command =  new AdFaqWriteOKCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adminFaqWriteOK.jsp";
			break;
			
		case "/admin/adNotice/adminFaqDelOK.do":
			command =  new AdFaqDelOK();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adminFaqDelOK.jsp";
			break;
			
			
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
		
	}
	
	
	
}
