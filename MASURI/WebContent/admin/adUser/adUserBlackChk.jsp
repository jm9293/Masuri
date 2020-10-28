<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int cnt = (Integer)request.getAttribute("result");
	String uid = request.getParameter("uid");
%>


<% if(cnt == 0){ %>
	<script>
		alert("등록실패 !!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("변경 성공, 바뀐 고객정보를 출력합니다");
		location.href = "/MASURI/admin/adUser/adUserInfo.do?uid=<%= uid%>";
	</script>
<% } %>