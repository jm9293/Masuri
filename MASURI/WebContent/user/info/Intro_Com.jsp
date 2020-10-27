<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="../basic/CSS/basic.css">
        <link rel="stylesheet" href="Intro_Com.css?after">
         <!--jquery 3.3.1 불러오기-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- 페이지 css -->
         <style>
        </style>
    </head>
    
    <body>
      <!--네비바 시작-->
      <div id="navbar-wrap">
   		<%@ include file="../basic/navbar.jsp" %>
      </div> 
      <!--네비바 끝-->

      <!--메인 컨텐트 영역-->
      <div class="content col-12 col-md-8">
        <!--소개 이미지1-->
        <div class="col-12 col-md-6 intro_img">
        </div>
        <!-- 소개글 -->
        <div class="col-12 col-md-6 intro_text">
          <br>
          <h2>업체 소개</h2><br>
          - 서비스 전문 엔지니어가 고객님이 원하는 장소로 신속히 방문하여,제품을 점검하고 수리하는 서비스입니다.<br>
          - 매장 방문을 통해서도 제품을 점검하고 수리 받을 수 있습니다.<br>
          - 휴대폰 수리 시 센터 방문 시간을 사전예약 후 방문하면 기다림 없이 서비스를 받을 수 있습니다.<br>
          - 사용하지 않거나 오래된 휴대전화를 판매 하실 수 있습니다.<br>
        </div>
        <!-- 연혁 -->
        <div class="col-12 col-md-6 intro_text2">
          <br>
          <h2>업체 연혁</h2><br>
          - 서비스 전문 엔지니어가 고객님이 원하는 장소로 신속히 방문하여, 제품을 점검하고 수리하는 서비스입니다.<br>
          - 매장 방문을 통해서도 제품을 점검하고 수리 받을 수 있습니다.<br>
          - 휴대폰 수리 시 센터 방문 시간을 사전예약 후 방문하면 기다림 없이 서비스를 받을 수 있습니다.<br>
          - 사용하지 않거나 오래된 휴대전화를 판매 하실 수 있습니다.<br>
        </div>
        <!--소개 이미지2-->
        <div class="col-12 col-md-6 intro_img2">
        </div>
      </div>
      <!--메인 컨텐트 끝-->

      <!--푸터 시작-->
      <div id="footer-wrap"></div>
        <script>
        $("#footer-wrap").load("../basic/footer.html");
        </script>
        <!--푸터 끝-->    
    </body>

    <!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>