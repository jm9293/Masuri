<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% //Controller 로 부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
	int uid = 0;
	int pageNum = 0;
	if(cnt == 0){ 
%>
	<script>
		alert("수정 실패 !!!");
		history.back();
	</script>
<% } else { 
	uid = (int)request.getAttribute("uid");
	pageNum = (int)request.getAttribute("page");
%>
	<script>
		alert("수정 성공");
		location.href = "/MASURI/user/support/sup_QnaView.do?page=<%= pageNum%>&uid=<%= uid%>";
	</script>
<% } %>