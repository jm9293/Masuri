package com.masuri.user.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.user.command.ResCenterCommand;
import com.masuri.user.command.ResCompleteCommend;
import com.masuri.user.command.ResHomeCommand;
import com.masuri.user.command.ResViewCommend;
import com.masuri.user.command.ResWriteCommend;
import com.masuri.user.command.ReschkHomeCommend;
import com.masuri.user.command.ReschkCommend;



@WebServlet(urlPatterns = {"/user/res/res1.do","/user/res/res2.do","/user/res/reswrite.do","/user/res/rescomplete.do","/user/res/res_chk1.do","/user/res/res_chk2.do","/user/res/res_view.do"})
public class ResController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ResController() {
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
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.length());
		 
	
		System.out.println("uri: " + uri);
		System.out.println("conPath " + conPath);
		System.out.println("com " + com);
		
		Command command = null; 
		String viewPage = null;
		
		System.out.println(com);
		
		switch (com) {
		
		case "res1.do":
			System.out.println("출장예약");
			command = new ResHomeCommand();
			command.execute(request, response);
			viewPage = "/user/res/engneerselect.jsp";
			break;
			
		case "res2.do":
			System.out.println("방문예약");
			command = new ResCenterCommand();
			command.execute(request, response);
			viewPage = "/user/res/engneerselect.jsp";
			break;
			
		case "reswrite.do":
			System.out.println("수리신청서 작성");
			command = new ResWriteCommend();
			command.execute(request, response);
			viewPage = "/user/res/reswrite.jsp";
			break;
			
		case "rescomplete.do":
			System.out.println("수리신청서 작성완료");
			command = new ResCompleteCommend();
			command.execute(request, response);
			viewPage = "/user/res/rescomplete.jsp";
			break;
			
		case "res_chk1.do":
			System.out.println("수리신청서 출장현황확인");
			command = new ReschkCommend();
			command.execute(request, response);
			viewPage = "/user/res/res_chk1.jsp";
			break;
			
		case "res_chk2.do":
			System.out.println("수리신청서 예약현황확인");
			command = new ReschkHomeCommend();
			command.execute(request, response);
			viewPage = "/user/res/res_chk2.jsp";
			break;
			
		case "res_view.do":
			System.out.println("수리신청서 보기");
			command = new ResViewCommend();
			command.execute(request, response);
			viewPage = "/user/res/res_view.jsp";
			break;	
		
		}
		
		
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
