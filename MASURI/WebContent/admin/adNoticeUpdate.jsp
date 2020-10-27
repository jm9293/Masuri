<%@page import="com.masuri.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>공지사항 게시판</title>
</head>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<body>
	<%@ include file="adNav.jsp" %>
	<%
		NoticeDTO dto = (NoticeDTO) request.getAttribute("list");
		
	%>

	<div class="container">
		<div class="row">
			<form method="post" action="adNoticeUpdateOK.do">
			<input type="hidden" name="uid" value="<%= dto.getNum() %>"/>
				<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eee; text-align: center;">공지사항 게시판</th>
						</tr>
					</thead>
					<%
						if(dto != null){
					%>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="TITLE" maxlength="100" value="<%= dto.getTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="내용" name="CONTENT" maxlength="500" style="height: 350px;"><%= dto.getContent() %></textarea></td>
						</tr>
					</tbody>
					<%} %>
				</table>
					<input class="btn pull-right" type="submit" value="수정하기">
			</form>
			
		</div>
	</div>
	
	
</body>
</html>