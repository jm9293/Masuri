<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int result = (int)request.getAttribute("result"); %>
<% String state = (String)request.getAttribute("state");
int num = Integer.parseInt(request.getParameter("uid"));


%>
<script>
	<%
		if(result == 1) {
	%>		
			location.href="/MASURI/admin/adOption/adOptionView.do?page=1&uid=<%=num%>";
	<%
		} else {
	%>		
			alert("상태전환 실패");
			location.href="/MASURI/admin/adOption/adOptionView.do?page=1&uid=<%=num%>";
	<%
		}
	%>
	
</script>