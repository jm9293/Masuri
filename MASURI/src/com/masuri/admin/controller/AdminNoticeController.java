package com.masuri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.admin.command.AdNoticeCommand;
import com.masuri.admin.command.AdNoticeDelOK;
import com.masuri.admin.command.AdNoticeUpdate;
import com.masuri.admin.command.AdNoticeUpdateOK;
import com.masuri.admin.command.AdViewCommand;
import com.masuri.admin.command.AdWriteCommand;
import com.masuri.admin.command.AdWriteOK;
import com.masuri.command.Command;



@WebServlet(urlPatterns = {"/admin/adNotice.do","/admin/adWrite.do","/admin/adRead.do",
		"/admin/adWriteOK.do","/admin/adNoticeUpdate.do","/admin/adNoticeUpdateOK.do","/admin/adNoticeDelOK.do"})
public class AdminNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminNoticeController() {
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
		String com = uri.substring(conPath.length());
		
		Command command = null; //어떠한 로직을 수행할 지 결정
		String viewPage = null; //어떠한 페이지(뷰)로 보여줄지 결정
		
		switch(com) {
		case "/admin/adNotice.do":
			command =  new AdNoticeCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice.jsp";
			break;
			
		case "/admin/adWriteOK.do":
			command =  new AdWriteOK();
			command.execute(request, response);
			viewPage = "/admin/adWriteOK.jsp";
			break;
			
		case "/admin/adWrite.do":
			command =  new AdWriteCommand();
			command.execute(request, response);
			viewPage = "/admin/adWrite.jsp";
			break;
			
		case "/admin/adRead.do":
			command =  new AdViewCommand();
			command.execute(request, response);
			viewPage = "/admin/adRead.jsp";
			break;
			
		case "/admin/adNoticeUpdate.do":
			command =  new AdNoticeUpdate();
			command.execute(request, response);
			viewPage = "/admin/adNoticeUpdate.jsp";
			break;
			
		case "/admin/adNoticeUpdateOK.do":
			command =  new AdNoticeUpdateOK();
			command.execute(request, response);
			viewPage = "/admin/adNoticeUpdateOK.jsp";
			break;
			
		case "/admin/adNoticeDelOK.do":
			command =  new AdNoticeDelOK();
			command.execute(request, response);
			viewPage = "/admin/adNoticeDelOK.jsp";
			break;
		} 
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
		
	}
}
