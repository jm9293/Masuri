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
        <link rel="stylesheet" href="../CSS/basic.css">
         <!--jquery 3.3.1 ë¶ë¬ì¤ê¸°-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- íì´ì§ css -->
         <style> 

          *{
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
          }

          .yellow{

            display: inline-block;
            margin: 25px;
            width: 200px;
            text-align: center;
            height: 200px;
            background-color: hsl(61, 100%, 73%);
            box-shadow: 5px 5px 5px 5px rgb(163, 160, 160);

          }

          .enter2{
            font-size: x-large;
            margin: 30px;
            text-align: left;
            font-style: italic;
          }
          

          .content{
            
            text-align: center;
         
          }

          .weekSchedule{
            height: auto;
            display: inline-block;
         
          }
          #select{
            font-size: 20px;
            font-style: bold;
            text-align: left;
          }

          .m{
            margin-top: 20px;
          }
          
          h2{
            text-align: left;
            margin: 7px;
            margin-top: 20px;
          }

     
     
      	 @media (max-width: 950px) { 
          	
          	.yellow{
          		width:170px;
          		height:170px;
          		margin:20px;
          		margin-top:40px;
          	}
       
           }
           
           @media (max-width: 768px) {
           	
           .yellow{
          		width:120px;
          		height:120px;
          		margin:15px;
          		margin-top:50px;
          	}
       
            }
            
         @media (max-width: 576px) { 
            
           .yellow{
          		width:350px;
          		height:60px;
          		margin-top:30px;
          	}
          	
          	.enter2{
          		margin:5px;
          	
          	}
          }        


          
        </style>
    </head>

    <body>

		<div class="content">
     <div class="weekSchedule col-11">
       <h2>${date}</h2>
       <div class ="memo">
      <c:forEach var ="t" items="${time}">
          <div class="yellow"><div class="enter2">${t}</div></div>
        </c:forEach>
      </div>
      <!-- 받았음ㄴ ! -->
    
    </div>
    </div>
    </body>


    <script>
     var day = ""
   
    $(".yellow").click(function(){

      day = $(this).text();
      
      var form = $('<form></form>')
    
      form.attr("action","selected.do")
      form.attr("method","post")

      form.appendTo("body")

      var time = $('<input type="hidden" name="register" value='+day+'>')
      var date = $('<input type="hidden" name="selDate" value="'+$("h2").text()+'">')
      form.append(time)
      form.append(date)
	
      form.submit()   
      
    })

   </script>
    


    <!--js ë¶ë¬ì¤ê¸°->
    <!--bootstrap jsìì 4.3.1 ë¶ë¬ì¤ê¸°-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</html>
