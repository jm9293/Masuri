package com.masuri.file;

import java.io.File;


import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class Fileupload {

	
	public static boolean proflieImgupload(HttpServletRequest request,String inputname,String filepath) {
		boolean res = false;
		String saveDirectory = request.getRealPath(filepath);
		System.out.println(saveDirectory);
	    String encoding = "utf-8"; 
		int maxSize = 10*1024*1024; 
		MultipartRequest multi =null;
		try {
			multi = new MultipartRequest(request, saveDirectory, maxSize, encoding);
			String fileName = multi.getFilesystemName(inputname); 
			System.out.println(fileName);
			
			String type = multi.getContentType(inputname); 
			File f = multi.getFile(inputname);
			System.out.println(type);
			File userimg = new File(saveDirectory+"/"+request.getSession().getAttribute("login")+".jpg");
			
			if(type.equals("image/jpeg")) {
				if(userimg.exists()) {
					userimg.delete();
				}
				
				f.renameTo(userimg);	
				res = true;
			}else {
				f.delete();
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			res = false;
		}
		
		return res;
	}
}
