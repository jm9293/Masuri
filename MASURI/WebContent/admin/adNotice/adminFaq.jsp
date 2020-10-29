<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.masuri.dto.FaqDTO"%>
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
<link rel="stylesheet" href="../../user/support/sup_Notice.css?after">

<title>자주 묻는 질문</title>
</head>
<body>
	<%
	
	/*
	String ID = null;
		if(session.getAttribute("ID") != null){
			ID = (String)session.getAttribute("ID");
		}
	*/
	
		ArrayList<FaqDTO> list = (ArrayList<FaqDTO>)request.getAttribute("list");
	%>
	

	<%@ include file="../adNav.jsp" %>
  
    
    
	<div class="container">
		<h2 style="color:#999">FaQ - 자주 묻는 질문</h2><br>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
				<thead>
					<tr>
						<th style="background-color: #eee; text-align: center;" class="col-lg-1"></th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-10">질문</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-1"></th>
					</tr>
				</thead>
				
				<form action="adminFaqDelOK.do" name="form1">
				<input type="hidden" id="uid" name="uid" value="">
				<%
					if(list != null){
						for(int i = 0; i < list.size(); i++){
				%>	
				<tbody>
				<tr>
					<td></td>
					<td><h5><b><%= list.get(i).getQuestion() %></b></h4></td>
					<td></td>
				</tr>
				<tr>
					<td>답변</td>
					<td><i><%= list.get(i).getAnswer() %></i></td>
					<td>
						<input type="button" class="btn btn-danger pull-right" id="<%= list.get(i).getNum() %>" onclick="deletebtn(this)" value="삭제"/>
					</td>
				</tr>
				</tbody>
				<%		}
					}
				%>
				</form>
			</table>
			
			<a href="adminFaqWrite.do" class="btn btn-primary pull-right">작성하기</a>
		</div>
	</div>
		
	
</body>


<script>

	function deletebtn(e) {
    	var id = e.id;
    	document.getElementById("uid").value = id;
    	form1.submit();
	}

</script>

</html>