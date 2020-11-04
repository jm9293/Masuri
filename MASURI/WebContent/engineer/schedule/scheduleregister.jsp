<%@page import="java.util.ArrayList"%>
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

         #mon{
            width: 70px;
            height: 70px;
            margin-left: 70px;
            margin-bottom: 20px;
            font-size: xx-large;
         }

          .content{
            text-align: center;
            margin-top: 50px;
            
            margin-bottom:50px;
           
          }

          #calendar{
          	width: 1000px;
            height: auto;
            margin-left:16.6667%;
            text-align: center;
     
           

          }

          .daily{
            width: 130px;
            height: 40px;
            margin-left: 2px;
            position: relative;
            display: inline-block;
          }


          .calendarDay{
            width: 130px;
            height: 120px;
            margin-left: 2px;
            border: 1px solid gray;
            display: inline-block;
            
          }

          .form-bnt{
            margin-top: 30px;
            width: 100px;
            height: 50px;

          }
          
          @media (max-width: 992px) { 
          	
          	.daily, .calendarDay{
              width: 100px;
              height: 100px;
          	}
          	
          	#calendar{
          		width: 800px;	
          		margin-left:6%;
          	}
          
           }
           
           @media (max-width: 768px) {
           	
           	.daily, .calendarDay{
              width: 70px;
              height: 70px;
          	}
          	
          	#calendar{
          		width: 600px;	
          		margin-left:3%;
          	}
           	
            }
            
            @media (max-width: 576px) { 
            
           .daily, .calendarDay{
              width: 50px;
              height: 50px;
          	}
          	
          	#calendar{
          		width: 400px;	
          		margin-left:6%;
          	}
           	
            }          	
            
            
        </style>
    </head>

   
    <body>
   
   
      <!--ë¤ë¹ë° ìì-->
      <div id="navbar-wrap"></div>
		<%@ include file="../navbar.jsp" %>
      <!--ë¤ë¹ë° ë-->
		<c:choose>
		<c:when test="${chk==1}">
			<script type="text/javascript">location.href='login'</script>
		</c:when>
		</c:choose>
		
		
		<c:choose>
		<c:when test="${retry==3}">
			<script type="text/javascript">alert("재신청해주세요")</script>
		</c:when>
		</c:choose>
		
      <!--ë©ì¸ ì»¨íí¸ ìì­-->
      <div class="content">
        <div id= "calendar">
          	<div id="mon">${mon}月</div>
          
            <div class="daily">일</div>
            <div class="daily">월</div>
            <div class="daily">화</div>
            <div class="daily">수</div>
            <div class="daily">목</div>
            <div class="daily">금</div>
            <div class="daily">토</div>
			<c:forEach var="dd" items="${date}">
				<div class="calendarDay" onclick="">${dd}</div>		
			</c:forEach>	
					
      
      <div class="form-bnt">
        
        <form action="schedule.do" method="post" id ="forms">
          <input type ="hidden" value="${year}" name = "year">
          <input type = "hidden" value= "${mon}" name = "mon">
          <input type="submit" class="btn btn-primary mb-2" value="신청" name="regist">
        </form>
        
      </div>
    </div>
      </div>
      <!--ë©ì¸ ì»¨íí¸ ë-->

      <!--í¸í° ìì-->
<!--  <div id="footer-wrap"></div>
     
   -->
    </body>
    


    <!--js ë¶ë¬ì¤ê¸°->
    <!--bootstrap jsìì 4.3.1 ë¶ë¬ì¤ê¸°-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script>
    
 	  var rest = ""

		$('.calendarDay').click(function(){

	    this.style.backgroundColor = 'gray';
			rest += $(this).text()+",";
      
      $("#forms").append("<input type='hidden' name ='rest'>")
      $("input[name=rest]").attr("value",rest)
      

	})
	

  var cal = $('.calendarDay').toArray()
  var dd =  new Date()
  
  for(var i = 0; i<cal.length; i++){
    var test = $(cal[i])

    if(test.text()!=null&&test.text()!=""&&test.text()!="off"){
      dd.setDate(test.text())
      if(dd.getDay()==0){
        $(cal[i]).css("color","red")
      }

      if(dd.getDay()==6){
        $(cal[i]).css("color","blue")
      }


    }
  }
		


</script>

</html>
