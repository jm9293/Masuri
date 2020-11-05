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
         *{
            font-family: 'Noto Sans KR', sans-serif;
         
         }

         .content{
         	margin-top: 20px;
           height: 650px;
           display: inline-block;
          
           text-align: center;
         }
         
        #infoSize{
          margin-top: 40px;
          text-align: center;
          display: inline-block;
          background-color: white;
          height: 550px;
          width: 400px;
        }

        .m{
          display: inline-block;
          margin: 0px 0px 0px;
          height: 650px;
        }
	
        img{

              margin-top : 30px;
            width: 170px;
            height: 170px;

        }
    
        .into{
          margin: 10px;
          
        }

        .title{
          text-align: left;
          font-style: bold;
          margin: 15px;
        }

        .bnt{
          margin: 40px;
          text-align: right;
        }

        .intro{
          font-size: small;
        }
	
		#empty{
			display:inline-block;
		
		}

  
        </style>
    </head>
    <body>
      <!--네비바 시작-->
      <div id="navbar-wrap">
  <%@ include file="../navbar.jsp" %>
      </div>
      <!--네비바 끝-->

	<c:choose>
		<c:when test="${chk==1}">
			<script type="text/javascript">location.href='login'
			alert("세션만료")</script>
		</c:when>
	</c:choose>


      <!--메인 컨텐트 영역-->
     <div class="content col-12">

      <div class="col-sm-5" id="infoSize">
        <div>
        <img src="<%=request.getContextPath()%>/enimg/${id}.jpg" alt="..." class="rounded-circle">
      </div>
        <div class="info col-10">
        <div class="title">ID  
          <div class="intro">   
            ${id}
          </div>
        </div>
      </div>
        <div class="info col-10">
        <div class="title">이름 
          <div class="intro">   
              ${name}
            </div>
        </div>
      </div>

      <div class="info col-10">
        <div class="title">
          담당지역	
          <div class="intro">   
          ${area}
          </div>
        </div>
        
      </div>

      <div  class="info col-10">
       <div class="title"> 
         내 소개
         <div class="intro">        
           ${intro}
          </div>
        </div>
      </div>

      <div class="bnt col-10">
      <form action="change.info" method="post" name="re">
      	<input type="hidden" value="" name = "p">
        <input type="submit" class="btn btn-primary" value="수정" id="change">
      </form>
      </div>


      </div>

    </div>
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
  $("#change").click(function(){
    $(this).css("display","none")
    var frm = $("form[name=re]")
    frm.append("<input type='hidden' value='10' name='state'>")

  })
</script>

</html>
