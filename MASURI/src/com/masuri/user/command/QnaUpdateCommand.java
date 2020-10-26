package com.masuri.user.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class QnaUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		String page = request.getParameter("page");
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String openstr = request.getParameter("open");
		boolean open = openstr==null;
		QnaDTO dto = new QnaDTO();
		
		dto.setNum(uid);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setOpen(open);
		
		if(title != null &&  content != null && title.trim().length() >0 && 
				content.trim().length() > 0) {
			try {
				cnt = QnaDAO.update(dto);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		request.setAttribute("result", cnt);
		request.setAttribute("page", page);
	}

}
