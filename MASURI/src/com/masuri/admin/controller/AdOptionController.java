package com.masuri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.admin.command.AdOptionCommand;
import com.masuri.admin.command.AdOptionDelCommand;
import com.masuri.admin.command.AdOptionEXOKCommand;
import com.masuri.admin.command.AdOptionExCommand;
import com.masuri.admin.command.AdOptionView;
import com.masuri.command.Command;

/**
 * Servlet implementation class AdOptionController
 */
@WebServlet(urlPatterns = {
		"/admin/adOption/adOption.do","/admin/adOption/adOptionEx.do","/admin/adOption/adOptionView.do",
		"/admin/adOption/adOptionExOK.do","/admin/adOption/optionDel.do"
})
public class AdOptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdOptionController() {
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
		
		case "/admin/adOption/adOption.do":
			command = new AdOptionCommand();
			command.execute(request, response);
			viewPage = "/admin/adOption/adOption.jsp";
			break;
		
		case "/admin/adOption/adOptionEx.do":
			command = new AdOptionExCommand();
			command.execute(request, response);
			viewPage = "/admin/adOption/adOptionEx.jsp";
			break;
			
		case "/admin/adOption/adOptionView.do":
			command = new AdOptionView();
			command.execute(request, response);
			viewPage = "/admin/adOption/adOptionView.jsp";
			break;
			
		case "/admin/adOption/adOptionExOK.do":
			command = new AdOptionEXOKCommand();
			command.execute(request, response);
			viewPage = "/admin/adOption/adOptionExOK.jsp";
			break;
			
		case "/admin/adOption/optionDel.do":
			command = new AdOptionDelCommand();
			command.execute(request, response);
			viewPage = "/admin/adOption/optionDel.jsp";
			break;
					
		}
		

		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	}
	
	
}
