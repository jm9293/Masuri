package com.masuri.engineer.command;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.dao.MonthscheduleDAO;
import com.masuri.dto.MonthscheduleDTO;

public class ScheduleCommand implements Command{

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		response.setCharacterEncoding("UTF-8");
		String rest = request.getParameter("rest");
		int day = Integer.parseInt(request.getParameter("year")); 
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("enlogin");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	
		int mon = 0;
		if(request.getParameter("mon")!=null&&!request.getParameter("mon").equals("")) {
			mon = Integer.parseInt(request.getParameter("mon"))-1;
		}
		
		
		try {
			if(rest!=null&&!rest.equals("")) {
				
			
			int cnt = MonthscheduleDAO.delete(mon+1, id);
			System.out.println("rest"+rest.split(",").length);
			
			ArrayList<MonthscheduleDTO> list = new ArrayList<MonthscheduleDTO>();
				
									
				for (String sr :rest.split(",")) {
					MonthscheduleDTO dto = new MonthscheduleDTO();
					if(sr.equals("휴무")) {
						request.setAttribute("retry", 2);
						break;
					}
						dto.setEngid(id);
						dto.setMonth(mon+1);
						dto.setHoliday(new Date(day,mon,Integer.parseInt(sr)));
						list.add(dto);
				
				}
			
	
				int cntInsert = 0;
				for (MonthscheduleDTO ms : list) {
					
					cntInsert = MonthscheduleDAO.insert(ms);
				}
				

			}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			
		
		
	}

}
