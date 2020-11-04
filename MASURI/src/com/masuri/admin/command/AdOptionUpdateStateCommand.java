package com.masuri.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.ReslistDAO;
import com.masuri.dto.ReslistDTO;

public class AdOptionUpdateStateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ReslistDTO dto = null;
		String state = null;
		int num = 0; 
		int result = 0;
		
		
		try {
			num = Integer.parseInt(request.getParameter("uid"));
			dto =  ReslistDAO.select(num);	// dto = 보고있는 게시 글
			state = dto.getState();
			if(state.equals("*수리완료")) {
				dto.setState("신청완료");
			}else if(state.equals("신청완료")){
				dto.setState("*수리완료");
			}
			
			
			result = ReslistDAO.updateState(dto);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("result", result);
		

	}

}
