<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	//Controller 로 부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
%>

<% if(cnt == 0){ %>
	<script>
		alert("삭제실패 !!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("삭제 성공");
		location.href = "/MASURI/user/support/sup_Qna.do?page=1";
	</script>
<% } %>

    