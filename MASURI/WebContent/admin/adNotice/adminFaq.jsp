<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.masuri.dto.FaqDTO"%>
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
<title>자주 묻는 질문</title>
</head>
<body>
	<%
		ArrayList<FaqDTO> list = (ArrayList<FaqDTO>)request.getAttribute("list");
	%>
	

	<div class="container">
		<%@ include file="../adNav.jsp" %>
		<h2 style="color:#999">FaQ - 자주 묻는 질문</h2><br>
		
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="tab-c1">번호</th>
						<th class="tab-title2">질문</th>
						<th class="tab-c1">삭제</th>
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
					<td><%= list.get(i).getQuestion() %></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><b><%= list.get(i).getAnswer() %></b></td>
					<td>
						<input type="button" class="btn btn-outline-danger pull-right" id="<%= list.get(i).getNum() %>" onclick="deletebtn(this)" value="삭제"/>
					</td>
				</tr>
				</tbody>
				<%		}
					}
				%>
				</form>
			</table>
			<a href="adminFaqWrite.do" class="btn btn-outline-secondary" id="myRbtn">작성하기</a>
		
	</div>
		
	
</body>


<script>

	function deletebtn(e) {
    	var id = e.id;
    	document.getElementById("uid").value = id;
    	form1.submit();
	}

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>