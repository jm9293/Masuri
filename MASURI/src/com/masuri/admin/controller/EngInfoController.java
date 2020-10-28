package com.masuri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.admin.command.EngCreateChkCommand;
import com.masuri.admin.command.EngCreateCommand;
import com.masuri.admin.command.EngEditCommand;
import com.masuri.admin.command.EngInfoCommand;
import com.masuri.admin.command.EngSearchCommand;
import com.masuri.admin.command.EngStatusChkCommand;
import com.masuri.command.Command;

@WebServlet(urlPatterns = {
		"/admin/adEng/adEngEdit.do","/admin/adEng/adEngInfo.do",
		"/admin/adEng/adEngStatusChk.do","/admin/adEng/adEngSearch.do",
		"/admin/adEng/adEngCreate.do","/admin/adEng/adEngCreateOk.do"})
public class EngInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public EngInfoController() {
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
	
		//컨트롤러는 다음의 두가지를 결정해야 한다
		Command command = null; //어떠한 로직을 수행할 지 결정
		String viewPage = null; //어떠한 페이지(뷰)로 보여줄지 결정
		
		switch (com) {
		case "/admin/adEng/adEngEdit.do":
			command = new EngEditCommand();
			command.execute(request, response);
			viewPage = "/admin/adEng/adEngEdit.jsp";
			break;
		case "/admin/adEng/adEngInfo.do":
			command = new EngInfoCommand();
			command.execute(request, response);
			viewPage = "/admin/adEng/adEngInfo.jsp";
			break;
		case "/admin/adEng/adEngStatusChk.do":
			command = new EngStatusChkCommand();
			command.execute(request, response);
			viewPage = "/admin/adEng/adEngStatusChk.jsp";
			break;
		case "/admin/adEng/adEngSearch.do":
			command = new EngSearchCommand();
			command.execute(request, response);
			viewPage = "/admin/adEng/adEngSearch.jsp";
			break;
		case "/admin/adEng/adEngCreate.do":
			command = new EngCreateChkCommand();
			command.execute(request, response);
			viewPage = "/admin/adEng/adEngCreate.jsp";
			break;
		case "/admin/adEng/adEngCreateOk.do":
			command = new EngCreateCommand();
			command.execute(request, response);
			viewPage = "/admin/adEng/adEngCreateOk.jsp";
			break;
		}
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
