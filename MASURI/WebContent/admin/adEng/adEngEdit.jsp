<%@page import="com.masuri.dto.EngineerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>MASURI MANAGER</title>
<%
	ArrayList<EngineerDTO> list = (ArrayList<EngineerDTO>)request.getAttribute("list");
%>
</head>
<body class="cont"> 
	<%
		String ID = null;
		if(session.getAttribute("ID") != null){
			ID = (String)session.getAttribute("ID");
		}
	%>
	
	<%@ include file="../adNav.jsp" %>
    

    <div class="container">
    <div class="col-3">
		    <form class="navbar-form" role="search" action="adEngSearch.do">
		    <div class="col-5">
			<select class="selectpicker" name="selectMenu">
				<option value="id_sch">ID검색</option>
				<option value="name_sch">이름검색</option>
				<option value="num_sch">휴대폰번호검색</option>
			</select>
			<a href="adEngCreate.do" class="btn btn-sm pull-right" style="background-color: #9da">계정 만들기</a>
			</div>
			<br>
			   	<div class="input-group">
			        <input type="text" class="form-control" placeholder="검색종류를 선택 후 검색하세요"
			         id="srch-term"  name="text">
			        <div class="input-group-btn">
			            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	        		</div>
	      		</div>
		    </form>
		</div>
		<%
			if(list != null){
				for(int i = 0; i < list.size(); i++){
		%>
		<div class="card l-8">
			<div class="card-header" style="background-color: #ddd" id="">ID: <%= list.get(i).getId() %></div>
			<div class="card-body" style="background-color: #eee">이름 : <%= list.get(i).getName() %></div>
			<div class="card-body minH">휴대폰 번호: <%= list.get(i).getPhone() %>
			<button type="button" class="btn btn-sm pull-right" 
					onclick="location.href='adEngInfo.do?uid=<%= list.get(i).getId() %>'"
						style="background-color: #aaa; color:#fff">프로필 보기</button>
			</div>
			<br>
		</div>
		<%			
				}
			}
		%>
	</div>
</body>
</html>




















