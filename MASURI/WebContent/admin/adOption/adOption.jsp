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

<title>수리 요청 게시판</title>
</head>
<body>
	<%
		ArrayList<ReslistDTO> list =  (ArrayList<ReslistDTO>)request.getAttribute("list");
		int ppage = (int)request.getAttribute("page");
		int max = (int)request.getAttribute("max");
		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd hh:mm:ss");

	%>


	<div class="container mini">
		<%@ include file="../adNav.jsp" %>
		<h2 style="color:#999">수리 신청서</h2><br>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr class="hgh">
						<th class="tab-view">유저</th>
						<th class="tab-view">기사</th>
						<th class="tab-title">제목</th>
						<th class="tab-date">주소</th>
					</tr>
				</thead>
					
					<!-- 수리 신청서 불러오기 -->
				<tbody>
			<%
				if(list != null){
					for(int i = 0; i < list.size(); i++){
			%>
					<tr>
						<td class="not-h tab-view"><%= list.get(i).getUserid() %></td>
						<td class="tab-view"><%= list.get(i).getEngid() %></td>
						<td class="tab-title"><%= list.get(i).getFactory() %> / <%= list.get(i).getModel() %></td>
						<td class="tab-date"><%= list.get(i).getAddress() %></td>
					</tr>
				<%
	      			}
				}
			%>	
				</tbody>
			</table>	
			<a href="adOptionEx.do" class="btn btn-outline-primary" id="myRbtn">옵션 설정하기</a>
		</div>		
	</div><br>
	
	
	<div class="box_ul mini">
		<ul class="box_li">
			<%
				if (ppage - 1 < 1) {
			%>
			<li class="paging"><a
				href="/MASURI/admin/adOption/adOption.do?page=1">이전</a></li>
			<%
				} else {
			%>
			<li class="paging"><a
				href="/MASURI/admin/adOption/adOption.do?page=<%=ppage - 1%>">이전</a></li>
			<%
				}
			if (max > 0) {
				for (int i = 1; i <= max; i++) {
					if (ppage == i) {
			%>
			<li class="paging"><a class='active tooltip-top'
				href="/MASURI/admin/adOption/adOption.do?page=<%=i%>"><%=i%></a></li>
			<%
				} else {
			%>
			<li class="paging"><a
				href="/MASURI/admin/adOption/adOption.do?page=<%=i%>"><%=i%></a></li>
			<%
					}
				}
			}
			%>
			<%
				if (ppage < max) {
			%>
			<li class="paging"><a
				href="/MASURI/admin/adOption/adOption.do?page=<%=ppage +1 %>">다음</a></li>
					
			<%
				} else {
			%>
			<li class="paging"><a
				href="/MASURI/admin/adOption/adOption.do?page=<%=max%>">다음</a></li>
			<%
				}
			%>
		</ul>
		
		
	</div>


</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>