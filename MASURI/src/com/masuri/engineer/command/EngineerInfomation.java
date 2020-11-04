package com.masuri.engineer.command;

import com.masuri.file.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.dao.EngineerDAO;
import com.masuri.dto.EngineerDTO;
import com.masuri.engineer.command.Command;
import com.oreilly.servlet.MultipartRequest;

public class EngineerInfomation implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		
		try {
			
			response.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("enlogin");
			if(id!=null&&!id.equals("")) {
				System.out.println(request.getParameter("state")+"state");
				EngineerDTO dto = EngineerDAO.select(id);
				
				request.setAttribute("name", dto.getName());
				request.setAttribute("id", dto.getId());
				request.setAttribute("intro", dto.getIntro());
				request.setAttribute("area", dto.getArea());

			}else {
				request.setAttribute("chk", 1);
			}
			
			System.out.println(request.getParameter("local"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
