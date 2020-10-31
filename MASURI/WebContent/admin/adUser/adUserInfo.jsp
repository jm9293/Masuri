<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.masuri.dto.UserDTO"%>	
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 내가 만든 추가로 필요한 css -->
<link rel="stylesheet" href="../mycss/mycss.css">
<!-- 페이징에 필요한 css -->
<link rel="stylesheet" href="../../user/support/sup_Notice.css?after">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="adUserInfo.css">
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
	
	<div class="container">	
	<%@ include file="../adNav.jsp"%>
	<div class="card container mymodal2">
	<form name="frm" action="adUserBlackChk.do"><br>
		<img class="card-img-top" src="../../userimg/<%=dto.getId() %>.jpg" alt="Card image"
			style="width: 100%">
		<div class="card-body">
			<div class="btn-group" id="myRbtn">
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
				<h4 class="card-title srctxt">ID : <%= dto.getId() %></h4>
				<p class="card-text srctxt">이름 : <%= dto.getName() %></p>
			
				<p class="card-text srctxt">Email : <%= dto.getEmail() %></p>
				<p class="card-text srctxt">H.P: <%= dto.getPhone() %></p>
				<a class="btn text-white bg-danger" id="myRbtn3" href="adUserEdit.do">닫기</a><br><br>
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
	</div>

<!-- 
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
	
	 -->
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>