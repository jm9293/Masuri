package com.masuri.user.command;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dto.EngineerDTO;

public class ResCenterCommand implements Command {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			int res =0;
			String inputDAY = request.getParameter("inputDAY");
			int inputTIMEnum = Integer.parseInt(request.getParameter("inputTIME"));
	
			boolean daychk = inputDAY!=null && (sdf.parse(inputDAY).after(new Date()));
			boolean timenumchk = (inputTIMEnum >0 && inputTIMEnum < 4);
			
			
			if(!(daychk&&timenumchk)) { // 파라미터 비정상
				request.setAttribute("res", 0);
				return;
			}    
			
			
			ArrayList<EngineerDTO> list = EngineerDAO.resSelect(new java.sql.Date(sdf.parse(inputDAY).getTime()), inputTIMEnum, "센터"); //기사찿기
			
		
			request.setAttribute("list", list);
			request.setAttribute("inputDAY", inputDAY);
			request.setAttribute("inputTIMEnum", inputTIMEnum);
			request.setAttribute("inputADD", "센터");
			request.setAttribute("sggNm", "센터");
			request.setAttribute("res", 1);
			
			
			} catch (Exception e) {
				request.setAttribute("res", 0);
				e.printStackTrace();
			}

	}

}
