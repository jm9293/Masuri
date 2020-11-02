<%@page import="java.io.File"%>
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
		alert("계정 생성 성공, 기사 리스트로 이동합니다.");
		location.href = "/MASURI/admin/adEng/adEngEdit.do";
	</script>
<% } %>