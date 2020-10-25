<%@page import="com.masuri.dto.NoticeDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link rel="stylesheet" href="sup_NoticeView.css?after">
<% NoticeDTO dto = (NoticeDTO) request.getAttribute("list"); 
	int pageNum = (int)request.getAttribute("page");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 d일 h시 m분");
%>
<style>
</style>
<% %>
<title>MASURI</title>
</head>
<body>
	<!--네비바 시작-->
	<div id="navbar-wrap">
	<%@ include file="../basic/navbar.jsp" %>
	</div>
	<!--네비바 끝-->
	
	<!--메인 컨텐트 영역-->
	<div class="content">
	<h2>공지사항</h2>
	<br>
	<div class="menuname row col-10 table table-dark">
			<div class="col-2 menu">번호</div>
			<div class="col-4 menu">제목</div>
			<div class="col-3 menu">조회수</div>
			<div class="col-3 menu">작성일</div>
	</div>
	<%
		if(dto != null){
	%>
		<div class="menuname row col-10">
			<div class="col-2 text"><%= dto.getNum() %></div>
			<div class="col-4 text"><%= dto.getTitle() %></div>
			<div class="col-3 text"><%= dto.getViewcount() %></div>
			<div class="col-3 text"><%= sdf.format(dto.getWrtime()) %></div>
		</div>
	<%		
		}
	%>
		<div class="menuname row col-10">
			<div class="contentbox col-12"><%= dto.getContent() %>asdasdasdasdasdasdasdasdasdasdasdasdasdasdsadasdas</div>
		</div>
	<br>
	<button type="button" id="back" class="btn btn-primary btn-lg" onclick="location.href='sup_Notice.do?page=<%= pageNum%>'">목록으로</button>
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