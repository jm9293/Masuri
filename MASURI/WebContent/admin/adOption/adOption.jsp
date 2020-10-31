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



	<div class="container mini">
		<%@ include file="../adNav.jsp" %>
		<h2 style="color:#999">수리 신청서</h2><br>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr class="hgh">
						<th class="tab-c1">번호</th>
						<th class="tab-title">제목</th>
						<th class="tab-date">작성일</th>
						<th class="tab-c1">조회수</th>
					</tr>
				</thead>
					
					<!-- 수리 신청서 불러오기 -->
				<tbody>
					<tr>
						<td class="not-h tab-c1">//번호</td>
						<td class="tab-title">//더미 제목</td>	<!-- 제목 누르면 작서 글 볼 수 있게 해야함 -->
						<td class="tab-date">//더미 작성시간</td>
						<td class="tab-c1">//더미</td>
					</tr>
				</tbody>	
			</table>	
			<a href="adOptionEx.do" class="btn btn-outline-primary" id="myRbtn">옵션 설정하기</a>
		</div>		
	</div>



</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>