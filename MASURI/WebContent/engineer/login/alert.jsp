<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int chk = (Integer)request.getAttribute("chk");

%>


<c:choose>
<c:when test="${chk==0}">
	<script>
	location.href='main.do';
	</script>
	</c:when>
	</c:choose>
	<c:choose>
	<c:when test="${chk==1}">
	<script>
	alert('로그인 실패')
	location.href= 'login';
	</script>
	</c:when>
</c:choose>

	<c:choose>
	<c:when test="${chk==3}">
	<script>
	alert('비활성화된 계정입니다.\n관리자에게 문의하세요')
	location.href= 'login';
	</script>
	</c:when>
</c:choose>

</body>
</html>