<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int cnt = (Integer)request.getAttribute("result");
%>


<% if(cnt == 0){ %>
	<script>
		alert("등록실패 !!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("등록 성공, 리스트를 출력합니다");
		location.href = "/MASURI/user/support/sup_Qna.do?page=1";
	</script>
<% } %>