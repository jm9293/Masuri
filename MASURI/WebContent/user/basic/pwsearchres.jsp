<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 

 int res = (int)request.getAttribute("res");
 if(res==0){%>
	 <script>
	    alert('일치하는 정보를 찾을수 없습니다.\n 다시시도해주세요');
	    history.back();
    </script> 
    
 <%return;}
 
 %>
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
            margin: 5% auto;

          }
          .input-box{
              margin: 2% 0;
          }
          
          
          
          .row{
          	padding: 0;
          	text-align: center;
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
       <div class="login-box col-12 col-md-4">
           <div class="title col-12 text-center">
               <h1>임시비밀번호 발급완료</h1>
               	회원정보에 있는 이메일주소로 임시비밀번호를 발급했습니다.<br>
               	<b>로그인후 비밀번호를 변경해주세요.</b>
            </div>
        

        	<br>
            <div class="form-group">
                <div class="input-box col-12 col-md-12">
       
                  <div class="input-box col-12 col-md-12 row" style="">
	                 <div class="col-12"><a href="login.jsp">로그인</a></div>
	              </div>
                </div>
            </div>
        
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

</html>
