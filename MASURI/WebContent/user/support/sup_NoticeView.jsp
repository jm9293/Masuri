<%@page import="com.masuri.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap 4.3.1 css요소 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"crossorigin="anonymous">
<!-- 기본 폰트 구글 Noto Sans 굵기 400,500,900 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
<!-- 기본 css -->
<link rel="stylesheet" href="../basic/CSS/basic.css">
<!--jquery 3.3.1 불러오기-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 페이지 css -->
<link rel="stylesheet" href="sup_NoticeView.css">
<% NoticeDTO dto = (NoticeDTO) request.getAttribute("list"); %>
<style>
</style>
<% %>
<title>MASURI</title>
</head>
<body>
	<!--네비바 시작-->
	<div id="navbar-wrap"></div>
	<script>
          $("#navbar-wrap").load("../basic/navbar.html");
    </script>
	<!--네비바 끝-->
	
	<!--메인 컨텐트 영역-->
	<div class="content">
	<h2>공지사항</h2>
	<br>
	<table class="table table-striped table-hover col-md-10">
			<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			</thead>
	<%
		if(dto != null){
	%>
		<tr>
			<td><%= dto.getNum() %></td>
			<td><%= dto.getTitle() %></td>
			<td><%= dto.getViewcount() %></td>
			<td><%= dto.getWrtime() %></td>
		</tr>
		<tr>
			<td colspan="4" class="alert alert-dark" id="content"><%= dto.getContent() %></td>
		</tr>
	<%		
		}
	%>
	</table>
	<button type="button" id="back" class="btn btn-primary btn-lg" onclick="location.href='sup_Notice'">목록으로</button>
	<br><br>
	</div>
	
	
	<!--메인 컨텐트 끝-->

	<!--푸터 시작-->
	<div id="footer-wrap"></div>
	<script>
        $("#footer-wrap").load("../basic/footer.html");
    </script>
	<!--푸터 끝-->
	<!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>