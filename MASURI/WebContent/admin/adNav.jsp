<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.masuri.admin.command.AdLoginCommand"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String adminID = (String)request.getSession().getAttribute("login");

boolean logincheck = AdLoginCommand.admin.containsKey(adminID);

if(adminID!=null&&!logincheck){
	try{
		session.invalidate();
	}catch(Exception e){
		
	}
}	

if(!logincheck){
%>
 <script type="text/javascript">
 alert("로그인해야 접속할수 있습니다.");
 location.href='../adLogin.jsp';
</script>
<% return;}
%>
	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" 
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="../adEng/adEngEdit.do">Masuri Editor Page</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../adEng/adEngEdit.do">직원관리</a></li>
				<li><a href="../adUser/adUserEdit.do">유저관리</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">공지사항</a>
						<ul class="dropdown-menu">
							<li><a href="../adNotice/adNotice.do">공지사항</a></li>
							<li><a href="../adNotice/adminFaq.do">FaQ</a></li>				
							<li><a href="../adNotice/adQnaList.do">QnA</a></li>				                                  
						</ul>
					</li>
				<li><a href="../adOption/adOption.do" >설정관리</a>
					
				</li>
			</ul>
			
		</div>
	</nav>


