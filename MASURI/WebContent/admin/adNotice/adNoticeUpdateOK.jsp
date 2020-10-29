<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int result = (int)request.getAttribute("result"); %>
<script>
<% if(result == 1){
%>	
	alert("수정 완료 되었습니다.");
	location.href="/MASURI/admin/adNotice/adNotice.do";
<%
	} else if(result == 0){
%>
	alert("수정되지 않았습니다.");
	history.back();
<%
	}
%>


</script>