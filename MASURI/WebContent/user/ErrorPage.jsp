<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap 4.3.1 css요소 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"crossorigin="anonymous">
<!-- 기본 폰트 구글 Noto Sans 굵기 400,500,900 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 페이지 css -->
<link rel="stylesheet" href="ErrorPage.css">
<title>MASURI</title>
</head>
<body>
	<div class="container col-10 col-md-8">
		<div class="textbox col-12">
			<p id="text1">[Access Denied]<br>잘못된 접근 방식입니다.</p>
			<p id="text2">하단 버튼을 눌러 이전 페이지로 이동합니다.</p>
		</div>
		<div class="backbtn col-12">
			<button type="button" onclick="goToBack()"></button>
		</div>
	</div>
</body>
<script>
	function goToBack() {
		history.back();
	}
</script>
</html>