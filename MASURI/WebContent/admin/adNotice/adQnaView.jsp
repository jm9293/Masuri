<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.masuri.dto.QnaDTO"%>
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
<title>QnA 보기</title>
</head>
<body>
	<%
	QnaDTO dto = (QnaDTO) request.getAttribute("list"); 
	boolean answercheck = dto.getAnswer() != null;
	%>
	
	
	
	<div class="container">
		<%@ include file="../adNav.jsp" %>
		<form method="post" name="QnaForm">
		<input type="hidden" name="uid" value="<%= dto.getNum() %>"/>
		
			
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="4">QnA 게시판</th>
						</tr>
					</thead>
					<%
						if(dto != null){
					%>
					<tbody>
						<tr>
							<td class="tab-c1" >
								<%= dto.getNum() %>
							</td>
							<td class="tab-title" >
								<%= dto.getTitle() %>
							</td>
							<td class="tab-date" >
								<%= dto.getWrtime() %>
							</td>
							<td class="tab-view" >
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
			<input type="submit" class="btn btn-outline-danger" id="myRbtn" value="삭제" onclick="javascript: QnaForm.action='adQnaDelOK.do';"></input>
			<button type="button" onclick="AnswerShow()" id="myRbtn" class="btn btn-outline-secondary">답변<%=answercheck?"보기" : "달기"%></button>
			<a href="adQnaList.do" class="btn btn-outline-primary" id="myRbtn">목록보기</a>
		</form>
	</div>
	
		<br><br><br>
		<div id="showA" style="display:block">
			<%if(!answercheck){%>
			<div class="container">
				
					<form method="post" action="adQnaAnswerOK.do">
					<input type="hidden" name="page" value="<%=request.getParameter("page") %>">
					<input type="hidden" name="uid" value="<%= dto.getNum() %>">
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="2">QnA 답변</th>
							</tr>
						</thead>
						<%
							if(dto != null){
						%>
						<tbody>
							<tr>
								<td><textarea class="form-control" placeholder="내용" name="answer" maxlength="500"></textarea></td>
							</tr>
						</tbody>
						<%} %>
					</table>
					<input class="btn btn-sm btn-outline-secondary" id="myRbtn" type="submit" value="글쓰기">
				</form>
						
			</div>
		</div>
		<%}else{%>
		<div class="container">
			<input type="hidden" name="page" value="<%=request.getParameter("page") %>">
			<input type="hidden" name="uid" value="<%= dto.getNum() %>">
			<input type="hidden" name="uid" value="<%= dto.getNum() %>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
					<thead>
						<tr>
							<th>답변</th>
							<th>시간</th>
						</tr>
					</thead>
					<%
						if(dto != null){
					%>
					<tbody>
						<tr>
							<td class="tab-title2">
								<textarea class="form-control" name="answer" maxlength="500" readonly="readonly"><%=dto.getAnswer() %></textarea>
							</td>
							<td class="tab-date"><%= dto.getAntime() %></td>
						</tr>
						
					</tbody>
					<%} %>
				</table>
			
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>