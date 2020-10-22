package com.masuri.user.controller;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.user.command.FaqCommand;
import com.masuri.user.command.NoticeCommand;
import com.masuri.user.command.NoticeViewCommand;


@WebServlet(urlPatterns = {
		"/user/support/sup_FAQ", "/user/support/sup_Notice",
		"/user/support/sup_NoticeView"})
public class SupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SupController() {
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
		case "/user/support/sup_FAQ":
			command = new FaqCommand();
			command.execute(request, response);
			viewPage = "/user/support/sup_FAQ.jsp";
			break;
		case "/user/support/sup_Notice":
			command = new NoticeCommand();
			command.execute(request, response);
			viewPage = "/user/support/sup_Notice.jsp";
			break;
		case "/user/support/sup_NoticeView":
			command = new NoticeViewCommand();
			command.execute(request, response);
			viewPage = "/user/support/sup_NoticeView.jsp";
			break;
		}
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
