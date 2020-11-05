package com.masuri.engineer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import com.masuri.engineer.command.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/engineer/register.do","/engineer/schedulecheck.do","/engineer/schedule.do"
		,"/engineer/check.do","/engineer/selected.do","/engineer/visit.do"})
public class ScheduleController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
		public ScheduleController() {
			// TODO Auto-generated constructor stub
		}
	  
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			actionDo(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			actionDo(request, response);
		}
		
		protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
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
				case "/engineer/register.do":
					command = new ScheduleRegist();
					command.execute(request, response);
					viewPage = "schedule/scheduleregister.jsp";
					break;
				
				case "/engineer/schedulecheck.do":
					command = new ScheduleChecking();
					command.execute(request, response);
					viewPage = "schedule/schedulecheck.jsp";
					break;
					
				case "/engineer/schedule.do":
					System.out.println("너 접속햇니...?");
					command = new ScheduleCommand();
					command.execute(request, response);
					viewPage = "schedule/schedule.jsp";
					break;
				
				case "/engineer/selected.do":
					command = new SelectedView();
					command.execute(request, response);
					viewPage = "schedule/select.jsp";
					break;
					
				case "/engineer/visit.do":
					command = new VisitCheck();
					command.execute(request, response);
					viewPage = "schedule/selectres.jsp";
					break;
				
			}	

			// 위에서 결정된 view 에 forward 해줌
			if(viewPage != null) {
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
				
			}
			
		} // end actionDo()
		
	
}
