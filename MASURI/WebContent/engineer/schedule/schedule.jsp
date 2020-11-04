
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
			</script>
		</c:when>
		</c:choose>
		
		<c:choose>
		<c:when test="${chk!=1}">
			<script type="text/javascript">location.href='register.do'
				</script>
		</c:when>
		</c:choose>

		
		<c:choose>
		<c:when test="${retry==2}">
			<script type="text/javascript">alert("재신청해주세요")location.href='register.do'</script>
		</c:when>
		</c:choose>
		
	
</body>
</html>