package com.masuri.engineer.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.masuri.engineer.command.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.dao.MonthscheduleDAO;
import com.masuri.dto.MonthscheduleDTO;

public class ScheduleRegist implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		/// date 데이터 
		
			response.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("enlogin");
			

				try {
				
					ArrayList<String> dd = new ArrayList<String>();
					Date schedule = new Date();		
					SimpleDateFormat sdf = new SimpleDateFormat("d");
					request.setAttribute("year", schedule.getYear());
	
				if(id!=null&&!id.equals("")) {
						
					// 다음달 구하기
					int mon = schedule.getMonth()+2;
					
					// request로 다음 달 전송
					request.setAttribute("mon", mon);
					schedule.setMonth(mon);
					schedule.setDate(0);
					
					
					// 마지막날, 빈 div 갯수 , 요일 구하기
					int lastday = schedule.getDate();
					int empty = 6-schedule.getDay();
					
					schedule.setDate(1);
					int day = schedule.getDay();
					
					
					for (int i = 0; i < day; i++) {
						
						dd.add("　");
					}
					
					
					for (int i = 1; i <= lastday; i++) {					
						dd.add(i+"");
					}
					
					for(int z = 0; z < empty; z++) {
						dd.add("　");
					}
		
					ArrayList<MonthscheduleDTO> list = MonthscheduleDAO.select(mon, id);
							/// 쉬는날짜 표시 
						for (String st : dd) {
								for (MonthscheduleDTO dto : list) {
										if(st.equals(sdf.format(dto.getHoliday()))) {
											int index = (Integer.parseInt(sdf.format(dto.getHoliday()))+empty-1);
											dd.set(index, "휴무");
											
										}
								}
							}
						
						/// 달력 div에 데이터 값 전송
						request.setAttribute("date", dd);
							
				}else {
				
					request.setAttribute("chk", 1);
				
					
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
				
				
			
				
	}

}
