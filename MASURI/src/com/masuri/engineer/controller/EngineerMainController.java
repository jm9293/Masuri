package com.masuri.engineer.controller;

import java.io.IOException;

import com.masuri.engineer.command.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(urlPatterns = {"/engineer/main.do","/engineer/logout.do"})
public class EngineerMainController extends HttpServlet{

	public EngineerMainController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	
		request.setCharacterEncoding("UTF-8");
		
		
		// URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력

		
		// 컨트롤러는 다음의 두가지를 결정해야 한다
		Command command = null;  // 어떠한 로직을 수행할지 결정
		String viewPage =  null;  //  어떠한 페이지(뷰)를 보여줄지 결정
		
		//command = new ScheduleRegist();
		// 컨트롤러는 커맨드에 따라 로직 수행
		// 결과를 보낼 view 를 결정
		
		switch(com) {
			case "/engineer/main.do":
				command = new EngineerMain();
				command.execute(request, response);
				viewPage = "engineermain.jsp";
				break;
				
			case "/engineer/logout.do":
				command = new Engineerlogout();
				command.execute(request, response);
				viewPage = "engineerlogout.jsp";
				break;
				
		
		}	
		// 위에서 결정된 view 에 forward 해줌
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
	
	}
	
	
	
}
