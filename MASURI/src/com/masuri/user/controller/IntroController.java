package com.masuri.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {
		"/user/info/Intro_Com.do", "/user/info/Intro_Map.do"})
public class IntroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public IntroController() {
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
		
		String viewPage = null; //어떠한 페이지(뷰)로 보여줄지 결정
		
		switch (com) {
		case "/user/info/Intro_Com.do":
			viewPage = "/user/info/Intro_Com.jsp";
			break;
		case "/user/info/Intro_Map.do":
			viewPage = "/user/info/Intro_Map.jsp";
			break;
		}
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
