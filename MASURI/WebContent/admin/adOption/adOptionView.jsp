<%@page import="com.masuri.dto.ReslistDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
<title>Insert title here</title>
</head>
<body>
	<%
		ReslistDTO dto =  (ReslistDTO)request.getAttribute("list");
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
		System.out.println(dto);
	%>
	<div class="container">
	<%@ include file="../adNav.jsp" %>
		<form method="post" action="adOptionDel.do">
			<input type="hidden" name="uid" value="<%= dto.getNum() %>"/>
			<table class="table">
			<%
				if( dto != null){
			%>
			
				<thead>	
					<tr class="hgh">
						<td class="tab-label">유저ID : <%= dto.getUserid() %> </td>
						<td class="tab-label">기사ID : <%= dto.getEngid() %></td>
					</tr>
					<tr>
						<td class="tab-label">제조사/기종 : <%= dto.getFactory() %>/<%= dto.getModel() %></td>
						<td class="tab-label">고장 상황 : <%= dto.getFailsit() %></td>
					</tr>
					<tr>
						<td class="tab-label">날짜-시간 : <%= dto.getTime() %></td>
						<td class="tab-label">수리받을 장소 : <%= dto.getAddress() %></td>
					</tr>
					<tr>				
						<td colspan="2"><label class="nomg">고장 상세 내용<p class="nomg">[수리 상황 : <%= dto.getState() %>]</p></label></td>
					</tr>
					<tr>				
						<td colspan="2"><div class="form-control tab-db"><%= dto.getFailmsg() %></div></td>
					</tr>
				</thead>
			<%
				}
			%>
			</table><br>
			<a href="adOption.do" class="btn btn-outline-primary" id="myLbtn">목록보기</a>
			<input type="button" class="btn btn-outline-secondary" id="myLbtn" value="수리 완료"></>
			<input type="submit" class="btn btn-outline-danger" id="myRbtn" value="삭제"/>
		</form>
		
		
		
		
	</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>