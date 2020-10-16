<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="com.masuri.mail.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

 
final String from = "masuri1019@gmail.com";
String to = "masuri1019@gmail.com"; //받는사람
String subject = "ㅎㅇㅎㅇㅎㅇ"; //제목
String content = "<h1>렛츠고<h1>"; //내용
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
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('메일전송 실패!');</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}
 
out.println("<script>alert('메일전송 성공!');</script>");
// 성공 시
%>


