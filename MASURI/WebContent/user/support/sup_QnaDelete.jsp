<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:choose>
	<c:when test="${result == 0}">
	<script>
		alert("삭제실패 !!!");
		history.back();
		return;
	</script>
	</c:when>
	<c:otherwise>
	<script>
		alert("삭제 성공! 맨처음 목록으로 이동합니다.");
		location.href = "/MASURI/user/support/sup_Qna.do?page=1";
	</script>
	</c:otherwise>
</c:choose>


    