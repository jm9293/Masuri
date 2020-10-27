<%@ page import="com.masuri.dto.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../user/support/sup_Notice.css?after">

	<title>QnA 게시판</title>
</head>
<body>
	<%
	
	/*
	String ID = null;
		if(session.getAttribute("ID") != null){
			ID = (String)session.getAttribute("ID");
		}
	*/
		ArrayList<QnaDTO> list = (ArrayList<QnaDTO>)request.getAttribute("list");
		int ppage = (int)request.getAttribute("page");
		int max = (int)request.getAttribute("max");
		SimpleDateFormat sdf = new SimpleDateFormat("yy.M.d h:m");
	%>
	

	<%@ include file="adNav.jsp" %>
  
    
    
	<div class="container">
		<h2 style="color:#999">QnA 게시판</h2><br>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
			<!-- 더미 -->
				<thead>
					<tr>
						<th style="background-color: #eee; text-align: center;" class="col-lg-1">번호</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-7">제목</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-1">작성자ID</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-1">조회수</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-2">작성일</th>
					</tr>
				</thead>
				
				<%
					if(list != null){
						for(int i = 0; i < list.size(); i++){
				%>	
				<tbody>
					<td><%= list.get(i).getNum() %></td>
					<td><a href="adRead.do?page=<%= ppage%>&uid=<%=list.get(i).getNum()%>"><%= list.get(i).getTitle() %></a></td>
					<td><%= list.get(i).getUserid() %></td>
					<td><%= list.get(i).getViewcount() %></td>
					<td><%= sdf.format(list.get(i).getWrtime()) %></td>
				</tbody>
				<%		}
					}
				%>
			</table>
			
			<a href="adQnaWrite.do" class="btn btn-primary pull-right">작성하기</a>
		</div>
	</div>
	
</body>
</html>