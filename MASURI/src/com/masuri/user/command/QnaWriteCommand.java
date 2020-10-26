package com.masuri.user.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class QnaWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		String userid = request.getParameter("userID");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String openstr = request.getParameter("open");
		boolean open = openstr==null;
		QnaDTO dto = new QnaDTO();
		
		dto.setUserid(userid);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setOpen(open);
		
		if(userid != null && title != null &&  content != null &&
				userid.trim().length() > 0 && title.trim().length() >0 && 
				content.trim().length() > 0) {
			try {
				cnt = QnaDAO.insert(dto);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		request.setAttribute("result", cnt);

	}

}
