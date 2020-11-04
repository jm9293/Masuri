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
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
		String text = (String)request.getAttribute("text");
		String textVal = text.trim();
		String searchid = ((String [])request.getAttribute("searchid"))[0];
		if(list.isEmpty()){
		
	%>
	
	<script>
		alert("검색 결과가 없습니다.");
		history.back();
	</script>
	<%
			return;
		}
	%>


	<div class="container mini">
		<%@ include file="../adNav.jsp" %>
		<h2 style="color:#999">수리 신청서</h2><br>
		<form action="adOptionSearch.do">
			&nbsp;<input type="radio" name="searchid" id="userid" value="userid" checked="checked"> 유저 ID&nbsp;&nbsp;
			<input type="radio" name="searchid" id="searchid" value="engid"> 기사 ID
			<input type="text" class="form-control srctxt" placeholder="찾고자 하는 ID를 입력하세요" 
			id="srch-term"  name="text" value="<%= textVal %>"><br>
		</form>  	        	
		
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr class="hgh">
						<th class="tab-view">유저</th>
						<th class="tab-view">기사</th>
						<th class="tab-title3">제목</th>
						<th class="tab-view">지역</th>
						<th class="tab-view">시간</th>
						<th class="tab-view">상태</th>
					</tr>
				</thead>
					
					<!-- 수리 신청서 불러오기 -->
				<tbody>
			<%
				if(list != null && textVal != null){
					for(int i = 0; i < list.size(); i++){
			%>
					<tr>
						<td class="not-h tab-view "><%= list.get(i).getUserid() %></td>
						<td class="tab-view "><%= list.get(i).getEngid() %></td>
						<td class="tab-title3 "><%= list.get(i).getFactory() %> / <%= list.get(i).getModel() %></td>
						<td class="tab-view "><%= list.get(i).getAddress() %></td>
						<td class="tab-view "><%= sdf.format(list.get(i).getTime()) %></td>
						<td class="tab-view "><%= list.get(i).getState() %></td>
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
	


</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>