package com.masuri.engineer.command;

import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.dao.EngineerDAO;
import com.masuri.dto.EngineerDTO;
import com.masuri.engineer.command.Command;
import com.masuri.file.Fileupload;
import com.oreilly.servlet.MultipartRequest;

public class InfoAfterEngineer implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = "";
		
		try {
			
			response.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			id = (String)session.getAttribute("enlogin");
			
			if(id!=null && !id.equals("")) {
			
			
				EngineerDTO dto = EngineerDAO.select(id);
				MultipartRequest multi = Fileupload.proflieImgupload(request, "imgUp", "enimg", id);
				String pw = multi.getParameter("pwKey");
				String local = multi.getParameter("local");
				String intro = multi.getParameter("intro");
				
				
				
				if(pw!=null&&!pw.equals("")) {
					if(Pattern.matches("(?=.*[A-Za-z])(?=.*\\d)(?=.*[0-9])[A-Za-z0-9]{6,8}",pw)) {
						dto.setPassword(pw);
					}
				}else {
					dto.setPassword(dto.getPassword());
				}
	
				
				if(local!=null&&!local.equals("")) {
					dto.setArea(local);
					
				}
	
				
				if(intro!=null&&!intro.equals("")) {
					if(Pattern.matches("^[가-힣ㅏ-ㅣㄱ-ㅎa-zA-Z0-9]{0,100}", intro)) {
						
						dto.setIntro(intro);
					}
					
				}
				
				EngineerDAO.update(dto);
				
				System.out.println(pw+"local"+local+"/intro "+intro);

			
			}else {
				request.setAttribute("chk", 1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
