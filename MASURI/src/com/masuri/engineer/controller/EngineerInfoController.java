package com.masuri.engineer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.engineer.command.*;


@WebServlet(urlPatterns = {"/engineer/info.info","/engineer/change.info","/engineer/after.info"})
public class EngineerInfoController extends HttpServlet{

	public EngineerInfoController() {
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
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
			
		// 컨트롤러는 다음의 두가지를 결정해야 한다
		Command command = null;  // 어떠한 로직을 수행할지 결정
		String viewPage =  null;  //  어떠한 페이지(뷰)를 보여줄지 결정
		
		//command = new ScheduleRegist();
		// 컨트롤러는 커맨드에 따라 로직 수행
		// 결과를 보낼 view 를 결정
		switch(com) {
			case "/engineer/info.info":
				command = new EngineerInfomation();
				command.execute(request, response);
				viewPage = "info/info.jsp";
				break;
			
			case "/engineer/change.info":
				command = new InfoChangeEngineer();
				command.execute(request, response);
				viewPage = "info/change.jsp";
				break;
				
			case "/engineer/after.info":
				command = new InfoAfterEngineer();
				command.execute(request, response);
				viewPage = "info/after.jsp";
			
		}	
		// 위에서 결정된 view 에 forward 해줌
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
	
	}
	
	
	
}
