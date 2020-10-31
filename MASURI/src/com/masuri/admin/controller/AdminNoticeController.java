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



@WebServlet(urlPatterns = {"/admin/adNotice/adNotice.do","/admin/adNotice/adWrite.do","/admin/adNotice/adRead.do",
		"/admin/adNotice/adWriteOK.do","/admin/adNotice/adNoticeUpdate.do","/admin/adNotice/adNoticeUpdateOK.do","/admin/adNotice/adNoticeDelOK.do"})
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
		case "/admin/adNotice/adNotice.do":
			command =  new AdNoticeCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adNotice.jsp";
			break;
			
		case "/admin/adNotice/adWriteOK.do":
			command =  new AdWriteOK();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adWriteOK.jsp";
			break;
			
		case "/admin/adNotice/adWrite.do":
			command =  new AdWriteCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adWrite.jsp";
			break;
			
		case "/admin/adNotice/adRead.do":
			command =  new AdViewCommand();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adRead.jsp";
			break;
			
		case "/admin/adNotice/adNoticeUpdate.do":
			command =  new AdNoticeUpdate();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adNoticeUpdate.jsp";
			break;
			
		case "/admin/adNotice/adNoticeUpdateOK.do":
			command =  new AdNoticeUpdateOK();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adNoticeUpdateOK.jsp";
			break;
			
		case "/admin/adNotice/adNoticeDelOK.do":
			command =  new AdNoticeDelOK();
			command.execute(request, response);
			viewPage = "/admin/adNotice/adNoticeDelOK.jsp";
			break;
		} 
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
		
	}
}
