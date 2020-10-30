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
<!-- bootstrap 4.3.1 css요소 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"crossorigin="anonymous">
<!-- 기본 폰트 구글 Noto Sans 굵기 400,500,900 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
<!-- 기본 css -->
<link rel="stylesheet" href="../basic/CSS/basic.css">
<!--jquery 3.3.1 불러오기-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 페이지 css -->
<link rel="stylesheet" href="sup_FAQ.css">
<style>
</style>
<% ArrayList<FaqDTO> list = (ArrayList<FaqDTO>)request.getAttribute("list");%>
<title>MASURI</title>
</head>
<body>
	<!--네비바 시작-->
	<div id="navbar-wrap">
	<%@ include file="../basic/navbar.jsp" %>
	</div>
	<!--네비바 끝-->
	
	<!--메인 컨텐트 영역-->
	<div class="content">
	<div class="col-12 col-md-8 head"><h2>FAQ 자주 묻는 질문</h2></div>
	<br>
	<% if(list != null){
	%>
		<div class="accordion col-12 col-md-8 box" id="accordionExample">
  			<div class="card">
    			<div class="card-header" id="headingOne">
      			<h2 class="mb-0">
        			<button class="btn btn-link btn-block text-left col-12" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          			<%= list.get(0).getQuestion() %>
        			</button>
      			</h2>
    			</div>

    			<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      			<div class="card-body">
        			<textarea class="col-12 form-control text" readonly><%= list.get(0).getAnswer() %></textarea>
      			</div>
    			</div>
  			</div>
				
				<%
					for(int i = 1; i < list.size(); i++){
				%>	

  			<div class="card">
    			<div class="card-header" id="headingTwo<%=i %>">
      			<h2 class="mb-0">
        			<button class="btn btn-link btn-block text-left collapsed col-12" type="button" data-toggle="collapse" data-target="#collapseTwo<%=i %>" aria-expanded="false" aria-controls="collapseTwo<%=i %>">
          			<%= list.get(i).getQuestion() %>
        			</button>
      			</h2>
    			</div>
    			<div id="collapseTwo<%=i %>" class="collapse" aria-labelledby="headingTwo<%=i %>" data-parent="#accordionExample">
      			<div class="card-body">
        			<textarea class="col-12 form-control" readonly><%= list.get(i).getAnswer() %></textarea>
      			</div>
    			</div>
  			</div>
				<% }
				%>
		</div>
	<%
	} %>
		</div>
	<!--메인 컨텐트 끝-->

	<!--푸터 시작-->
	<div id="footer-wrap"></div>
	<script>
        $("#footer-wrap").load("../basic/footer.html");
    </script>
	<!--푸터 끝-->
	<!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>