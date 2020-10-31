<%@page import="com.masuri.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
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
<title>공지사항 게시판</title>
</head>
	
<body>
	<%
		NoticeDTO dto = (NoticeDTO) request.getAttribute("list");
		
	%>

	<div class="container">
	<%@ include file="../adNav.jsp" %>
	
	
		<div class="table-responsive">
			<form method="post" action="adNoticeUpdateOK.do">
			<input type="hidden" name="uid" value="<%= dto.getNum() %>"/>
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2">공지사항 수정</th>
						</tr>
					</thead>
					<%
						if(dto != null){
					%>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="100" value="<%= dto.getTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="내용" name="content" maxlength="500" style="height: 350px"><%= dto.getContent() %></textarea></td>
						</tr>
					</tbody>
					<%} %>
				</table>
				<a href="adNotice.do" class="btn btn-primary" id="myRbtn">목록보기</a>
				<input class="btn btn-success" id="myRbtn" type="submit" value="수정 완료">
			</form>
		</div>
	</div>
	
	
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>