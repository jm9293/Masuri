<%@page import="com.masuri.dto.EngineerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
EngineerDTO eng = (EngineerDTO)request.getAttribute("dto");
int daycnt = (int)request.getAttribute("daycnt");

%>
<!doctype html>
    <html lang="ko">
      <head>
        <title>MASURI Engineer</title>
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
         *{
            font-family: 'Noto Sans KR', sans-serif;
         	box-sizing: border-box;
         }

         .content2{
            text-align: center;
            margin-bottom: 10%;
         }
            
         .row{
           margin-top: 4%;
           text-align: center;
         }
        
	     .weather-box{
	        font-size: x-large;
	        margin-bottom: 10%;
	     }
  
  		 img{    
            width: 20vw;
            height: 20vw;
            margin: 3% auto;
            display: block;
            border-radius: 50%;
  		 }
  		 
  		 b{
			color: rgb(52, 152, 219);
			font-weight: normal;
		}
		</style>
    </head>
    <body>
      <!--네비바 시작-->
      <div id="navbar-wrap">
  <%@ include file="navbar.jsp" %>
      </div>
      <!--네비바 끝-->

	<c:choose>
		<c:when test="${chk==1}">
			<script type="text/javascript">location.href='login'</script>
		</c:when>
	</c:choose>


      <!--메인 컨텐트 영역-->
      <div class="row">
     <div class="col-12 col-md-6 content2">
		  <img src="../engimg/<%=eng.getId() %>.jpg" alt="" id="img">
		  <div class="container">
		    <h1 class="display-4">환영합니다. <%=eng.getName()%> 엔지니어님!</h1><br>
		    <%if(daycnt > 0){ %>
		    <p class="lead">오늘의 수리신청건은 <%=daycnt%>건 입니다. 좋은하루되세요.</p>
		     <%}else{ %>
		      <p class="lead">오늘 수리신청건은 없습니다. 좋은하루되세요.</p>
		     <%} %>
		  </div>
			
      </div>
		<div class="col-12 col-md-6">
		  <h1>오늘의 날씨</h1>
		  <b>출장이나 외출시 참고하세요.</b>
          <div class="weather-box">
            <img id="weatherimg" class="" style="height: 100%" src="" alt="" />
            <div class="weathertxt">
              <div>날씨정보</div>
            </div>
          </div>
        </div>
      </div>

    </body>

    <!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
    <script src="weatherList.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>

