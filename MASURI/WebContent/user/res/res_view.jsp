<%@page import="com.masuri.dto.ReslistDTO"%>
<%@page import="com.masuri.dto.NoticeDTO"%>
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
<link rel="stylesheet" href="css/res_chk.css?after">
<link rel="stylesheet" href="css/res_view.css?after">
<%
	ReslistDTO dto = null;
	int pageNum = 0;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 d일 hh시");
	String engname = (String)request.getAttribute("engname");
	int result = (int) request.getAttribute("result");
	if (result == 0) {
%>
	<script>
		location.href = "../ErrorPage.do";
	</script>
<%	return;	
	} else {
		dto = (ReslistDTO) request.getAttribute("list");
		pageNum = Integer.parseInt(request.getParameter("page")); 
		
	}
%>
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
	<div class="col-12 col-lg-8 head"><h2>수리신청서 보기</h2></div><br>
	 
	<%
		if(dto != null){
	%>
	    <div class="menuname menuborder row col-12 col-lg-8 alert-primary">
			<div class="col-4 col-lg-1 menu">신청번호</div>
			<div class="col-8 col-lg-5 menu">출장여부</div>
			<div class="col-4 col-lg-3 menu">출장일시</div>
			<div class="col-8 col-lg-3 menu">엔지니어</div>	
		</div>
		<div class="menuname textarea row col-12 col-lg-8 textlist2">
			<div class="col-4 col-lg-1 text" id="text1"><%= dto.getNum() %></div>
			<%if(!dto.getAddress().equals("센터")){ %>
			<div class="col-8 col-lg-5 text" id="text3"><%= "Y : "+dto.getAddress().replace("서울특별시", "") %></div>	
			<%}else{ %>
			<div class="col-8 col-lg-5 text" id="text3">N : 센터방문고객</div>	
			<%} %>
			<div class="col-4 col-lg-3 text" id="text1"><%= sdf.format(dto.getTime()) %></div>
			<div class="col-8 col-lg-3 text" id="text3"><%= engname %></div>
		</div>
		<div class="menuname menuborder row col-12 col-lg-8 alert-primary">
			<div class="col-4 col-lg-3 menu">제조사</div>
			<div class="col-8 col-lg-3 menu">기종</div>
			<div class="col-4 col-lg-3 menu">고장내용</div>
			<div class="col-8 col-lg-3 menu">예약상태</div>			
		</div>
		<div class="menuname textarea row col-12 col-lg-8 textlist2">
			<div class="col-4 col-lg-3 text" id="text1"><%= dto.getFactory() %></div>
			<div class="col-8 col-lg-3 text" id="text3"><%= dto.getModel() %></div>
			<div class="col-4 col-lg-3 text" id="text1"><%= dto.getFailsit() %></div>
			<div class="col-8 col-lg-3 text" id="text3"><%= dto.getState() %></div>	
		</div>
		<br>
		
		<div class="row col-12 col-lg-8 contentbox">
			고장상세내용
			<textarea class="col-12 form-control" readonly maxlength="100" rows="3"><%= dto.getFailmsg() %></textarea>
			<b>예약취소는 상담게시판을 이용해주세요.</b>
		</div>
		<br>
		<%if(!dto.getAddress().equals("센터")){%>
		<button type="button" id="back" class="btn btn-primary btn-md" onclick="location.href='res_chk1.do?page=<%= pageNum%>'">목록으로</button>
		<%}else{ %>
		<button type="button" id="back" class="btn btn-primary btn-md" onclick="location.href='res_chk2.do?page=<%= pageNum%>'">목록으로</button>
		<%} %>	
		<br><br>
	<%		
		}
	%>	
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