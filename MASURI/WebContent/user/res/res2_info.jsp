<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 Calendar cal = Calendar.getInstance();
 cal.add(Calendar.DATE, 1);
 Date date = cal.getTime();
 cal.add(Calendar.DATE, 6);
 Date sevendate = cal.getTime();
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

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
        <link rel="stylesheet" href="../basic/CSS/basic.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
         <!--jquery 3.3.1 불러오기-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
            width: 100%;   
            min-height: 20vw;
            overflow: hidden;
          }

          .info-content2{
            position: relative;
            width: 100%;   
            min-height: 10vw;
            overflow: hidden;
            text-align: center;
            padding: 1%;
           
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

          .info-box{
            min-height: 100px;
            padding: 0px;
            text-align: center;
            padding: 2%;
            border-radius: 30px;
            margin-top: 5%;
           
          }

          .info-content2 h2{
            margin-top: 1%;
            padding-left: 3%;
          }
          
          .box-title{
            font-size: 1.3rem;
            border-radius: 30px;
            background-color: rgb(52, 152, 219);
            color: white;
            padding: 3%;
          }
          .row h2{
            
            color: black;
            padding: 1%;
            
                                              
          }
          .row{
           
            margin: 0px;

          }
          i{
            font-size: 10rem;

          }
         

          .logo{
            color: rgb(52, 152, 219);
            font-size: 100px;
            font-weight: 600;
          }

          .info-content2 h1{
              margin-top: 5%;
            }

          .info-sign{
            margin-bottom: 4%;
            min-height: 20vw;
          }

          @media (max-width: 767px) {
            .qiuck-info h1{
              font-size: 25px;
            }

            .info-content2 h2{
              font-size: 25px;
            }

            i{
              font-size: 100px;
            }

            .box-title{
              font-size: 13px;
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

           
            .info-sign h2{
              font-size: 25px;
            }
            .logo{
              font-size: 60px;
            }
          }

          @media (max-width: 360px) {
            .qiuck-info h1{
              font-size: 16px;
            }

            .info-content2 h2{
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
      
      <div id="navbar-wrap">
       <%@ include file="../basic/navbar.jsp" %>

      </div>
        


      <!--메인 컨텐트 영역-->
      <div class="content">
       <!--방문수리 인포-->
      <div class="info-content qiuck-info">
        <img src="../img/1.jpg" alt="">
        <div>
          <h1>확실하게<br>수리받으세요</h1>
          <h3>숙련된 엔지니어가 직접 수리합니다.</h3>
          <button type="button" class="btn btn-primary" onclick="location.href='res2.jsp'"> 방문수리 예약하기</button>
        </div>
      </div>
  
      
      <!--방문수리 인포-->
      <div class="row info-content2">
        <div class="col-12">
          <h2>방문 수리 절차 안내</h2>
        </div>
        
       <div class="col-12 col-md-4">
        <div class="info-box border">
        <i class="fas fa-edit"></i>
        <br><br>
         <div class="box-title">방문수리예약</div>
        </div>
      </div>
       <div class="col-12 col-md-4">
         <div class="border  info-box">
          <i class="fas fa-door-open"></i>
          <br><br>
           <div class="box-title">센터에 고객님이 직접방문</div>
          </div>
         </div>
        

       <div class="col-12 col-md-4">
        <div class="border  info-box">
        <i class="fas fa-mobile-alt"></i>
        <br><br>
         <div class="box-title">완벽한 수리</div>
      </div>
      </div>
    </div>
        

	<%if(!logincheck){ %>
      <div class="info-content2 info-sign" style="text-align: center;">

        <h1 class="logo">MASURI</h1><br>
        <h3>방문수리 서비스를 누려보세요</h3><br>
        <a href="user/basic/signup.jsp">지금회원가입하러가기</a>


      </div>
   <%} %>
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