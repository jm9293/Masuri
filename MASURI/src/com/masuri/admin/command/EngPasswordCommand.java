package com.masuri.admin.command;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dao.UserDAO;
import com.masuri.dto.EngineerDTO;
import com.masuri.dto.UserDTO;
import com.masuri.mail.Sandmail;
import com.masuri.util.BufPassword;

public class EngPasswordCommand implements Command {

	String [] regarr = {
			"[a-z0-9]{4,6}",
			"(?=.*[a-zA-Z])(?=.*\\d).{6,8}",
			"[가-힣]{2,}",
			"[0-9]{10,11}",
			"[a-z0-9_+.-]+@([a-z0-9-]+\\.)+[a-z0-9]{2,4}"
			};
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id = request.getParameter("uid");
			String email = request.getParameter("email");
		
			if(email!=null&&Pattern.matches(regarr[4], email)&&
			   id!=null&&Pattern.matches(regarr[0], id)) {
				System.out.println("여기들어옴?");
			 
			 EngineerDTO eng = EngineerDAO.select(id);
				
			 
			 if(eng==null) {
				 request.setAttribute("res",0);
				 return;
			 }
			 
			 String buf_password = new BufPassword().getBufPassword();
			 eng.setPassword(buf_password);
			 EngineerDAO.update(eng);
			 Sandmail.sand(eng.getEmail(), "임시비밀번호발급내용입니다.", "기사님의 임시비밀번호는 "+buf_password+" 입니다.");
			 request.setAttribute("res",1);
			}else {
			 request.setAttribute("res",0);
			}
			
		} catch (Exception e) {
			request.setAttribute("res",0);
		}
	}

}
