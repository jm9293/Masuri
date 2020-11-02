package com.masuri.util;

import java.util.ArrayList;
import java.util.Random;

public class BufPassword {
	
	
	ArrayList<Character> chararr = new ArrayList<Character>();
	
	
	
	
	
	public BufPassword() {
		for (int i = 48; i < 58; i++) {
			chararr.add((char)i);
		}
		for (int i = 65; i < 91; i++) {
			chararr.add((char)i);
		}
		for (int i = 97; i < 123; i++) {
			chararr.add((char)i);
		}
	}


	public String getBufPassword() {
		StringBuffer bufPassword = new StringBuffer();
		Random random = new Random();
		
		for (int i = 0; i < 8; i++) {
			bufPassword.append(chararr.get(random.nextInt(63)));
		}
		
		return bufPassword.toString();
	}
	
	
}
