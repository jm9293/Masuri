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
        
         <!--jquery 3.3.1 불러오기-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- 페이지 css -->
         <style> 
         *{
            font-family: 'Noto Sans KR', sans-serif;
         
         }
         
         h4{
         	margin-top:8px;
         }

         .content{
         	margin-top: 20px;
           height: 650px;
           display: inline-block;
           background-color: rgb(190, 180, 180);
           text-align: center;
         }
         
        #infoSize{
         
          text-align: center;
          display: inline-block;
          background-color: white;
          height: 620px;
		  width: 400px;
		  box-shadow: 5px 5px 5px 5px rgb(163, 160, 160);
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
          margin: 20px;
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
			<script type="text/javascript">location.href='login'</script>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${off==1}">
			<script type="text/javascript">location.href='schedulecheck.do'
				alert("신청서가 없습니다")
			</script>
		</c:when>
	</c:choose>


      <!--메인 컨텐트 영역-->
     <div class="content col-12">

      <div class="col-sm-7" id="infoSize">
		  <h4>신청서</h4>
        <div class="info col-10">
        <div class="title">신청일자 및 시간
          <div class="intro">   
			${time}
          </div>
        </div>
      </div>
        <div class="info col-10">
        <div class="title">주소
          <div class="intro">   
			${Address}
            </div>
        </div>
      </div>

      <div class="info col-10">
        <div class="title">
			고객아이디
          <div class="intro">   
			${userId}
          </div>
        </div>
        
      </div>

      <div  class="info col-10">
       <div class="title"> 
		담당자
         <div class="intro">        
			${EngId}
          </div>
        </div>
	  </div>
	  
	  <div  class="info col-10">
		<div class="title"> 
			제조사
		  <div class="intro">        
			${Factory }
		   </div>
		 </div>
	   </div>

	   <div  class="info col-10">
		<div class="title"> 
			모델명
		  <div class="intro">        
			${model}
		   </div>
		 </div>
	   </div>

	   <div  class="info col-10">
		<div class="title"> 
			failsit
		  <div class="intro">        
			${Failsit}
		   </div>
		 </div>
	   </div>

	   <div  class="info col-10">
		<div class="title"> 
			failmsg
		  <div class="intro">        
			${Failmsg}
		   </div>
		 </div>
	   </div>

	   <div  class="info col-10">
		<div class="title"> 
			신청상태
		  <div class="intro">        
			${state}
		   </div>
		 </div>
	   </div>


      <div class="bnt col-10">
      <form action="visit.do?no=${No}" method="post" name="re">
        <input type="hidden" value="0" name="visitChk">
        <input type="submit" class="btn btn-primary" value="방문확인" id="reserve">
      </form>
      </div>
      </div>
      
      
	
	
     
     
    </div>

    </body>

    <!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>

<script>
  $("#reserve").click(function(){
     var visit = $("input[name=visitChk]")

     if(visit.val()=="0"){
       visit.val("1")
     }else{
       visit.val("0")
     }
     alert(visit.val())
  })

</script>