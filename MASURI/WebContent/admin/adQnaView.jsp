<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.masuri.dto.QnaDTO"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>공지사항 읽기</title>
</head>
<body>
	<%
	QnaDTO dto = (QnaDTO) request.getAttribute("list"); 
	boolean answercheck = dto.getAnswer() != null;
	
	%>
	
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<%@ include file="adNav.jsp" %>

	<div class="container">
		<div class="row">
			
				<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
					<thead>
						<tr>
							<th colspan="4"  style="background-color: #eee; text-align: center;">QnA 게시판</th>
						</tr>
					</thead>
					<%
						if(dto != null){
					%>
					<tbody>
						<tr>
							<td class="col-lg-1" style="border:1px solid #ccc">
								<%= dto.getNum() %>
							</td>
							<td class="col-lg-8" style="border:1px solid #ccc">
								<%= dto.getTitle() %>
							</td>
							<td class="col-lg-2" style="border:1px solid #ccc">
								<%= dto.getWrtime() %>
							</td>
							<td class="col-lg-1" style="border:1px solid #ccc">
								<%= dto.getUserid() %>
							</td>
						</tr>
						<tr>
							<td colspan="4" >
								<%= dto.getContent() %>
							</td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
				<a href="adQnaList.do" class="btn btn-primary pull-right">목록보기</a>
			
				<button type="button" onclick="AnswerShow()" class="btn pull-right">답변<%=answercheck?"보기" : "달기"%></button> 
			
		</div>
		
	</div>
		<br><br><br>
		<div id="showA" style="display:block">
			<%if(!answercheck){%>
				<div class="container">
					<div class="row">
						<form method="post" action="adQnaAnswerOK.do">
						<input type="hidden" name="page" value="<%=request.getParameter("page") %>">
						<input type="hidden" name="uid" value="<%= dto.getNum() %>">
						<input type="hidden" name="uid" value="<%= dto.getNum() %>">
							<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
								<thead>
									<tr>
										<th colspan="2" style="background-color: #eee; text-align: center;">QnA 답변</th>
									</tr>
								</thead>
								<%
									if(dto != null){
								%>
								<tbody>
									<tr>
										<td class="pull-left">└>> <%= dto.getNum() %> : <%= dto.getTitle() %></td>
									</tr>
									<tr>
										<td><textarea class="form-control" placeholder="내용" name="answer" maxlength="500" style="height: 350px;"></textarea></td>
									</tr>
								</tbody>
								<%} %>
							</table>
								<input class="btn pull-right" type="submit" value="글쓰기">
							
						</form>
						
					</div>
				</div>
			<%}else{%>
			   <div class="container">
					<div class="row">
						
						<input type="hidden" name="page" value="<%=request.getParameter("page") %>">
						<input type="hidden" name="uid" value="<%= dto.getNum() %>">
						<input type="hidden" name="uid" value="<%= dto.getNum() %>">
							<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
								<thead>
									<tr>
										<th colspan="2" style="background-color: #eee; text-align: center;">QnA 답변</th>
									</tr>
								</thead>
								<%
									if(dto != null){
								%>
								<tbody>
									<tr>
										<td class="pull-left">└>> <%= dto.getNum() %> : <%= dto.getTitle() %> </td>
										<td class="pull-right">답변시간  : <%= dto.getAntime() %></td>
									</tr>
									<tr>
										<td><textarea class="form-control" placeholder="" name="answer" maxlength="500" style="height: 350px;" readonly="readonly"><%=dto.getAnswer() %></textarea></td>
									</tr>
								</tbody>
								<%} %>
							</table>
								
							
						
						
					</div>
				</div>
			<%} %>
		</div>
	
		<script type="text/javascript">
			function AnswerShow(){
				if(document.getElementById("showA").style.display == 'block'){
					document.getElementById("showA").style.display = 'none';
				} else {
					document.getElementById("showA").style.display = 'block';
				}
			}
		</script>
	
</body>
</html>