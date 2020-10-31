<%@page import="com.masuri.dto.EngineerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
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

	<div class="container">
	<%@ include file="../adNav.jsp"%>
	<div class="card container mymodal"><br>
	<form name="frm" action="adEngStatusChk.do">
		<img class="card-img-top" src="../../engimg/<%=dto.getId() %>.jpg" alt="Card image"
			style="width: 100%">
		<div class="card-body">
			<div class="btn-group" id="myRbtn2">
				<%
					if(!dto.getState()){
				%>
					<button type="submit" class="btn btn-sm" id="normal" onclick="adEngStatusChk.do">비활성화</button>
				<%		
					}else{
				%>
					<button type="submit" class="btn btn-sm" id="black" onclick="adEngStatusChk.do">활성화</button>
				<%		
					}
				%>
				
			</div>
			<div>
				<p><b class="card-title srctxt">ID : <%= dto.getId() %></b></p>
				<p class="card-text srctxt">이름 : <%= dto.getName() %></p>
			
				<p class="card-text srctxt">Email : <%= dto.getEmail() %></p>
				<p class="card-text srctxt">H.P: <%= dto.getPhone() %></p>
				<p class="card-text srctxt">기사 소개: <%= dto.getIntro() %></p>
				<p class="card-text srctxt">담당 지역: <%= dto.getArea() %></p>
				<a class="btn text-white bg-danger" id="myRbtn3" href="adEngEdit.do">닫기</a><br><br>
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
	</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>


