package com.masuri.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.user.command.EcoIntroCommand;

/**
 * Servlet implementation class EcoController
 */
@WebServlet(urlPatterns = {"/user/eco/eco_intro"})
public class EcoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public EcoController() {
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
		case "/user/eco/eco_intro":
			command = new EcoIntroCommand();
			command.execute(request, response);
			viewPage = "/user/eco/eco_intro1.jsp";
			break;
		
		}
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
