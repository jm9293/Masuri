<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.masuri.dto.NoticeDTO"%>
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
<link rel="stylesheet" href="sup_Notice.css">
<% ArrayList<NoticeDTO> list = null;
	int max = 0;
	int pageNum = 0;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d hh:m");
	int result = (int)request.getAttribute("result");
	if(result == 0){
%>
	<script>
		location.href="../ErrorPage.do";
	</script>
<%	return;	
		
	}else{
		list = (ArrayList<NoticeDTO>)request.getAttribute("list");
		max = (int)request.getAttribute("max");
		pageNum = (int)request.getAttribute("page");
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
		<div class="col-12 col-md-8 head"><h2>공지사항</h2></div>
		<br>
		<div class="menuname menuborder row col-12 col-md-8 alert-primary">
			<div class="col-4 col-md-2 menu">No</div>
			<div class="col-8 col-md-4 menu">제목</div>
			<div class="col-4 col-md-2 menu">조회</div>
			<div class="col-8 col-md-4 menu">작성일</div>
		</div>
		<%
			if(list != null){
				for(int i = 0; i < list.size(); i++){
		%>		
		<div class="menuname row col-12 col-md-8 textlist" onclick="location.href='sup_NoticeView.do?page=<%= pageNum%>&uid=<%=list.get(i).getNum()%>'">
			<div class="col-4 col-md-2 text" id="text1"><%= list.get(i).getNum() %></div>
			<div class="col-8 col-md-4 text" id="text2"><%= list.get(i).getTitle() %></div>
			<div class="col-4 col-md-2 text" id="text3"><%= list.get(i).getViewcount() %></div>
			<div class="col-8 col-md-4 text"><%= sdf.format(list.get(i).getWrtime()) %></div>
		</div>
			
		<%		}
			}
		%>
		<br>
		<div class="box_ul">
			<ul class="box_li">
				<%
					if (pageNum - 1 < 1) {
				%>
				<li class="paging"><a
					href="/MASURI/user/support/sup_Notice.do?page=1">이전</a></li>
				<%
					} else {
				%>
				<li class="paging"><a
					href="/MASURI/user/support/sup_Notice.do?page=<%=pageNum - 1%>">이전</a></li>
				<%
					}
				if (max > 0) {
					for (int i = 1; i <= max; i++) {
						if (pageNum == i) {
				%>
				<li class="paging"><a class='active tooltip-top'
					href="/MASURI/user/support/sup_Notice.do?page=<%=i%>"><%=i%></a></li>
				<%
					} else {
				%>
				<li class="paging"><a
					href="/MASURI/user/support/sup_Notice.do?page=<%=i%>"><%=i%></a></li>
				<%
					}
				}
				}
				%>
				<%
					if (pageNum < max) {
				%>
				<li class="paging"><a
					href="/MASURI/user/support/sup_Notice.do?page=<%=pageNum +1 %>">다음</a></li>
				
				<%
					} else {
				%>
				<li class="paging"><a
					href="/MASURI/user/support/sup_Notice.do?page=<%=max%>">다음</a></li>
				<%
		}%>
			</ul>
		</div>
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