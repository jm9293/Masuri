package com.masuri.admin.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.admin.command.AdQnaCommand;
import com.masuri.admin.command.AdQnaViewCommand;
import com.masuri.admin.command.AdQnaWriteCommand;
import com.masuri.admin.command.AdQnaWriteOK;
import com.masuri.command.Command;

/**
 * Servlet implementation class QnAController
 */
@WebServlet(urlPatterns = {"/admin/adQna.do","/admin/adQnaOK.do",
		"/admin/adQnaWrite.do","/admin/adQnaView.do"})
public class QnAController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public QnAController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		// URL, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		Command command = null; //어떠한 로직을 수행할 지 결정
		String viewPage = null; //어떠한 페이지(뷰)로 보여줄지 결정
		
		switch(com) {
		
		case "/admin/adQna.do":
			command =  new AdQnaCommand();
			command.execute(request, response);
			viewPage = "/admin/adQna.jsp";
			break;
			
		case "/admin/adQnaOK.do":
			command =  new AdQnaWriteOK();
			command.execute(request, response);
			viewPage = "/admin/adQnaOK.jsp";
			break;
			
		case "/admin/adQnaWrite.do":
			command =  new AdQnaWriteCommand();
			command.execute(request, response);
			viewPage = "/admin/adQnaWrite.jsp";
			break;
			
		case "/admin/adQnaView.do":
			command =  new AdQnaViewCommand();
			command.execute(request, response);
			viewPage = "/admin/adQnaView.jsp";
			break;
		
		
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	}
	
	
	
}
