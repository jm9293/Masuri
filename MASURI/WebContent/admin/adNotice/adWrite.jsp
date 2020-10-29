<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>관리자 게시판</title>
</head>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<body>
	<%@ include file="../adNav.jsp" %>

	<div class="container">
		<div class="row">
			<form method="post" action="adWriteOK.do">
				<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eee; text-align: center;">공지사항 게시판</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="100"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="내용" name="content" maxlength="500" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
					<input class="btn pull-right" type="submit" value="작성하기">
				
			</form>
			
		</div>
	</div>
	
	
</body>
</html>