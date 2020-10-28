package com.masuri.user.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.masuri.command.Command;
import com.masuri.file.Fileupload;



public class UserUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		Fileupload.proflieImgupload(request,"file1", "userimg");
		

	}

}
