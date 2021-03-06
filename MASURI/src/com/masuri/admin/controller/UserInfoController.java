package com.masuri.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.admin.command.MainCommand;
import com.masuri.admin.command.UserBlackChkCommand;
import com.masuri.admin.command.UserEditCommand;
import com.masuri.admin.command.UserInfoCommand;
import com.masuri.admin.command.UserSearchCommand;
import com.masuri.command.Command;

@WebServlet(urlPatterns = {
		"/admin/adUser/adUserEdit.do", "/admin/adUser/adUserInfo.do",
		"/admin/adUser/adUserBlackChk.do", "/admin/adUser/adUserSearch.do"})
public class UserInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserInfoController() {
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
		String com = uri.substring(conPath.length());
		
		//테스트 출력
				System.out.println("uri: " + uri);
				System.out.println("conPath " + conPath);
				System.out.println("com " + com);
		//컨트롤러는 다음의 두가지를 결정해야 한다
		Command command = null; //어떠한 로직을 수행할 지 결정
		String viewPage = null; //어떠한 페이지(뷰)로 보여줄지 결정
		
		switch (com) {
		case "/admin/adUser/adUserEdit.do":
			command = new UserEditCommand();
			command.execute(request, response);
			viewPage = "/admin/adUser/adUserEdit.jsp";
			break;
		case "/admin/adUser/adUserInfo.do":
			command = new UserInfoCommand();
			command.execute(request, response);
			viewPage = "/admin/adUser/adUserInfo.jsp";
			break;
		case "/admin/adUser/adUserBlackChk.do":
			command = new UserBlackChkCommand();
			command.execute(request, response);
			viewPage = "/admin/adUser/adUserBlackChk.jsp";
			break;
		case "/admin/adUser/adUserSearch.do":
			command = new UserSearchCommand();
			command.execute(request, response);
			viewPage = "/admin/adUser/adUserSearch.jsp";
			break;
		}
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
