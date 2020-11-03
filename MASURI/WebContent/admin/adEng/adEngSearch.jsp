<%@page import="com.masuri.dto.EngineerDTO"%>
<%@page import="java.util.ArrayList"%>
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
<title>MASURI MANAGER</title>
<%
	ArrayList<EngineerDTO> list = (ArrayList<EngineerDTO>)request.getAttribute("list");
	String text = (String)request.getAttribute("text");
	String textVal = text.trim();
	String selectMenu = ((String [])request.getAttribute("selectMenu"))[0];
	System.out.println(selectMenu);
	if(list.isEmpty()){
	%>
		<script>
			alert("검색내역이 없습니다.");
			location.href="adEngEdit.do";
		</script>
	<% return;}	
	
%>

</head>
<body class="cont">

    
    <div class="container">
	<%@ include file="../adNav.jsp" %>
       <h2 style="color:#999">직원 관리 페이지</h2><br>
		<a href="adEngCreate.do" id="myRbtn" class="btn btn-outline-success">계정 생성</a>
		<div class="col-5 nopad">
		    <form class="navbar-form" role="search" action="adEngSearch.do">
		    <div class="col-5 nopad">
    		
			<select class="selectpicker" name="selectMenu">
				<option value="id_sch" id="id_sch">ID검색</option>
				<option value="name_sch" id="name_sch">이름검색</option>
				<option value="num_sch" id="num_sch">휴대폰번호검색</option>
			</select>
			</div>
			<br>
			   	<div class="input-group">
			        <input type="text" class="form-control srctxt" placeholder="검색종류를 선택 후 검색하세요"
			         id="srch-term"  name="text" value="<%=textVal%>">
			        <div class="input-group-btn">
			            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	        		</div>
	      		</div>
		    </form>
		</div><br><br>
		
		<% 
			if(list != null && textVal != null){
				for(int i =0; i < list.size(); i++){			
		%>
		<div class="card l-8">
			<div class="card-header my-ch">ID: <%= list.get(i).getId() %></div>
			<div class="card-body my-cb">이름 : <%= list.get(i).getName() %></div>
			<div class="card-body my-cf">연락처: <%= list.get(i).getPhone() %>
			<button type="button" class="btn btn-sm " 
					onclick="location.href='adEngInfo.do?uid=<%= list.get(i).getId() %>'"
						id="myRbtn2">프로필 보기</button>
			</div>
			<br>
		</div>
		<%				
				}
				
			}
		%>
	</div>
</body>
 <script>
 $(function(){
	 $("#<%=selectMenu%>").attr("selected","selected");
 });
 
 </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</html>