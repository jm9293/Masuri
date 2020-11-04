
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
<c:choose>
		<c:when test="${chk==1}">
			<script type="text/javascript">location.href='login'
			alert("세션만료")</script>
		</c:when>
		</c:choose>
		
		
<c:choose>
		<c:when test="${chk!=1}">
			<script type="text/javascript">location.href='scheduleregister.schedule'</script>
		</c:when>
	</c:choose>
		
		<c:choose>
		<c:when test="${reselect==1}">
			<script type="text/javascript">alert("재신청해주세요")location.href='scheduleregister.schedule'</script>
		</c:when>
		</c:choose>
		
	
</body>
</html>