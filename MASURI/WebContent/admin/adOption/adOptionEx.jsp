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
<title>요청사항 설정</title>
</head>
<body>
	
	<div class="container">
	<%@ include file="../adNav.jsp" %>
	
		<h2 style="color:#999;">요청사항 설정</h2><br>
		<div class=""></div>
		<div class="input-box ">
			<label for="kindPh">폰 기종 선택 : 제조사 / 기기 종류 </label>
			<input type="text" class="form-control" id="plusOption" name="plusOption" 
				placeholder="옵션 메뉴 등록하기" value=""><br>
			<button class="btn btn-outline-secondary" type="submit" id="myLbtn">신규 기종 등록하기</button><br><br><br><br>
				
			<table class="table table-striped">
				<tbody>
					<tr>
						<td class="tab-title2">DB에서 가져오는 데이터(기종)</td>	<!-- 등록한 기종들 가져오기 -->
						<td class="tab-view">
							<input type="button" class="btn btn-sm btn-outline-danger" id="myRbtn" value="삭제"/>
						</td>
					</tr>
				<tbody>
			</table>
			
				
		</div>
		<div class=""></div>		
		<div class=""></div>
	</div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>