<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.Date"%>
<%@page import="com.masuri.dto.MonthscheduleDTO"%>
<%@page import="com.masuri.dao.MonthscheduleDAO"%>
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

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

EngineerDAO.resSelect(new Date(sdf.parse("2020-11-02").getTime()), 1, "중랑구");


  


%>
</body>
</html>
