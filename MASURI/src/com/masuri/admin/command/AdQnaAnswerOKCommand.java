package com.masuri.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class AdQnaAnswerOKCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		QnaDTO dto = new QnaDTO();
		
		String answer =  request.getParameter("answer");
		int num = Integer.parseInt(request.getParameter("uid"));
		int result = 0;
		
		dto.setAnswer(answer);
		dto.setNum(num);
		
		try {
			
			result = QnaDAO.updateAnswer(dto);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("result", result);
	}

}
