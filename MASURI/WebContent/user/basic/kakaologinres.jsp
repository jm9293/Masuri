<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
int res = (int)request.getAttribute("res");

pageContext.setAttribute("check", res);

%> 



<c:choose>
	<c:when test="${check==1}">
	<script>
	location.href='/MASURI';
	</script>
	</c:when>
	<c:when test="${check==0}">
	<script>
	alert('카카오 로그인중 문제가생겼습니다/n다시시도해주세요.')
	history.back();
	</script>
	</c:when>
	<c:when test="${check==2}">
	<script>
	alert('카카오 로그인으로 회원가입되었습니다.\n감사합니다.')
	location.href='/MASURI';
	</script>
	</c:when>
</c:choose>
