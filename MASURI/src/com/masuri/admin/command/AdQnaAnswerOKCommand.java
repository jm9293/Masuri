package com.masuri.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class AdQnaWriteOK implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String title = request.getParameter("TITLE");
		String content = request.getParameter("CONTENT");
		int result = 0;
		QnaDTO dto = new QnaDTO();
		
		try {
			dto.setTitle(title);
			dto.setContent(content);
			
			result = QnaDAO.insert(dto);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("result", result);
	}

}
