package com.masuri.user.command;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dao.FixlistDAO;
import com.masuri.dto.EngineerDTO;

public class ResWriteCommend implements Command {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			int res =0;
			String inputDAY = request.getParameter("inputDAY");
			int inputTIMEnum = Integer.parseInt(request.getParameter("inputTIMEnum"));
			String inputADD = request.getParameter("inputADD");
			String sggNm = request.getParameter("sggNm");
			String engid = request.getParameter("engid");
			
		    EngineerDTO eng = EngineerDAO.select(engid);
			
			
			boolean daychk = inputDAY!=null && (sdf.parse(inputDAY).after(new Date()));
			boolean timenumchk = (inputTIMEnum >0 && inputTIMEnum < 4);
			boolean addchk = (inputADD.contains("서울특별시")||inputADD.contains("센터"))&&inputADD.contains(sggNm);
			boolean sggNmchk = sggNm!=null;
			boolean engchk = eng!=null;
			
			
			
			if(!(daychk&&timenumchk&&addchk&&sggNmchk&&engchk)) { // 파라미터 비정상
				request.setAttribute("res", res);
				return;
			}    
			
			
			engchk = EngineerDAO.resSelectByid(new java.sql.Date(sdf.parse(inputDAY).getTime()),
					inputTIMEnum, sggNm, engid); // 한번더 해당기사가 예약가능한지 여부 확인
			
			if(!engchk) {
				request.setAttribute("res", 2); // 해당기사와 예약 문제 발생
				return;
			}
			
			
			HashMap<String, ArrayList<String>> fixlistmap =  FixlistDAO.selectModelMap();

			request.setAttribute("fixlistmap", fixlistmap);
			request.setAttribute("inputDAY", inputDAY);
			request.setAttribute("inputTIMEnum", inputTIMEnum);
			request.setAttribute("inputADD", inputADD);
			request.setAttribute("sggNm", sggNm);
			request.setAttribute("eng", eng); 
			request.setAttribute("res", 1);
			
			
			
			} catch (Exception e) {
				request.setAttribute("res", 0);
				e.printStackTrace();
			}

	}

}
