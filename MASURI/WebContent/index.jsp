<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.masuri.user.command.LoginCommand"%>
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
        <!--jquery 3.3.1 불러오기-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- 기본 css -->
        <link rel="stylesheet" href="user/basic/CSS/basic.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
        <!-- 페이지 css -->
        <style>
          .carousel img{
          	height: 745px;
          	min-width: 1500px;
          	
          }
          
          .mobile{
          	position: absolute;
          	color:white;
          	top: 5%;
          	left: 5%;
            text-shadow: 1px 1px 1px black;
            display: none;
          }
          
          .carousel-caption{
          
           text-shadow: 1px 1px 1px black;
          }
          
          
      	  
      	  @media (max-width: 767px) {
            .carousel img{
          	 margin-left: -430px;
          
          	}
          	
          	.content {

			
			}
          	
          	.mobile{
          		display: inline;
          	}
          	.mobile h1{
          		font-size: 3rem;
          	    
          	    
          	}
          }
          
           @media (max-width: 575px) {
            .carousel img{
          	 margin-left: -510px;
          	}
          	.mobile h1{
          		font-size: 2rem;  	    
          	}
          }

          @media (max-width: 360px) {
           .carousel img{
          	 margin-left: -610px;
          	}
          	.mobile h1{
          		font-size: 1.5rem;
          	    
          	    
          	}
          	
          }
        </style>
    </head>
        
    <body>
      <!--네비바 앤 로그인 모달시작-->
      <div id="navbar-wrap">
<%
String userID = (String)request.getSession().getAttribute("login");

boolean logincheck = LoginCommand.Users.containsKey(userID);

if(userID!=null&&!logincheck){
	session.invalidate();
}

%>
 
        <!--네비바 시작-->
         <nav class="navbar navbar-expand-md navbar-light bg-white navbar-u">
            <a class="navbar-brand navbar-logo" href="/MASURI">MASURI</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      출장수리
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="user/res/res1_info.jsp">출장수리 안내</a>
                      <a class="dropdown-item" href="user/res/res1.jsp">출장수리 예약</a>
                      <a class="dropdown-item" href="user/res/res_chk1.do">예약 확인</a>
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      방문수리
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="user/res/res2_info.jsp">방문수리 안내</a>
                        <a class="dropdown-item" href="user/res/res2.jsp">방문수리 예약</a>
                        <a class="dropdown-item" href="user/res/res_chk2.do">예약 확인</a>
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      회사소개
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="user/info/Intro_Com.do">회사 소개</a>
                        <a class="dropdown-item" href="user/info/Intro_Map.do">오시는길</a>
                    </div>
                  </li>

                  <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      고객센터
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="user/support/sup_Notice.do?page=1">공지사항</a>
                        <a class="dropdown-item" href="user/support/sup_FAQ.do">자주 묻는 질문</a>
                        <a class="dropdown-item" href="user/support/sup_Qna.do?page=1">고객 상담 게시판</a>
                    </div>
                  </li>
                  <form class="form-inline">
                  <%
                  if(!logincheck) { 
                  %>
                    <button class="btn btn-outline-primary" type="button" onclick="" data-toggle="modal" data-target="#loginmodal">로그인</button>
                  <%
                  }else{
                  %>
                  	<button class="btn btn-outline-primary" type="button" onclick="" data-toggle="modal" data-target="#loginmodal">
                  	<%=userID %>
                  	</button>
                  <%
                  }
                  %>
                  </form>
              </ul>
            </div>
          </nav>

          
          <!--네비바 끝-->

          <!--로그인모달창 시작-->
          <%if(!logincheck){ %>
          <div class="modal fade loginmodal" tabindex="-1" id="loginmodal">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">로그인하여 서비스를 이용하세요.</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <button type="button" class="btn btn-secondary" onclick="location.href='user/basic/signup.jsp'">회원가입</button>
                  <button type="button" class="btn btn-primary" onclick="location.href='user/basic/login.jsp'">로그인</button>
                </div>
                
              </div>
            </div>
          </div>
          <%}else{ %>
          <div class="modal fade loginmodal" tabindex="-1" id="loginmodal">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">환영합니다.</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <img src="userimg/<%=userID%>.jpg" class="center" alt="">
                  <h3><%=userID%></h3>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" onclick="location.href='user/basic/updateuser.do'">회원정보 수정</button>
                  <button type="button" class="btn btn-primary" onclick="location.href='user/basic/login/logout.do'">로그아웃</button>
                </div>
                
              </div>
            </div>
          </div>
          <!--로그인모달창 끝-->
          <%} %>
       
      </div>
     
      <!--네비바 앤 로그인 끝-->

        <!--메인 컨텐트 영역-->
 <div class="content">
  
      <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel" data-interval="5000"  data-pause="false">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="user/img/1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1>확실하게 수리받으세요</h1>
        <p>숙련된 엔지니어들이 수리합니다.</p>
      </div>
      <div class="mobile"><h1>확실하게 수리받으세요</h1><p>숙련된 엔지니어들이 수리합니다</p></div>
    </div>
    <div class="carousel-item">
      <img src="user/img/2.jpg" class="d-block w-100" alt="...">
     <div class="carousel-caption d-none d-md-block">
        <h1>정밀할수록 신중합니다.</h1>
        <p>대기업 출신 전문가들의 노하우를 느껴보세요</p>
      </div>
      <div class="mobile"><h1>정밀할수록 신중합니다</h1><p>대기업 출신 전문가들의 노하우를 느껴보세요</p></div>
    </div>
    <div class="carousel-item">
      <img src="user/img/3.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1>편안하게 수리받으세요</h1>
        <p>엔지니어들이 직접 고객님께 방문합니다</p>
      </div>
      <div class="mobile"><h1>편안하게 수리받으세요</h1><p>엔지니어들이 직접 고객님께 방문합니다</p></div>
    </div>
     <div class="carousel-item">
      <img src="user/img/4.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1>언제나 새 스마트폰처럼</h1>
        <p>깔끔한 수리를 약속합니다</p>
      </div>
      <div class="mobile"><h1>언제나 새 스마트폰처럼</h1><p>깔끔한 수리를 약속합니다</p></div>
    </div>
  </div>
</div>
    </div>
        <!--메인 컨텐트 끝-->

        <!--푸터 시작-->
        <div id="footer-wrap">
        <footer>
  <div>
    <h1>MASURI</h1>
    <p>© 2020. 전자통신기기 수리업체 마수리. Masuri, Inc. All Rights Reserved.</br>
    사업자등록번호 : 777-77-7777 | 인허가번호 : 2020-8312391-34-67-9882 | 대표이사 : MAGIC KID MA | 전화 : 1588-0000 | 주소 : 서울특별시 역삼역 3번 출구</p>
  </div>
</footer>
        </div>
        
        <!--푸터 끝-->      
    </body>

    <!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>
