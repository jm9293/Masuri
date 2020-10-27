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
<body>
	<%
		String ID = null;
		if(session.getAttribute("ID") != null){
			ID = (String)session.getAttribute("ID");
		}
	%>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<%@ include file="adNav.jsp" %>

    
    
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
			<!-- 더미 -->
				<thead>
					<tr>
						<th style="background-color: #eee; text-align: center;" class="col-lg-1">번호</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-8">제목</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-2">작성일</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-1">조회수</th>
					</tr>
				</thead>
				<!-- 더미 -->
				<tbody>
					<td>1</td>
					<td>10월 특가</td>
					<td>20.10.22</td>
					<td>29</td>
				</tbody>
			</table>
			<a href="optionSys.jsp" class="btn btn-success pull-right">신청서 설정</a>
		</div>
	</div>
	
	
</body>
</html>