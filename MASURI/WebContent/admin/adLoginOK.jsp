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
		location.href='adEng/adEngEdit.do';
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
		alert('로그인실패\n이미 로그인 되어있습니다.')
		history.back();
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
		alert('다른곳에서 로그인중입니다.!\n강제로그아웃하고 로그인합니다.')
		location.href='adEng/adEngEdit.do';
		</script>
	</c:when>
</c:choose>