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
         <!--jquery 3.3.1 불러오기-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- 페이지 css -->
         <link rel="stylesheet" href="Intro_Map.css">
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
      <div class="content">
          <h2 class="display-6">오시는길</h2>
          <button class="btn btn-warning" type="button" id="kakao" onclick="openMap()">카카오맵으로 검색</button>
        <div class="map_wrap">
            <div id="mapWrapper">
                <div id="map"></div> <!-- 지도를 표시할 div 입니다 -->
                <h2><span class="badge badge-pill badge-dark span-txt">지도 view</span></h2>
            </div>
            <div id="rvWrapper">
                <div id="roadview"></div> <!-- 로드뷰를 표시할 div 입니다 -->
                <h2><span class="badge badge-pill badge-dark span-txt">로드 view</span></h2>
            </div>
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12cf41907ec9dfc03f51fa4ea3287959"></script>
    <script src="Intro_KakaoMap.js"></script>
</html>
