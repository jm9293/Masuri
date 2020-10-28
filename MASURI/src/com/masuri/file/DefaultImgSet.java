package com.masuri.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

public class DefaultImgSet {
	
	
	public static boolean imgSet(HttpServletRequest request, String filepath , String userID) {
		
		String fileDirectory = request.getRealPath(filepath+"/"+userID+".jpg");
		String directory= request.getRealPath(filepath);
		
		File defaultimg = new File(directory+"/defaultimg.jpg");
		
		File newimg = new File(fileDirectory);
		
		
		FileInputStream fio =null;
		
		FileOutputStream foo =null;
		
	    try {
	    	fio = new FileInputStream(defaultimg);
	    	foo = new FileOutputStream(newimg);
	    	
	    	while(fio.available()!=0) {
	    		foo.write(fio.read());
	    	}
	    	
	    	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fio.close();
				foo.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
		return false;
	}
	 

}
