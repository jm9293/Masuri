<%@page import="com.masuri.dto.QnaDTO"%>
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
<link rel="stylesheet" href="sup_QnaView.css">
<% QnaDTO dto = (QnaDTO)request.getAttribute("lsit");
	int pageNum = (int)request.getAttribute("page");
	boolean openchk = (boolean)request.getAttribute("open");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 d일 h시 m분");
%>
<script>
	if(!<%= openchk%>){
		alert("비공개 글입니다.");
		history.back();
	}
</script>
<title>MASURI</title>
</head>
<body>
	<!--네비바 시작-->
	<div id="navbar-wrap"></div>
	<script>
	<%@ include file="../basic/navbar.jsp" %>
    </script>
	<!--네비바 끝-->
	
	<!--메인 컨텐트 영역-->
	<div class="content">
	<h2>Q&A 상담게시판</h2>
	<br>
	<table class="table table-striped table-hover col-md-10">
		<colgroup>
			<col width="10%">
			<col width="30%">
			<col width="15%">
			<col width="10%">
			<col width="15%">
			<col width="20%">
		</colgroup>
			<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
				<th scope="col">작성일</th>
				<th scope="col">공개/비공개</th>
			</tr>
			</thead>
	<%
		if(dto != null){
	%>
		<tr>
			<td><%= dto.getNum() %></td>
			<td><%= dto.getTitle() %></td>
			<td><%= dto.getUserid() %></td>
			<td><%= dto.getViewcount() %></td>
			<td><%= sdf.format(dto.getWrtime()) %></td>
			<% 
				if(dto.getOpen() == false){
			%>
				<td>비공개</td>
			<%		
				}else{
			%>
				<td>공개</td>
			<%		
				}
			%>
		</tr>
		<tr>
			<td colspan="4" class="alert alert-dark" id="content"><%= dto.getContent() %></td>
		</tr>
	<%		
		}
	%>
	</table>
	<button type="button" id="back" class="btn btn-primary btn-lg" onclick="location.href='sup_Qna.do?page=<%= pageNum%>'">목록으로</button>
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