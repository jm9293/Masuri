package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class AdQnaDelOK implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
int num = Integer.parseInt(request.getParameter("uid"));
		
		int result = 0;
		QnaDTO dto = new QnaDTO();
		dto.setNum(num);
		
		
		
		try {
			result = QnaDAO.delete(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
		
	}

}
