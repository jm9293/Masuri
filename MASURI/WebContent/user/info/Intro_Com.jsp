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
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
		<h2>MASURI COMPANY</h2>
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active imgbox">
					<div class="wrap"><img src="../img/회사소개1.jpg"></div>
					<div class="over"></div>
					<div class="over2">
					<p id="p1">최고의 기술력과 최선의 서비스를 제공하는<br> MASURI Company 입니다.</p><br>
					<p class="p2">MASURI Company 는 국내 최고의 기술자들이 모여 설립한 <br>
						휴대폰 전문 수리 업체입니다.</p>
					<p class="p2">대기업 출신의 기술자들이 제공하는 업계 최고의 기술력과 제조사 부품 직접거래로<br>
						안심하고 믿고 맡기실 수 있습니다.</p>
					</div>
				</div>
				<div class="carousel-item imgbox">
					<div class="wrap"><img src="../img/회사소개2.jpg"></div>
					<div class="over"></div>
					<div class="over2">
					<p id="p1">국내 최고의 기술자 보유로 <br>다수의 기종 수리가 가능합니다.</p><br>
					<p class="p2">MASURI Comapny는 제조사와 부품 직접 거래로 비용절감을 통해</p>
					<p class="p2">고객님들께 부담을 최소화 하고 세계적인 수준의 기술력을 가진</p>
					<p class="p2">기술자분들이 근무하여 직접수리를 통해</p>
					<p class="p2">국내 유통 되고있는 휴대폰 다수 기종이 수리 가능한 업체 입니다.</p>
					</div>
				</div>
				<div class="carousel-item imgbox">
					<div class="wrap"><img src="../img/회사소개3.png"></div>
					<div class="over"></div>
					<div class="over2">
					<p id="p1">For the Best! Do the Best!</p><br>
					<p class="p2">MASURI Company는 항상 최고를 위해 </p>
					<p class="p2">고객님들께 최선을 다하고 있습니다.</p>
					<p class="p2">업계 단독 최초로 방문이 어려우신 고객님들을 위해</p> 
					<p class="p2">출장 기사 시스템을 도입하였으며</p>
					<p class="p2">예약 및 문의를 통해 이용 하실 수 있습니다.</p>
					<p class="p2">항상 고객님들께 최고가 되기 위해 최선을 다하는 </p>
					<p class="p2">MASURI Company가 되겠습니다.</p>
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
	<br><br>
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
