<%@page import="com.masuri.dto.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:choose>
	<c:when test="${result == 0 }">
	<script>
		location.href="../ErrorPage.do";
	</script>
	</c:when>
	<c:when test="${result2 == 0 }">
	<script>
			alert("등록실패 !!!");
			history.back();
	</script>
	</c:when>
	<c:otherwise>
	<script>
		alert("등록 성공, 작성한 글을 출력합니다.");
		location.href = "/MASURI/user/support/sup_QnaView.do?page=${page}&uid=${result2}";
	</script>
	</c:otherwise>
</c:choose>
