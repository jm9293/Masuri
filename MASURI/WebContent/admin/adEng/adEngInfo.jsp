<%@page import="com.masuri.dto.EngineerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="adEngInfo.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<%
	EngineerDTO dto = (EngineerDTO) request.getAttribute("uid");
%>
<title>MASURI MANAGER</title>
</head>
<body class="cont">
	<%
		String ID = null;
		if(session.getAttribute("ID") != null){
			ID = (String)session.getAttribute("ID");
		}
	%>

	<%@ include file="../adNav.jsp"%>

	<div class="card container bg-warning" style="width: 400px; height: 600px; border: 1px solid white">
	<form name="frm" action="adEngStatusChk.do">
		<img class="card-img-top" src="../img/avatar2.png" alt="Card image"
			style="width: 100%">
		<div class="card-body">
			<div class="btn-group pull-right">
				<%
					if(!dto.getState()){
				%>
					<button type="submit" class="btn btn-sm" id="normal" onclick="adEngStatusChk.do">계정비활성화 지정</button>
				<%		
					}else{
				%>
					<button type="submit" class="btn btn-sm" id="black" onclick="adEngStatusChk.do">계정비활성화 해제</button>
				<%		
					}
				%>
				
			</div>
			<div>
				<h4 class="card-title ">ID : <%= dto.getId() %></h4>
				<p class="card-text ">이름 : <%= dto.getName() %></p>
			
				<p class="card-text ">Email : <%= dto.getEmail() %></p>
				<p class="card-text ">H.P: <%= dto.getPhone() %></p>
				<p class="card-text ">기사 소개: <%= dto.getIntro() %></p>
				<p class="card-text ">담당 지역: <%= dto.getArea() %></p>
				<a class="btn text-white bg-danger pull-right " href="adEngEdit.do">닫기</a>
			</div>
		</div>
		<input type="hidden" name="uid" value="<%= dto.getId() %>"/>
		<input type="hidden" name="password" value="<%= dto.getPassword() %>"/>
		<input type="hidden" name="name" value="<%= dto.getName()%>"/>
		<input type="hidden" name="phone" value="<%= dto.getPhone()%>"/>
		<input type="hidden" name="chk" value="<%= dto.getState()%>"/>
		<input type="hidden" name="area" value="<%= dto.getArea()%>"/>
		<input type="hidden" name="intro" value="<%= dto.getIntro()%>"/>
		<input type="hidden" name="email" value="<%= dto.getEmail()%>"/>
		</form>
	</div>
</body>
</html>