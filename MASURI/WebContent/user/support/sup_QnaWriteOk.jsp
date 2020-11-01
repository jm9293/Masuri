<%@page import="com.masuri.dto.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	int result = (int)request.getAttribute("result2");
	int cnt = (int)request.getAttribute("result");
	int pageNum = 0;
	
	if(cnt == 0){
%>
	<script>
		loaction.href="../ErrorPage.do";
	</script>
<%	return;	
	}else if(result == 0){
%>
		<script>
			alert("등록실패 !!!");
			history.back();
		</script>
<%	return;			
	}else{
	pageNum = (int)request.getAttribute("page");
%>	
	<script>
		alert("등록 성공, 작성한 글을 출력합니다.");
		location.href = "/MASURI/user/support/sup_QnaView.do?page=<%= pageNum%>&uid=<%= result%>";
	</script>
<%
	} %>