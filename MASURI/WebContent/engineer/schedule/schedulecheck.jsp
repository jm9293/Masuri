
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
    <html lang="ko">
      <head>
        <title>기사 스케줄 확인</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- bootstrap 4.3.1 cssìì -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- ê¸°ë³¸ í°í¸ êµ¬ê¸ Noto Sans êµµê¸° 400,500,900 -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
        <!-- ê¸°ë³¸ css -->
        <link rel="stylesheet" href="CSS/basic.css">
         <!--jquery 3.3.1 ë¶ë¬ì¤ê¸°-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- íì´ì§ css -->
         <style> 

        *{
            font-family: 'Noto Sans KR', sans-serif;
         
         }

          .content{
            text-align: center;
          
            height: 650px;
            
          
          }
 

          .week{

            display: inline-block;
            width: 150px;
            height: 180px;
            margin: 4px;
            background-color: white;
          }

          .enter{
            font-size: x-large;
            margin: 10px;
            text-align: left;
          }

          hr{
            background-color: black;
          }

          .select{
            
            font-size: 20px;
            font-style: bold;
            height: 370px;
   
          }

          .weekSchedule{
            height: 500px;
            display: inline-block;
          
          }

         

          .paper {

          
          background-color: rgb(253, 252, 252);

          background-image: -webkit-linear-gradient(hsla(0,0%,0%,.025),
                  hsla(0,0%,100%,.05) 33%,
                  hsla(0,0%,0%,.05) 33%,
                  hsla(0,0%,100%,.05) 67%,
                  hsla(0,0%,0%,.05) 67%,
                  hsla(0,0%,100%,.025));

          box-shadow: inset 0 0 0 .1em hsla(0,0%,0%,.2),
                  inset 0 0 1em rgba(78, 59, 59, 0.1),
                  0 .1em .25em hsla(0,0%,0%,.5);

          position: relative;
		    	margin : 4px;
          }


          .paper:after,
          .paper:before {

              bottom: .1em;
              box-shadow: 0 0 .5em .5em hsla(0,0%,0%,.25);
              height: 3em;
              margin : 4px;
              position: absolute;
              width: 80%;
              z-index: -1;
          }

          .paper:after {
              right: 1em;
              -webkit-transform: rotate(3deg);
              -webkit-transform-origin: 100% 100%;
          }

          .paper:before {
              left: 1em;
              -webkit-transform: rotate(-3deg);
              -webkit-transform-origin: 0% 100%;
          }


        .click{

          font-style: bold;
          font-size: x-large;
          height: 60px;
          margin-top: -40px;
       
        }

        @media (max-width: 1150px) { 
          	
          	.paper,.week{
              width: 850px;
              height: 80px;
              margin-left: 6%;
          	}
          	
 			
          
           }
      	 @media (max-width: 950px) { 
          	
          	.paper,.week{
              width: 600px;
              height: 80px;
              margin-left: 6%;
          	}
       
           }
           
           @media (max-width: 768px) {
           	
           	.paper,.week{
              width: 500px;
              height: 70px;
              margin-bottom:30px
              margin-left: 6%;
          	}

         
            }
            
         @media (max-width: 576px) { 
            
           .paper,.week{
              width: 400px;
              height: 60px;
              margin-bottom:30px
              margin-left: 6%;
          	}
           }        


        </style>
    </head>

   
    <body>
      <!--ë¤ë¹ë° ìì-->
      <div id="navbar-wrap"></div>
		<%@ include file="../navbar.jsp" %>
      <!--ë¤ë¹ë° ë-->

      <!--ë©ì¸ ì»¨íí¸ ìì­-->
      <div class="content col-12">
	
	<c:choose>
		<c:when test="${chk==1}">
			<script type="text/javascript">location.href='login'
				alert("세션만료")</script>
		</c:when>
  </c:choose>

    <div class="weekSchedule ">
      <div class="select ">        
        <%@ include file = "check.jsp" %>
      </div>
      
      <div class="click">
        근무일자를 선택하세요
      </div>
			<c:forEach var="dd" items="${week}" begin="0" end="6">
            <div class="paper week" id="weekend">
             <div class="enter">
              ${dd}
            </div>
            </div>            
			</c:forEach>
      </div>
  

  
      </div>

    </body>
    


    <!--js ë¶ë¬ì¤ê¸°->
    <!--bootstrap jsìì 4.3.1 ë¶ë¬ì¤ê¸°-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script>

    var day = ""
    $('.week').click(function(){
     
      day = $(this).text();
      
      var form = $('<form></form>')
      form.attr("action","schedulecheck.do")
      form.attr("method","post")
      form.appendTo("body")

      var date = $('<input type="hidden" name="selected" value='+day+'>')
      form.append(date)

      form.submit()

    })


</script>

</html>
