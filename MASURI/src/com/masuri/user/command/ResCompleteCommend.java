package com.masuri.user.command;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.dao.EngineerDAO;
import com.masuri.dao.FixlistDAO;
import com.masuri.dao.ReslistDAO;
import com.masuri.dto.EngineerDTO;
import com.masuri.dto.ReslistDTO;

public class ResCompleteCommend implements Command {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	HashMap<String, String> failsitmap = new HashMap<String, String>();
	

	public ResCompleteCommend() {
		//맵초기화
		failsitmap.put("fail1", "스마트폰 침수");
		failsitmap.put("fail2", "액정 파손");
		failsitmap.put("fail3", "외관 파손");
		failsitmap.put("fail4", "비밀번호 분실");
		failsitmap.put("fail5", "전원 안켜짐");
		failsitmap.put("fail6", "배터리 방전(교체)");
		failsitmap.put("fail7", "진동 안됨");
		failsitmap.put("fail8", "전화, 무선데이터 연결 불가");
		failsitmap.put("fail9", "기타 오작동, 해당항목 없음");
	}


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
		
		int res =0;
		String inputDAY = request.getParameter("inputDAY");
		int inputTIMEnum = Integer.parseInt(request.getParameter("inputTIMEnum"));
		String inputADD = request.getParameter("inputADD");
		String sggNm = request.getParameter("sggNm");
		String engid = request.getParameter("engid");
		String inputFactory = request.getParameter("inputFactory");
		String inputModel = request.getParameter("inputModel");
		String inputFailsit  = request.getParameter("inputFailsit");
		String userid = (String)request.getSession().getAttribute("login");
		String inputfailmsg = request.getParameter("failmsg");
			
		EngineerDTO eng = EngineerDAO.select(engid);
		HashMap<String, ArrayList<String>> fixlistmap = FixlistDAO.selectModelMap();
			
		boolean daychk = inputDAY!=null && (sdf.parse(inputDAY).after(new Date()));
		boolean timenumchk = (inputTIMEnum >0 && inputTIMEnum < 4);
		boolean addchk = (inputADD.contains("서울특별시")||inputADD.contains("센터"))&&inputADD.contains(sggNm);
		boolean sggNmchk = sggNm!=null;
		boolean engchk = eng!=null;
		boolean factorychk = inputFactory!=null&&fixlistmap.containsKey(inputFactory);
		boolean modelchk = inputModel!=null&&fixlistmap.get(inputFactory).contains(inputModel);
		boolean faillistchk = inputFailsit!=null&&failsitmap.containsKey(inputFailsit);
		
		if(inputADD.equals("센터")) { //신청서 타입0
			request.setAttribute("type", 2);
		}else {
			request.setAttribute("type", 1);
		}
	
		
		if(!(daychk&&timenumchk&&addchk&&sggNmchk&&engchk&&factorychk&&modelchk&&faillistchk)) { // 파라미터 비정상
			request.setAttribute("res", 0);
			return;
		}    
		
		Date time = sdf.parse(inputDAY);
		
		switch (inputTIMEnum) {
		case 1:
			time.setHours(9);
			break;
		case 2:
			time.setHours(13);
			break;
		case 3:
			time.setHours(16);
			break;
		}
		
		
		
		engchk = EngineerDAO.resSelectByid(new java.sql.Date(sdf.parse(inputDAY).getTime()),
				inputTIMEnum, sggNm, engid); // 한번더 해당기사가 예약가능한지 여부 확인
		
		if(!engchk) {
			request.setAttribute("res", 2); // 해당기사와 예약 문제 발생
			return;
		}
		
		ReslistDTO reslist = new ReslistDTO();
		
		reslist.setAddress(inputADD);
		reslist.setEngid(engid);
		reslist.setFactory(inputFactory);
		reslist.setFailmsg(inputfailmsg);
		reslist.setFailsit(failsitmap.get(inputFailsit));
		reslist.setModel(inputModel);
		reslist.setTime(new Timestamp(time.getTime()));
		reslist.setUserid(userid);
		
		int updateNum = ReslistDAO.insert(reslist);
		
		if(updateNum!=1) {
			request.setAttribute("res", 2); // 해당기사와 예약 문제 발생
			return;
		}
		
		
		request.setAttribute("res", 1);// 성공
		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("res", 0);
		}

	}

}
