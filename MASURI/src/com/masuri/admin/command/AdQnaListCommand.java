package com.masuri.admin.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class AdQnaListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList<QnaDTO> list = null;
		int page =1;
		try {
			page = Integer.parseInt(request.getParameter("page"));
			
		} catch (Exception e) {
			
		}
		
		try {
			int max = QnaDAO.getMaxPage();
			if(page < 1) {
				page = 1;
			}else if(page > max) {
				page = max;
			}
			list = QnaDAO.selectpage(page);
			
			request.setAttribute("list", list);
			request.setAttribute("max", max);
			request.setAttribute("page", page);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		
		
	}

}
