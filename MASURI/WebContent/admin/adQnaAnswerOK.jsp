<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int result = (int)request.getAttribute("result"); %>
<script>
<% if(result == 1){
%>	
	alert("답변 완료 되었습니다.");
	location.href="/MASURI/admin/adQnaView.do?page=<%=request.getParameter("page") %>&uid=<%=request.getParameter("uid") %>";
<%
	} else if(result == 0){
%>
	alert("작성이 완료되지 않았습니다.");
	history.back();
<%
	}
%>


</script>

