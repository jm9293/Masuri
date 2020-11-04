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
        <link rel="stylesheet" href="CSS/basic.css">
         <!--jquery 3.3.1 불러오기-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/4.4.1/jquery.min.js"></script>
         <!-- 페이지 css -->
         <style> 
         
         *{
            font-family: 'Noto Sans KR', sans-serif;
         
         }
         
          .content{
            text-align: center;
            margin-top: 150px;
            margin-bottom: 150px;
           
          }

          .intro{
            margin: 30px;
            font-size: smaller;
            color: rgb(117, 117, 117);
          }

          .form-group{
            text-align: left;
            
          }

          .form-group > label{
            font-size: medium;
            margin: 5px;
          }

          .btn{
            margin-top: 15px;
            
          }

          .head{
            color: rgb(52, 152, 219);
            font-size: 70px;
          }

        </style>
    </head>
    
   
    <body>
      <!--네비바 시작-->
      <div id="navbar-wrap"></div>
     
      <!--네비바 끝-->

      <!--메인 컨텐트 영역-->
      <div class="content col-sm-12">
        <div class="offset-md-4 fom col-sm-4 container-lg container-md">
          <div class="head">
            MASURI
          </div>

            <div class="intro">Engineer Page</div>
          
          
          <form action="alert"  method="POST">
            <div class="form-group">
              <label for="exampleInputEmail1">ID</label>
              <input class="form-control" type="text" name="id">
              
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">PW</label>
              <input type="password" class="form-control" id="exampleInputPassword1" name= "pw">
            </div>
            
            <input type="submit" class="btn btn-secondary col-12" value="LOGIN">
          </form>

          <div class="intro">
            계정정보 분실시 관리자에게 문의하세요
          </div>
        </div>
        
        <c:choose>
        
        </c:choose>
        
      </div>
      <!--메인 컨텐트 끝-->

      <!--푸터 시작-->
      <div id="footer-wrap"></div>

        <!--푸터 끝-->    
    </body>

    <!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>
