<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>관리자 게시판</title>
</head>
<body class="cont"> 
	<%
		String ID = null;
		if(session.getAttribute("ID") != null){
			ID = (String)session.getAttribute("ID");
		}
	%>
	
	<%@ include file="adNav.jsp" %>
    

    <div class="container">
    	<div class="col-3">
		    <form class="navbar-form" role="search">
			   	<div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
			        <div class="input-group-btn">
			            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	        		</div>
	      		</div>
	    
		    </form>
	    
		</div>
		
		<div class="card l-8">
			<div class="card-header" style="background-color: #cdd">ID</div>
			<div class="card-body bg-info">이름</div>
			<div class="card-body minH">내용<a class="btn btn-sm pull-right" style="background-color: #bcd"
					 data-toggle="modal" data-target="#modalframe">프로필 보기</a></div>
			<br>
		</div>
		<div class="card l-8">
			<div class="card-header" style="background-color: #cdd">ID</div>
			<div class="card-body bg-info">이름</div>
			<div class="card-body minH">내용<a class="btn btn-sm pull-right" style="background-color: #bcd"
					 data-toggle="modal" data-target="#modalframe">프로필 보기</a></div>
			<br>
		</div>
		<div class="card l-8">
			<div class="card-header" style="background-color: #cdd">ID</div>
			<div class="card-body bg-info">이름</div>
			<div class="card-body minH">내용<a class="btn btn-sm pull-right" style="background-color: #bcd"
					 data-toggle="modal" data-target="#modalframe">프로필 보기</a></div>
			<br>
		</div>
		<div class="card l-8">
			<div class="card-header" style="background-color: #cdd">ID</div>
			<div class="card-body bg-info">이름</div>
			<div class="card-body minH">내용<a class="btn btn-sm pull-right" style="background-color: #bcd"
					 data-toggle="modal" data-target="#modalframe">프로필 보기</a></div>
			<br>
		</div>
		<div class="card l-8">
			<div class="card-header" style="background-color: #cdd">ID</div>
			<div class="card-body bg-info">이름</div>
			<div class="card-body minH">내용<a class="btn btn-sm pull-right" style="background-color: #bcd"
					 data-toggle="modal" data-target="#modalframe">프로필 보기</a></div>
			<br>
		</div>
		<div class="card l-8">
			<div class="card-header" style="background-color: #cdd">ID</div>
			<div class="card-body bg-info">이름</div>
			<div class="card-body minH">내용<a class="btn btn-sm pull-right" style="background-color: #bcd"
					 data-toggle="modal" data-target="#modalframe">프로필 보기</a></div>
			<br>
		</div>
		
	<a href="adWrite.jsp" class="btn btn-sm pull-right" style="background-color: #9da"
		data-toggle="modal" data-target="#createuser">계정 만들기</a>
	</div>
	
	
	<div class="modal fade card container bg-warning" id="modalframe" style="width:400px; height:600px; 
			border: 1px solid white">
	    <img class="card-img-top" src="img/avatar2.png" alt="Card image" style="width:100%">
	    <div class="card-body">
	    	<h4 class="card-title ">ID : </h4>
	      	<p class="card-text ">이름 : </p>
	      	<p class="card-text ">PW : 
	      		<a class="btn-sm pull-right bg-danger">임시번호 발송</a>
	      	</p>
	      	<p class="card-text ">Email : </p>
	      	<p class="card-text ">H.P: </p>
	      	<a class="btn text-white bg-success pull-left " href="adMain.jsp">스케쥴 관리</a>
	      	<a class="btn text-white bg-danger pull-right " href="adMain.jsp">닫기</a>
	    </div>
	</div>
	
	<div class="modal fade card container bg-info" id="createuser" style="width:400px; height:650px; 
			border: 1px solid white">
	    <img class="card-img-top" src="img/avatar2.png" alt="Card image" style="width:100%">
	    <div class="card-body">
	    	<h4 class="card-title ">ID : <input type="text"></h4>
	      	<p class="card-text ">이름 : <input type="text"></p>
	      	<p class="card-text ">PW : <input type="text"></p>
	      	<p class="card-text ">Email : <input type="text"></p>
	      	<p class="card-text ">H.P: <input type="text"></p>
	      	<p class="card-text ">지역: <input type="text"></p>
	      	<a class="btn text-white bg-danger pull-right " href="adMain.jsp">닫기</a>
	    </div>
	</div>
		
		   
	
	
</body>
</html>




















