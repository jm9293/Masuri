<%@page import="com.masuri.dto.EngineerDTO"%>
<%@page import="com.masuri.dao.EngineerDAO"%>
<%@page import="sun.nio.ch.SelChImpl"%>
<%@page import="com.masuri.dto.NoticeDTO"%>
<%@page import="com.masuri.dao.NoticeDAO"%>
<%@page import="com.masuri.dao.FaqDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.masuri.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.masuri.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>


<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
<body>

<% 


EngineerDAO.select();
EngineerDTO eng =  EngineerDAO.select("ID 03");
eng.setIntro("소개지롱");
EngineerDAO.update(eng);



  


%>
</body>
</html>
