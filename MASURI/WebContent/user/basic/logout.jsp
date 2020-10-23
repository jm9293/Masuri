<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
boolean check = (boolean)request.getAttribute("logoutres");

pageContext.setAttribute("check", check);

%>



<c:choose>
	<c:when test="${check==true}">
	<script>
	alert('로그아웃 되었습니다.')
	location.href='/MASURI';
	</script>
	</c:when>
	<c:when test="${check==false}">
	<script>
	alert('로그아웃 실패')
	history.back();
	</script>
	</c:when>
	
</c:choose>