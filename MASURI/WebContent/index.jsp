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
        <!-- 페이지 css -->
        <style>
          .loginmodal modal-header{
            text-align: center;
            align-items: center;
          }
          
          .modal {
            text-align: center;
          }
          
          .info-content{
            position: relative;
            display: block;
            width: 100%;   
            height: 39vw;
            overflow: hidden;
          }
          
          .qiuck-info >div{
            display: block;
            position: absolute;
            top: 5%;
            left: 5%;
            
          }
          
          .qiuck-info img{
            display: block;
            height: auto;  
            max-width: 100%;
            width: 100%; 
          }

          .qiuck-info h1{
            position: relative;
            color: white;
            font-size: 60px;
            text-shadow: 1px 1px 1px black;
          }
          
          .qiuck-info h3{
            position: relative;
            top: 0px;
            left: 0px;
            color: white;
            font-size: 30px;
            text-shadow: 1px 1px 1px black;
          }
          
          .qiuck-info button{
            position: relative;
            top: 0px;
            left: 0px;
            font-size: 20px;
          }

          .qiuck-info-black h1,.qiuck-info-black h3{
            color: black;
            text-shadow: none;
          }
          
          
          @media (max-width: 767px) {
            .qiuck-info h1{
              font-size: 25px;
            }
            
            .qiuck-info h3{
              font-size: 13px;
            }
            
            .qiuck-info button{
              font-size: 16px;
            }

            footer p{
            font-size: 10px; 
            }
          }

          @media (max-width: 360px) {
            .qiuck-info h1{
              font-size: 16px;
            }
            
            .qiuck-info h3{
              font-size: 3px;
            }
            
            .qiuck-info button{
              font-size: 3px;
            }

            footer p{
            font-size: 1px; 
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
                      <a class="dropdown-item" href="#">출장수리 안내</a>
                      <a class="dropdown-item" href="user/res/res1.jsp">출장수리 예약</a>
                      <a class="dropdown-item" href="user/res/res_chk1.do">예약 확인</a>
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      방문수리
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">방문수리 안내</a>
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

             <!--방문수리 인포-->
              <div class="info-content qiuck-info">
                <img src="user/img/3.jpg" alt="">
                <div>
                  <h1>편안하게<br>수리받으세요</h1>
                  <h3>엔지이어가 고객님께 찾아갑니다.</h3>
                  <button type="" class="btn btn-primary"> 출장수리 예약하기</button>
                </div>
              </div>
          
              
              <!--방문수리 인포-->
              <div class="info-content qiuck-info">
                <img src="user/img/1.jpg" alt="">
                <div>
                  <h1>확실하게<br>수리받으세요</h1>
                  <h3>숙련된 엔지니어가 직접 수리합니다.</h3>
                  <button type="" class="btn btn-primary"> 방문수리 예약하기</button>
                </div>
              </div>

              <!--에코폰 매입 인포-->
              <div class="info-content qiuck-info qiuck-info-black">
                <img src="user/img/4.png" alt="">
                <div>
                  <h1>정든내폰<br>이젠 보내주세요</h1>
                  <h3>업계 최고가로 매입합니다.</h3>
                  <button type="" class="btn btn-primary"> 에코폰 매입 알아보기</button>
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
