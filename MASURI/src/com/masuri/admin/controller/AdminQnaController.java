package com.masuri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.admin.command.AdQnaAnswerCommand;
import com.masuri.admin.command.AdQnaAnswerOKCommand;
import com.masuri.admin.command.AdQnaDelOK;
import com.masuri.admin.command.AdQnaListCommand;
import com.masuri.admin.command.AdQnaViewCommand;
import com.masuri.command.Command;

/**
 * Servlet implementation class AdminQna
 */
@WebServlet(urlPatterns = {"/admin/adNotice/adQnaList.do","/admin/adNotice/adQnaView.do","/admin/adNotice/adQnaAnswer.do",
		"/admin/adNotice/adQnaAnswerOK.do","/admin/adNotice/adQnaDelOK.do"})
public class AdminQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminQnaController() {
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
		
		case "/admin/adNotice/adQnaList.do":
			command =  new AdQnaListCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adQnaList.jsp";
			break;
		
		case "/admin/adNotice/adQnaView.do":
			command =  new AdQnaViewCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adQnaView.jsp";
			break;

			
		case "/admin/adNotice/adQnaAnswerOK.do":
			command =  new AdQnaAnswerOKCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adQnaAnswerOK.jsp";
			break;
			
		case "/admin/adNotice/adQnaDelOK.do":
			command =  new AdQnaDelOK();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adQnaDelOK.jsp";
			break;
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
	}
	
	
}
