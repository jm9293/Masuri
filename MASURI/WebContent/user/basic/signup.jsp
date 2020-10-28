<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
    <html lang="ko">
      <head>
        <title>MASURI</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- bootstrap 4.3.1 css요소 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- 기본 폰트 구글 Noto Sans 굵기 400,500,900 -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
        <!-- 기본 css -->
        <link rel="stylesheet" href="CSS/basic.css">
         <!--jquery 3.3.1 불러오기-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- 페이지 css -->
         <style> 
          .login-box{
            margin: 10% auto;

          }
          .input-box{
              margin: 2% 0;
          }
          
          .title b{
          	font-weight: 300;
          	color: rgb(52, 152, 219);
          }       
          
          .email .row{
        	padding : 0px;
        	margin : 0px;
          }
          
          .email .at{
        	text-align: center;
        	line-height:28px ;
        	padding :0px;
          }
        </style>
    </head>
    
   
    <body>
      <!--네비바 시작-->
      <div id="navbar-wrap">
       <%@ include file="navbar.jsp" %>
      </div>
      <%if(logincheck){%>
    	   <script>
    	   alert('로그인중이시면  이용하실수 없습니다.')
    	   location.href='/MASURI/';
    	   </script>
       <%return;}%>
        
      <!--네비바 끝-->

      <!--메인 컨텐트 영역-->
      <div class="content">
       <div class="login-box col-12 col-md-6">
           <div class="title col-12 text-center">
               <h1>회원가입</h1>
               <b>고객님의 개인정보는 소중히 보관됩니다.</b>
            </div>
        

        <form action="login/signup.do" method="get">
            <div class="form-group">
                <div class="input-box col-12 col-md-12">
                  <label for="inputID" class="">아이디</label>
                  <input type="text" class="form-control is-valid" id="inputID" name="inputID" placeholder="" required>
                <div class="valid-feedback">
                                 중복확인을 해주세요.
      			</div>   
                </div>
                <div class="input-box col-12 col-md-12">
                  <label for="inputPW" class="">비밀번호</label>
                  <input type="password" class="form-control" name="inputPW" id="inputPW" placeholder="" required>
                </div>
                
                <div class="input-box col-12 col-md-12">
                  <label for="inputPWCHK" class="">비밀번호 확인</label>
                  <input type="password" class="form-control" name="inputPWCHK" id="inputPWCHK" placeholder="" required>
                </div>
                
                <div class="input-box col-12 col-md-12">
                  <label for="inputNAME" class="">이름</label>
                  <input type="text" class="form-control" name="inputNAME" id="inputNAME" placeholder="" required>
                </div>
                
                <div class="input-box col-12 col-md-12">
                  <label for="inputPhone" class="">전화번호</label>
                  <input type="text" class="form-control" name="inputPhone" id="inputPhone" placeholder="" required>
                </div>
                
                <div class="input-box col-12 col-md-12 email">
                  <label for="inputEmail" class="">이메일</label>
	                <div class="row col-12">
	                  <input type="text" class="form-control col-5" name="inputEmail" id="inputEmail" placeholder="" required>
	                  <div class="col-1 at">@</div>
	                  <select class="custom-select col-6" id="emailSelect"  name="emailSelect">
					    <option selected>gmail.com</option>
					    <option value="1">naver.com</option>
					    <option value="2">daum.net</option>
					    <option value="3">nate.com</option>
					    <option value="4">직접 입력</option>
					  </select>
					  <input type="text" class="form-control col-6" name="inputEmail" id="emaildirect" placeholder="">
	                </div>
                </div>
     			<br>
                <div class="input-box col-12 col-md-12">
                  <button class="login-btn btn btn-primary col-12" type="submit">회원가입</button>
                </div>
            </div>
        </form>
       </div> 
       
      </div>
      <!--메인 컨텐트 끝-->

      <!--푸터 시작-->
      <div id="footer-wrap"></div>
        <script>
        $("#footer-wrap").load("footer.html");
        </script>
        <!--푸터 끝-->    
    </body>

    <!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script>

	$(function(){
	$("#emaildirect").hide();
	$("#emailSelect").change(function() {
			if($("#emailSelect").val() == 4) {
				$("#emailSelect").hide();
				$("#emaildirect").show();
			}
		}) 
	});
	
	</script>
</html>
