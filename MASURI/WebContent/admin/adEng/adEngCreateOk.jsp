<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int cnt = (Integer)request.getAttribute("result");
	String uid = request.getParameter("id");
%>


<% if(cnt == 0){ %>
	<script>
		alert("계정 생성 실패 !!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("계정 생성 성공, 생성된 기사정보 페이지로 이동합니다.");
		location.href = "/MASURI/admin/adEng/adEngInfo.do?uid=<%= uid%>";
	</script>
<% } %>