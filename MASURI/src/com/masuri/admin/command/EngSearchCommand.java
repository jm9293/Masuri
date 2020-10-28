package com.masuri.admin.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dao.UserDAO;
import com.masuri.dto.EngineerDTO;
import com.masuri.dto.UserDTO;

public class EngSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<EngineerDTO> list = null;
		ArrayList<EngineerDTO> list2 =  new ArrayList<EngineerDTO>();
		String text = request.getParameter("text").trim();
		String [] selectMenu = request.getParameterValues("selectMenu");
		System.out.println(selectMenu[0]);
		try {
			
			list = EngineerDAO.select();
			
			for (int i = 0; i < list.size(); i++) {
				if(selectMenu[0].toString().equals("id_sch") && (list.get(i).getId().equals(text) || list.get(i).getId().contains(text))) {
					list2.add(list.get(i));
				}else if(selectMenu[0].toString().equals("name_sch") && (list.get(i).getName().equals(text) || list.get(i).getName().contains(text))) {
					list2.add(list.get(i));
				}else if(selectMenu[0].toString().equals("num_sch") && (list.get(i).getPhone().equals(text) || list.get(i).getPhone().contains(text))) {
					list2.add(list.get(i));
				}
			}
			list = list2;
			request.setAttribute("list", list);
			request.setAttribute("text", text);
			request.setAttribute("selectMenu", selectMenu);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
