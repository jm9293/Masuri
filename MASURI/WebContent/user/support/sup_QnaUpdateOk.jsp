<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("수정 실패 !!!");
			history.back();
			return;
		</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("수정 성공, 수정된 글을 출력합니다.");
		location.href = "/MASURI/user/support/sup_QnaView.do?page=${page}&uid=${uid}";
		</script>
	</c:otherwise>
</c:choose>
