<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.masuri.dao.FaqDAO" %>
<%@ page import="com.masuri.dto.FaqDTO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../user/support/sup_Notice.css?after">
<style>
</style>
<% ArrayList<FaqDTO> list = (ArrayList<FaqDTO>)request.getAttribute("list");%>
<title>MASURI</title>
</head>
<body>
	<!--네비바 시작-->
	<div id="navbar-wrap"></div>
	<%@ include file="adNav.jsp" %>
   
	<!--네비바 끝-->
	
	<!--메인 컨텐트 영역-->
	<div class="container">
	<h2 style="color:#999">FAQ</h2><br>
	
	<% 	if(list != null){
			for(int i = 0; i < list.size(); i++){
	%>		
		<div class="col-md-10 question">
			<div class="alert alert-secondary"><%= list.get(i).getQuestion() %></div>
			<div class="alert alert-dark"><p><%= list.get(i).getAnswer() %></p></div>
		</div>
	<%
			}
		
		}
	%>
	</div>
	
	<!--메인 컨텐트 끝-->

	<!--푸터 시작-->
	<div id="footer-wrap"></div>
	
	<!--푸터 끝-->
	<!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
	
</body>
</html>