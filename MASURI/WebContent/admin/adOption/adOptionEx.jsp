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
<title>요청사항 설정</title>
</head>
<body>
	<%@ include file="../adNav.jsp" %>
	
	<div class="container">
	
		<h2 style="color:#999; text-align: center">요청사항 설정</h2><br>
		<div class="col-lg-2"></div>
		<div class="input-box col-lg-6">
			<label for="kindPh">폰 기종 선택 : 제조사 / 기기 종류 </label>
			
			<table class="table-striped col-lg-12" style="border:1px solid #ddd">
				<div>
					<input type="text" class="form-control col-8" id="plusOption" name="plusOption" 
					placeholder="옵션 메뉴 등록하기" value=""><br>
					<button class="btn" type="submit">신규 기종 등록하기</button><br><br><br><br>
				</div>
				<tr>
					<td class="col-10">DB에서 가져오는 데이터(기종)</td>	<!-- 등록한 기종들 가져오기 -->
					<td><button class="pull-right">삭제</button></td>
				</tr>
			</table>
			
				
		</div>
		<div class="col-lg-2"></div>		
		<div class="col-lg-2"></div>
	</div>

</body>
</html>