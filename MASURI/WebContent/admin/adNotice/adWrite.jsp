<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
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
<title>관리자 게시판</title>
</head>
	
<body>

	<div class="container">
	<%@ include file="../adNav.jsp" %>
		
		<div class="table-responsive">
		<form method="post" action="adWriteOK.do">
			<table class="table table-striped">
				<thead>
					<tr><td><h3 style="color:#999">＜공지 작성＞</h3></td></tr>
					<tr class="hgh">
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="100"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><textarea class="form-control" placeholder="내용" name="content" maxlength="500" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input class="btn btn-primary" id="myRbtn" type="submit" value="작성하기">
		</form>
		</div>
	</div>
	
	
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>