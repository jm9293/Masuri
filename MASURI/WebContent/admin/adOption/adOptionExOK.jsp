<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int result = (int)request.getAttribute("result"); %>
    
<script>
    <%
    	if(result == 1){
    %>
    	alert("리스트에 추가되었습니다");
    	location.href="/MASURI/admin/adOption/adOptionEx.do";
    
    <%
    	} else {
    %>
    	alert("리스트에 추가되지 않았습니다.");
    	history.back();
    
    <%
    	}
    %>
</script>