<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.masuri.admin.command.AdLoginCommand"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String adminID = (String)request.getSession().getAttribute("adlogin");

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
 location.href='../adLogin.do';
</script>
<% return;}
%>

<nav class="navbar navbar-expand-sm c-dg navbar-dark "> 
	<!-- 제목 --> 
	<a class="fo navbar-brand" href="../adEng/adEngEdit.do">Masuri Editor Page</a>
	<!-- Toggler/collapsibe Button --> 
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"> 
		<span class="navbar-toggler-icon"></span> 
	</button> 
	<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar"> 
		<!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 --> 
		<ul class="navbar-nav navbar-dark"> 
			<li class="nav-item active"> 
				<a class="nav-link text-muted" href="../adEng/adEngEdit.do">직원관리</a>
			</li> 
			<li class="nav-item"> 
				<a class="nav-link text-muted" href="../adUser/adUserEdit.do">유저관리</a>
			</li> 
			<li class="nav-item dropdown"> 
				<!-- 드롭다운 메뉴--> 
				<a class="nav-link dropdown-toggle text-muted"	data-toggle="dropdown" role="button" href="#">고객센터</a>
				<div class="dropdown-menu"> 
					<a class="dropdown-item" href="../adNotice/adNotice.do">공지사항</a>
					<a class="dropdown-item" href="../adNotice/adminFaq.do">FaQ</a>				
					<a class="dropdown-item " href="../adNotice/adQnaList.do">QnA</a>	
				</div> 
			</li> 
			<li class="nav-item justify-content-end">
				<a class="nav-link text-muted" href="../adOption/adOption.do?page=1" >설정관리</a>
			</li>	
		</ul> 
		 
	</div> 
</nav><br><br><br>

