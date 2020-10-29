<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% int res = (int)request.getAttribute("res"); %>
<% if(res==0){ %>
	<script>
	    alert('정보변경실패!\n 다시시도해주세요');
	    history.back();
    </script>
<%}else{ %>
	<script>
	    alert('정보변경완료!');
	    location.href='/MASURI/user/basic/updateuser.do';
    </script>

<%}%>