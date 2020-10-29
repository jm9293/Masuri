package com.masuri.command;

import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.dao.UserDAO;
import com.masuri.dto.UserDTO;
import com.masuri.file.DefaultImgSet;
import com.masuri.file.Fileupload;
import com.oreilly.servlet.MultipartRequest;

public class UserUpdateGoCommand implements Command {
	String [] regarr = {
			"[a-z0-9]{4,6}",
			"(?=.*[a-zA-Z])(?=.*\\d).{6,8}",
			"[가-힣]{2,}",
			"[0-9]{10,11}",
			"[a-z0-9_+.-]+@([a-z0-9-]+\\.)+[a-z0-9]{2,4}"
			};
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserDTO user = null;
		String userID = (String)request.getSession().getAttribute("login");
		MultipartRequest multi = Fileupload.proflieImgupload(request, "file", "userimg", userID);
		String inputfile = multi.getParameter("file");
		String inputPW = multi.getParameter("inputPW");
		String inputPWCHK = multi.getParameter("inputPWCHK");
		String inputPhone = multi.getParameter("inputPhone");
		String inputEmail = multi.getParameter("inputemail");
	
		System.out.println(inputPhone);
		boolean regchk = false;
		int res = 0;
		
		try {
			user = UserDAO.select(userID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(user==null) {
			res = 0;
			request.setAttribute("res", res);
			return;
		}
		
		if(inputfile!=null) {
			regchk = true;
		}
		
		if(inputPW!=null&&Pattern.matches(regarr[1], inputPW)&&inputPWCHK!=null&&inputPW.equals(inputPWCHK)) {
			user.setPassword(inputPW);
			regchk = true;
		}
		
		
		if(inputPhone!=null&&Pattern.matches(regarr[3], inputPhone)) {
			user.setPhone(inputPhone);
			regchk = true;
		}
		
		if(inputEmail!=null&&Pattern.matches(regarr[4], inputEmail)) {
			user.setEmail(inputEmail);
			regchk = true;
		}
		
	
		if(regchk) {
			res = 1;
			try {
				UserDAO.update(user);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("res", res);
		}else {
			res = 0;
			request.setAttribute("res", res);
		}

	}

}
