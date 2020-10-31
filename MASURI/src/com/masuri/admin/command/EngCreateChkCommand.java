package com.masuri.admin.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dto.EngineerDTO;

public class EngCreateChkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<String> idList = new ArrayList<String>();
	    try {
			for (EngineerDTO eng : EngineerDAO.select()) {
				idList.add(eng.getId());
				   request.setAttribute("idList", idList);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	 

	}

}
