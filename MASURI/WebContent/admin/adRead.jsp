<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.masuri.dto.NoticeDTO"%>
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
		NoticeDTO dto = (NoticeDTO) request.getAttribute("list"); 
		
		
	%>
	
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<%@ include file="adNav.jsp" %>

	<div class="container">
		<div class="row">
			<form method="post" action="adNoticeUpdate.do">
			<input type="hidden" name="uid" value="<%= dto.getNum() %>"/>
				<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
					<thead>
						<tr>
							<th colspan="4"  style="background-color: #eee; text-align: center;">공지사항 게시판</th>
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
								관리자
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
				<button type="submit" class="btn btn-success pull-right">수정하기</button>
				<a href="adNotice.do" class="btn btn-primary pull-right">목록보기</a>
				
			</form>
			
		</div>
	</div>
	
	
</body>
</html>