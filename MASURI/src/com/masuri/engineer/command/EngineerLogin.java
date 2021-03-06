package com.masuri.engineer.command;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.dao.EngineerDAO;
import com.masuri.dto.EngineerDTO;
import com.masuri.engineer.command.Command;

public class EngineerLogin implements Command{

	public static final HashMap<String, HttpSession> engineerID = new HashMap<String, HttpSession>();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("UTF-8");
//		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		
		/// chk --> 로그인 chk --> 1 상관x
		
		if(session.getAttribute("enlogin")!=null) {
			
			if(engineerID.containsKey(id)) {
				
				request.setAttribute("chk", 1);	//로그인중
				
			}else {
				session.removeAttribute("enlogin");
				request.setAttribute("chk", 1);
			}
			
			
			
		}else {	//새접속
			boolean check = EngineerDAO.logincheck(id, pw);
			boolean black = EngineerDAO.stateCheck(id);
			
			if(check&&!black) {
				// 맞으면 세션주고 자리 만들어주고
				
				if(engineerID.containsKey(id)) {
						//세션만료
					engineerID.get(id).removeAttribute("enlogin");
					
					request.setAttribute("chk", 0);
				}else {
					request.setAttribute("chk", 0);
				}
				engineerID.put(id, session);
				session.setAttribute("enlogin", id);
				
			}else if(check){	//블랙리스트
				request.setAttribute("chk", 3);
				
			}else {	/// 비밀번호 틀림
				request.setAttribute("chk", 1);
			}
			
		}
		
		
		
	}
}