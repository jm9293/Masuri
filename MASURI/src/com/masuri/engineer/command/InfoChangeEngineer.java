package com.masuri.engineer.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.dao.EngineerDAO;
import com.masuri.dto.EngineerDTO;
import com.masuri.engineer.command.Command;
import com.masuri.file.Fileupload;
import com.oreilly.servlet.MultipartRequest;

public class InfoChangeEngineer implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	
	String id = "";
		
		try {
			
			response.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			id = (String)session.getAttribute("enlogin");
			
			if(id!=null&&!id.equals("")) {
				EngineerDTO dto = EngineerDAO.select(id);
				request.setAttribute("id", id);
				
				if(dto.getPassword()!=null&&!dto.getPassword().equals("")) {
					request.setAttribute("pwKey", dto.getPassword());
				}
				request.setAttribute("intro", dto.getIntro());
			}else {
				request.setAttribute("chk", 1);
			}
			
			
			
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
	
		
	}

}
