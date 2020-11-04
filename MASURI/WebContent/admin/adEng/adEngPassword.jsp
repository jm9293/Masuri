<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int res = (int)request.getAttribute("res");
	String id = request.getParameter("uid");
	if(res == 0){
%>
	<script>
		alert("임시비밀번호 발급 실패!!!");
		location.href="../../user/ErrorPage.do";
	</script>
<%	return;	
	}else{
%>
	<script>
		alert("임시비밀번호 발급 성공!!!");
		location.href = "/MASURI/admin/adEng/adEngInfo.do?uid=<%=id%>";
	</script>
<%
	}
%>