<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.masuri.dto.UserDTO"%>	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="adUserInfo.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<%
	UserDTO dto = (UserDTO) request.getAttribute("uid");
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
	<form name="frm" action="adUserBlackChk.do">
		<img class="card-img-top" src="../../userimg/<%=dto.getId() %>.jpg" alt="Card image"
			style="width: 100%">
		<div class="card-body">
			<div class="btn-group pull-right">
				<%
					if(!dto.getBlack()){
				%>
					<button type="submit" class="btn btn-sm" id="normal" onclick="adUserBlackChk.do">블랙리스트 지정</button>
				<%		
					}else{
				%>
					<button type="submit" class="btn btn-sm" id="black" onclick="adUserBlackChk.do">블랙리스트 해제</button>
				<%		
					}
				%>
				
			</div>
			<div>
				<h4 class="card-title ">ID : <%= dto.getId() %></h4>
				<p class="card-text ">이름 : <%= dto.getName() %></p>
			
				<p class="card-text ">Email : <%= dto.getEmail() %></p>
				<p class="card-text ">H.P: <%= dto.getPhone() %></p>
				<a class="btn text-white bg-danger pull-right " href="adUserEdit.do">닫기</a>
			</div>
		</div>
		<input type="hidden" name="uid" value="<%= dto.getId() %>"/>
		<input type="hidden" name="password" value="<%= dto.getPassword() %>"/>
		<input type="hidden" name="name" value="<%= dto.getName()%>"/>
		<input type="hidden" name="phone" value="<%= dto.getPhone()%>"/>
		<input type="hidden" name="chk" value="<%= dto.getBlack()%>"/>
		<input type="hidden" name="email" value="<%= dto.getEmail()%>"/>
		</form>
	</div>
</body>
</html>