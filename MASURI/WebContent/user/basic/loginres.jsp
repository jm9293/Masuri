<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
int check = (int)request.getAttribute("logincheck");

pageContext.setAttribute("check", check);

%> 



<c:choose>
	<c:when test="${check==0}">
	<script>
	location.href='/MASURI';
	</script>
	</c:when>
	<c:when test="${check==1}">
	<script>
	alert('로그인실패\n아이디와 비밀번로를 다시입력해주세요.')
	history.back();
	</script>
	</c:when>
	<c:when test="${check==2}">
	<script>
	alert('이미로그인중!')
	location.href='/MASURI';
	</script>
	</c:when>
	<c:when test="${check==3}">
	<script>
	alert('세션만료!\n 다시로그인해주세요.')
	history.back();
	</script>
	</c:when>
	<c:when test="${check==4}">
	<script>
	alert('다른곳에서 로그인중입니다.!\n강제로그아웃하고 로그인합니다. 비밀번호를 변경해주세요.')
	location.href='/MASURI';
	</script>
	</c:when>
</c:choose>
