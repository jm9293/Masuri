package com.masuri.user.command;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.dao.QnaDAO;
import com.masuri.dto.QnaDTO;

public class QnaSearchTextCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<QnaDTO> list = null;
		ArrayList<QnaDTO> list2 = new ArrayList<QnaDTO>();
		int result = 0;
		String search = "";
		try {
			
			String select = request.getParameterValues("selectMenu")[0].trim();
			
			String text = request.getParameter("text").trim();
			String page2 = request.getParameter("page").trim();
			String regExp = "^[0-9]+$";
			
			switch (select) {
			case "id_sch":
				search = "userid";
				break;

			case "name_sch":
				search = "title";
				break;
			}
			
			if (page2.matches(regExp)) {
				int page = Integer.parseInt(request.getParameter("page"));
				int max = QnaDAO.getMaxPageSerach(text, search);

				if (page < 1) {
					page = 1;
				} else if (page > max) {
					page = max;
				}
				list = QnaDAO.selectpageSearch(page, text, search);
				result = 1;
				System.out.println(select);
				for (int i = 0; i < list.size(); i++) {
					if(select.equals("id_sch") && (list.get(i).getUserid().equals(text) || list.get(i).getUserid().contains(text))) {
						list2.add(list.get(i));
					}else if(select.equals("name_sch") && (list.get(i).getTitle().equals(text) || list.get(i).getTitle().contains(text))) {
						list2.add(list.get(i));
					}
				}
				
				list = list2;
				request.setAttribute("max", max);
				request.setAttribute("result", result);
				request.setAttribute("list", list);
				request.setAttribute("page", page);
				
				
				
			}else {
				request.setAttribute("result", result);
			}
		} catch (Exception e) {
			request.setAttribute("result", result);
		}
	}

}
