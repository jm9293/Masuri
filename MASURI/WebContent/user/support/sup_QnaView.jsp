<%@page import="com.masuri.dto.QnaDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="sup_QnaView.css">


<title>MASURI</title>
</head>
<body>
	<!--네비바 시작-->
	<div id="navbar-wrap">
	<%@ include file="../basic/navbar.jsp" %>
	</div>
	 <% QnaDTO dto = (QnaDTO)request.getAttribute("list");
	int pageNum = (int)request.getAttribute("page");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d hh:m");
	boolean openchk = dto.getOpen() || dto.getUserid().equals(userID);
	
	if(!openchk){
	%>
	<script>
	alert("비공개 글입니다.");
	history.back();
	</script>
	<%
	return;}
	%>	
	<!--네비바 끝-->
	
	<!--메인 컨텐트 영역-->
	<div class="content">
	<h2>Q&A 상담게시판</h2>
	<br>
		<div class="menuname menuborder row col-12 col-md-8 alert-primary">
			<div class="col-2 col-md-1 menu">No</div>
			<div class="col-6 col-md-3 menu">제목</div>
			<div class="col-4 col-md-2 menu">작성자</div>
			<div class="col-2 col-md-2 menu">조회</div>
			<div class="col-6 col-md-2 menu">작성일</div>
			<div class="col-4 col-md-2 menu">공개글</div>			
		</div>
		<div class="menuname row col-12 col-md-8">
			<div class="col-2 col-md-1 text"><%= dto.getNum() %></div>
			<div class="col-6 col-md-3 text"><%= dto.getTitle() %></div>
			<div class="col-4 col-md-2 text"><%= dto.getUserid() %></div>
			<div class="col-2 col-md-2 text"><%= dto.getViewcount() %></div>
			<div class="col-6 col-md-2 text"><%= sdf.format(dto.getWrtime()) %></div>
			<% 
				if(!dto.getOpen()){
			%>
				<div class="col-4 col-md-2 text">비공개</div>
			<%		
				}else{
			%>
				<div class="col-4 col-md-2 text">공개</div>
			<%		
				}
			%>
		</div>
		<h6>- 글 내용 -</h6>
		<div class="row col-12 col-md-8 cont">
			<textarea class="col-12" readonly><%= dto.getContent() %></textarea>
		</div>
		<%
			if(dto.getAnswer() != null){
		%>
		<br>
		<h6>- 답변 내용 - <br>작성일: <%= sdf.format(dto.getAntime()) %></h6>
		<div class="contentbox row col-12 col-md-8">
			<div class="col-12"><%= dto.getAnswer() %></div>
		</div>
		<%		
			}
		%>
		
	<br>
	<%
		if(userID != null && userID.equals(dto.getUserid())){
	%>
	<div id="select" class="row col-8">
		<button type="button" class="btn btn-primary btn-md" onclick="location.href='sup_QnaUpdate.do?page=<%= pageNum%>&uid=<%=dto.getNum()%>'">수정</button>
		<button type="button" class="btn btn-secondary btn-md" onclick="location.href='sup_QnaDelete.do?uid=<%=dto.getNum()%>'">삭제</button>
	</div>
	<br>
	<%			
		}
	%>	
	<button type="button" id="back" class="btn btn-dark btn-md" onclick="location.href='sup_Qna.do?page=<%= pageNum%>'">목록으로</button>
	
	<br><br>
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