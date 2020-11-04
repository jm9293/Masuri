package com.masuri.admin.command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.ReslistDAO;
import com.masuri.dto.ReslistDTO;

public class AdOptionSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList<ReslistDTO> list = null;
		ArrayList<ReslistDTO> list2 =  new ArrayList<ReslistDTO>();
		ArrayList<ReslistDTO> userlist = null;
		ArrayList<ReslistDTO> englist = null;
		int upage = 1;
		int epage = 1;
		String id = "";
		boolean type = true;
		String text = request.getParameter("text").trim();
		String [] searchid = request.getParameterValues("searchid");
		
		
		
		
		try {
		upage = Integer.parseInt(request.getParameter("upage"));
		epage = Integer.parseInt(request.getParameter("epage"));
		id = request.getParameter("text");
		} catch(Exception e) {
			
		}
		
		try {
			int umax = ReslistDAO.getMaxPageFromUser(id, type);
			int emax = ReslistDAO.getMaxPageFromEng(id);
			
			if(upage < 1) {
				upage = 1;
			}else if(upage > umax) {
				upage = umax;
			}
			
			if(epage < 1) {
				epage = 1;
			}else if(epage > emax) {
				epage = emax;
			}
			
			
			userlist =  ReslistDAO.selectpageFromUser(upage, id, type);
			englist =  ReslistDAO.selectpageFromEng(epage, id);
			
			request.setAttribute("userlist", userlist);
			request.setAttribute("englist", englist);
			request.setAttribute("umax", umax);
			request.setAttribute("emax", emax);
			request.setAttribute("upage", upage);
			request.setAttribute("epage", epage);
		} catch (SQLException e) {
			
		}
		
		try {
			list = ReslistDAO.select();
			for(int i = 0; i < list.size(); i++) {
				if(searchid[0].toString().equals("userid") && (list.get(i).getUserid().equals(text) || list.get(i).getUserid().contains(text))) {
					list2.add(list.get(i));
				} else if (searchid[0].toString().equals("engid") && (list.get(i).getEngid().equals(text) || list.get(i).getEngid().contains(text))) {
					list2.add(list.get(i));
				} 
			}
			
			list = list2;
			
			request.setAttribute("list", list);
			request.setAttribute("text", text);
			request.setAttribute("searchid", searchid);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
