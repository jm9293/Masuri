package com.masuri.admin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.FaqDAO;
import com.masuri.dto.FaqDTO;

public class AdFaqWriteOKCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		int result = 0;
		FaqDTO dto = new FaqDTO();
		
		dto.setQuestion(question);
		dto.setAnswer(answer);
		try {
			
			result = FaqDAO.insert(dto);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("result", result);
	}

}
