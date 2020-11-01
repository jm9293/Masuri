package com.masuri.user.command;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.masuri.command.Command;
import com.masuri.dao.FaqDAO;
import com.masuri.dto.FaqDTO;

public class FaqCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;

		ArrayList<FaqDTO> list = null;
		if (list == null) {

			try {
				list = FaqDAO.select();
				if (list != null) {
					result = 1;
					request.setAttribute("list", list);
					request.setAttribute("result", result);
				}

			} catch (Exception e) {
				request.setAttribute("result", result);

			}
		}

	}

}
