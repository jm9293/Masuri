<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../user/support/sup_Notice.css?after">

<title>수리 요청 게시판</title>
</head>
<body>


<%@ include file="../adNav.jsp" %>

	<div class="container">
		<h2 style="color:#999">수리 신청서</h2><br>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
			<!-- 더미 -->
				<thead>
					<tr>
						<th style="background-color: #eee; text-align: center;" class="col-lg-1">번호</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-8">제목</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-2">작성일</th>
						<th style="background-color: #eee; text-align: center;" class="col-lg-1">조회수</th>
					</tr>
				</thead>
				
				<!-- 수리 신청서 불러오기 -->
				<tbody>
					<td>//더미 번호</td>
					<td>//더미 제목</td>	<!-- 제목 누르면 작서 글 볼 수 있게 해야함 -->
					<td>//더미 작성시간</td>
					<td>//더미더미</td>
				</tbody>
				
			</table>
			
			<a href="adOptionEx.do" class="btn btn-primary pull-right">옵션 설정하기</a>
		</div>
	</div>



</body>
</html>