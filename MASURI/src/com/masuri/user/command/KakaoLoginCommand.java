package com.masuri.user.command;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;
import com.masuri.dto.UserDTO;
import com.masuri.file.DefaultImgSet;

public class KakaoLoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		    String id = request.getParameter("kakaoid");
		    String email = request.getParameter("kakaoemail");
			try {
				
				
				if(UserDAO.idcheck(email.split("@")[0])) { // 해당아이디가 있다면 
					HttpSession session = request.getSession();
					session.setAttribute("login", email.split("@")[0]);
					LoginCommand.Users.put(email.split("@")[0], session);
					request.setAttribute("res", 1);
				}else {
					UserDTO newuser = new UserDTO();
					newuser.setName("카카오유저");
					newuser.setEmail(email);
					newuser.setPassword(id);
					newuser.setId(email.split("@")[0]);
					newuser.setPhone("01000000000");
					int resNum = UserDAO.insert(newuser);
					if(resNum==1) {
						HttpSession session = request.getSession();
						session.setAttribute("login", email.split("@")[0]);
						LoginCommand.Users.put(email.split("@")[0], session);
					    DefaultImgSet.imgSet(request, "userimg", email.split("@")[0]);
					    request.setAttribute("res", 2);
					}else {
						request.setAttribute("res", 0);
					}
					
					
				}	
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("res", 0);
			}
			 
			
		
		
		

	}

}
