<%@page import="com.masuri.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- 내가 만든 추가로 필요한 css -->
<link rel="stylesheet" href="../mycss/mycss.css">
<link rel="stylesheet" href="myuser.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<%
	ArrayList<UserDTO> list = (ArrayList<UserDTO>)request.getAttribute("list");
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
	<%@ include file="../adNav.jsp" %>
    	<h2 style="color:#999"><b>유저 관리 페이지</b></h2><br>
    	<div class="col-5 nopad">
		    <form class="navbar-form" role="search" action="adUserSearch.do">
		    <div class="col-5 nopad">
    		
			<select class="selectpicker" name="selectMenu">
				<option value="id_sch">ID검색</option>
				<option value="name_sch">이름검색</option>
				<option value="num_sch">휴대폰번호검색</option>
			</select>
			</div>
			<br>
			   	<div class="input-group">
			        <input type="text" class="form-control srctxt" placeholder="검색종류를 선택 후 검색하세요"
			         id="srch-term"  name="text">
			        <div class="input-group-btn">
			            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	        		</div>
	      		</div>
		    </form>
		</div><br><br>
		<%
			if(list != null){
				for(int i = 0; i < list.size(); i++){
		%>
		<div class="card mycard">
			<div class="card-header my-ch">ID: <%= list.get(i).getId() %></div>
			<div class="card-body my-cb" >이름 : <%= list.get(i).getName() %></div>
			<div class="card-body my-cf">내용: <%= list.get(i).getPhone() %>
			<button type="button" class="btn btn-sm" 
					onclick="location.href='adUserInfo.do?uid=<%= list.get(i).getId() %>'"
						id="myRbtn2">프로필 보기</button>
			</div>
			<br>
		</div>
		<%			
				}
			}
		%>
	</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>




















