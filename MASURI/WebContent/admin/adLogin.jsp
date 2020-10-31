<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mycss/mycss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>관리자 게시판</title>
</head>


<body>

	<div class="container align-center mini floatNav">
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="adLogin.jsp">Masuri 관리자 계정</a>
			</div>
		</nav><br><br><br><br>
				
		
		<div class="jumbotron col-4 mx-auto mini" style="padding-top: 20px">
			<form method="post" action="adLoginOK.do">
				<h3 style="text-align: center;">관리자 로그인</h3><br>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" id="adminID" name="adminID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" id="adminPW" name="adminPW" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">
			</form>
		</div>
		<div class="col-4"></div>
	</div>
	
</body>


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>