
package com.masuri.engineer.command;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.dao.DayscheduleDAO;
import com.masuri.dao.MonthscheduleDAO;
import com.masuri.dao.ReslistDAO;
import com.masuri.dto.DayscheduleDTO;
import com.masuri.dto.MonthscheduleDTO;
import com.masuri.dto.ReslistDTO;

public class ScheduleChecking implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		/// date 데이터 
		response.setCharacterEncoding("utf-8");
		String id = (String)request.getSession().getAttribute("enlogin");
		
		SimpleDateFormat sdf = new SimpleDateFormat("d");
		Date week = new Date();
		ArrayList<String> date = new ArrayList<String>();
		ArrayList<String> datecont = new ArrayList<String>();
		try {
			
			if(id!=null&&!id.equals("")) {
			
				int day = week.getDate();
			
			    ArrayList<Integer> intarr =  new  ArrayList<Integer>();
				for (int i = day; i <= day+7; i++) {
					week.setDate(i);
					intarr.add(i);
					String workday = week.getDate()+"";
					date.add(workday);
				}
				
				
				request.setAttribute("week", date);
				String sel = request.getParameter("selected");
				if(sel==null) {
					sel = day+"";
				}
				//// sel == 누른값
				request.setAttribute("date", sel);
				
				if(sel!=null&&!sel.equals("")) {
					
					int select = Integer.parseInt(sel);
					/// 숫자로 바꿈 ㄴ
					ArrayList<Integer> time = new ArrayList<Integer>();
					ArrayList<ReslistDTO> arr = ReslistDAO.select();
					sdf = new SimpleDateFormat("yy-MM-dd");
					
					week.setDate(select);
					// 날짜 맞춰서				
					
					week = sdf.parse(sdf.format(week));
					
					DayscheduleDTO tt = DayscheduleDAO.select(id, new java.sql.Date(week.getTime()));
					
					if(tt!=null) {
						if(sdf.format(tt.getDay()).equals(sdf.format(week))) {			
							if(tt.getTime1()!=0) {
							time.add(tt.getTime1());
							}
							if(tt.getTime2()!=0) {
							time.add(tt.getTime2());
							}
							if(tt.getTime3()!=0) {
							time.add(tt.getTime3());
							}
						}
						
						
					}else {
					}
					
					ArrayList<ReslistDTO> resarr = new ArrayList<ReslistDTO>();
					for (int a : time) {
						resarr.add(ReslistDAO.select(a));
					}
					
					System.out.println(tt);// Date 가져오는 방법이 다른건지 확인 한번만 해줏에ㅛ
					// 네네넨ㄴ 마자여  선택일자에 날짜 맞춘거에여 아니 글씨도 잘안써지네 왜이래,,,ㅎ
					
					request.setAttribute("time", time);			
					request.setAttribute("resarr", resarr);	
				}
			
			}else {
				request.setAttribute("chk", 1);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		
	}

}

