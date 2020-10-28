<%@page import="com.masuri.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>MASURI MANAGER</title>
<%
	ArrayList<UserDTO> list = (ArrayList<UserDTO>)request.getAttribute("list");
	String text = (String)request.getAttribute("text");
	String textVal = text.trim();
	String selectMenu = ((String [])request.getAttribute("selectMenu"))[0];
	System.out.println(selectMenu);
	if(list.isEmpty()){
	%>
		<script>
			alert("검색내역이 없습니다.");
			location.href="adUserEdit.do";
		</script>
	<% return;}	
	
%>

</head>
<body class="cont">

<%@ include file="../adNav.jsp" %>
    
    <div class="container">
		<div class="col-3">
		    <form class="navbar-form" role="search" action="adUserSearch.do">
		    <div class="col-5">
    		
			<select class="selectpicker" name="selectMenu">
				<option value="id_sch" id="id_sch">ID검색</option>
				<option value="name_sch" id="name_sch">이름검색</option>
				<option value="num_sch" id="num_sch">휴대폰번호검색</option>
			</select>
			</div>
			<br>
			   	<div class="input-group">
			        <input type="text" class="form-control" placeholder="검색종류를 선택 후 검색하세요"
			         id="srch-term"  name="text" value="<%=textVal%>">
			        <div class="input-group-btn">
			            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	        		</div>
	      		</div>
		    </form>
		</div>
		
		<% 
			if(list != null && textVal != null){
				for(int i =0; i < list.size(); i++){			
		%>
		<div class="card l-8">
			<div class="card-header" style="background-color: #ddd" id="">ID: <%= list.get(i).getId() %></div>
			<div class="card-body" style="background-color: #eee">이름 : <%= list.get(i).getName() %></div>
			<div class="card-body minH">내용: <%= list.get(i).getPhone() %>
			<button type="button" class="btn btn-sm pull-right" 
					onclick="location.href='adUserInfo.do?uid=<%= list.get(i).getId() %>'"
						style="background-color: #aaa; color:#fff">프로필 보기</button>
			</div>
			<br>
		</div>
		<%				
				}
				
			}
		%>
	</div>
 <script>
 $(function(){
	 $("#<%=selectMenu%>").attr("selected","selected");
 });
 
 </script>
</body>
</html>