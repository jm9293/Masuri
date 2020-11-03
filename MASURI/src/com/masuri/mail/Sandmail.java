package com.masuri.mail;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Sandmail {

	public static boolean sand(String toadd, String subject , String content) {
		final String from = "masuri1019@gmail.com";
		String to = toadd; //받는사람
		
		// 입력값 받음
		 
		Properties p = new Properties(); // 정보를 담을 객체
		//구글 stmp 세팅
		p.put("mail.smtp.host","smtp.gmail.com"); 
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		// SMTP 서버에 접속하기 위한 정보들
		 
		try{
		    Authenticator auth = new SMTPAuthenticatior(); //계정정보 생성
		    Session ses = Session.getInstance(p, auth); // mail.session 객체생성
		     
		    ses.setDebug(true); // 디버그할건지 체크
		     
		    MimeMessage msg = new MimeMessage(ses); // 메일 메세지 객체 생성
		    msg.setSubject(subject); // 제목 삽입
		     
		    Address fromAddr = new InternetAddress(from); // 주소객체생성
		    msg.setFrom(fromAddr); // 보내는 사람 
		     
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		     
		    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩 html로보내는게 쌉가능
		     
		    Transport.send(msg); // 전송
		    return true;
		} catch(Exception e){
		    e.printStackTrace();
		    return false;
		}
		
	}

}
