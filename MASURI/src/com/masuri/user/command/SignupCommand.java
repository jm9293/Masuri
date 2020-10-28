package com.masuri.user.command;


import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;
import com.masuri.dto.UserDTO;
import com.masuri.file.DefaultImgSet;

public class SignupCommand implements Command {
	
	static String [] regarr = {
			"[a-z0-9]{4,6}",
			"(?=.*[a-zA-Z])(?=.*\\d).{6,8}",
			"[가-힣]{2,}",
			"[0-9]{10,11}",
			"[a-z0-9_+.-]+@([a-z0-9-]+\\.)+[a-z0-9]{2,4}"
			};
	

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String inputID = request.getParameter("inputID");
		String inputPW = request.getParameter("inputPW");
		String inputPWCHK = request.getParameter("inputPWCHK");
		String inputNAME = request.getParameter("inputNAME");
		String inputPhone = request.getParameter("inputPhone");
		String inputEmail = request.getParameter("inputEmail");
		String emailSelect = request.getParameter("emailSelect");
		String inputEmaildirect = request.getParameter("inputEmaildirect");
		String email ="";
		int res = 0;
		
		boolean nullchk = inputID!=null&&inputPW!=null&&inputPWCHK!=null&&inputNAME!=null&&inputPhone!=null&&inputEmail!=null
				&&emailSelect!=null&&inputEmaildirect!=null;
		if(!nullchk) {
			res = 0;
			request.setAttribute("res", res);
			return;
		}
		
		if(inputEmaildirect.equals("직접입력")) {
			email = inputEmail+"@"+emailSelect;
		}else {
			email = inputEmail+"@"+inputEmaildirect;
		}
		
		
		
		boolean regchk = Pattern.matches(regarr[0], inputID) // 정규식 체크 , id중복체크
				&&Pattern.matches(regarr[1], inputPW)
				&&inputPWCHK.equals(inputPW)
				&&Pattern.matches(regarr[2], inputNAME)
				&&Pattern.matches(regarr[3], inputPhone)
				&&Pattern.matches(regarr[4], email)
				&&!UserDAO.idcheck(inputID);
		
		if(regchk) {
			
			UserDTO user = new UserDTO();
			user.setId(inputID);
			user.setPassword(inputPW);
			user.setName(inputNAME);
			user.setPhone(inputPhone);
			user.setEmail(email);
			
			try {
				res = UserDAO.insert(user);
				DefaultImgSet.imgSet(request, "userimg", inputID);
				request.setAttribute("res", res);
			} catch (Exception e) {
				res = 0;
				request.setAttribute("res", res);
				e.printStackTrace();
			}
		}else {
			res = 0;
			request.setAttribute("res", res);
		}
		
		
	}

}
