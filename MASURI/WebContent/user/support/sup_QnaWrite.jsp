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
<link rel="stylesheet" href="sup_QnaWrite.css">
<script src="sup_QnaWrite.js"></script>
<%
	int result = (int)request.getAttribute("result");
	int pageNum = 0;
	if(result == 0){
%>
	<script>
		location.href="../ErrorPage.do";
	</script>
<%	return;
	}else{
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
<%
	if(!logincheck){%>
	
	<script>
	alert('로그인후 이용하실수 있습니다.');
	location.href='/MASURI/user/basic/login.jsp';
    </script>
	
<%		
	}
%>
	<!--네비바 끝-->
	
	<!--메인 컨텐트 영역-->
	<div class="content">
		<div class="col-12 col-md-8 head"><h2>Q&A 상담게시판</h2></div>
		<br>
		<div class="col-12 col-md-8 contain">
		<form name="frm" action="sup_QnaWriteOk.do" method="post" onsubmit="return chkSubmit()">
			<input type="hidden" name="page" value="<%=pageNum %>"/>
			<div class="form-group col-12">
				<label for="userid">작성자</label> 
				<div><%= userID %></div>
				<input type="hidden" name="userID" value="<%=userID %>"/>
			</div>
			<div class="form-group col-12">
				<label for="title">제목</label> 
				<input type="text" class="form-control" id="title" name="title" maxlength="30"/>
			</div>
			<div class="form-group col-12">
				<label for="content">내용</label> 
				<textArea class="form-control" id="content" name="content" rows="10"></textArea>
			</div>
			<div class="form-group form-check open">
				<input type="checkbox" class="form-check-input" id="open" name="open"/>
				<label class="form-check-label" for="open">비공개</label>
			</div>
			<div class="btn row col-12">
			<button type="submit" class="btn btn-primary">작성</button>
			<button type="button" class="btn btn-dark" onclick="location.href='/MASURI/user/support/sup_Qna.do?page=<%= pageNum%>'">목록으로</button>
			</div>
			<br><br>
		</form>
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