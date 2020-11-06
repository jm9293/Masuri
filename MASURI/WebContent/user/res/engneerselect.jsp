<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.masuri.dto.EngineerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 if((int)request.getAttribute("res")==0){
	 
 %>
	<script>
	location.href = "../ErrorPage.do";
	</script>
 <%	return;	
}


 ArrayList<EngineerDTO> list = (ArrayList<EngineerDTO>)request.getAttribute("list");
 if(list.isEmpty()){
	%>
		<script>
		alert("예약가능한 엔지니어가 없습니다.\n다른 시간으로 신청해주세요.");
		history.back();
		</script>
<%return;	
 }
%>
<%
 String inputDay = (String)request.getAttribute("inputDAY");
 
 String inputADD = (String)request.getAttribute("inputADD");
 
 String sggNm = (String)request.getAttribute("sggNm");
 
 Date day =  new SimpleDateFormat("yyyy-MM-dd").parse(inputDay);
 
 int inputTIMEnum = (int)request.getAttribute("inputTIMEnum");
 
 String timestr = "";
 
 switch(inputTIMEnum) {
 	case 1 :
 		timestr = "09:00 ~ 11:00";
 		break;
 	case 2 :
 		timestr = "13:00 ~ 15:00";
 	 	break;
 	case 3 :
 		timestr = "16:00 ~ 18:00";
 	 	break;
 
 }
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
         <!--jquery 3.3.1 불러오기-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- 페이지 css -->
         <style> 
          .main-box{
              margin: auto;
              display: block;
          }
          .card img{
            margin: 5% 0;
            height: 90%;
          }
          .title b{
          	font-weight: 300;
          	color: rgb(52, 152, 219);
          }    
        </style>
    </head>
    
   
    <body>
      
      <div id="navbar-wrap">
       <%@ include file="../basic/navbar.jsp" %>
       <%if(!logincheck){%>
    	   <script>
    	   alert('로그인후 이용하실수 있습니다.')
    	   location.href='/MASURI/user/basic/login.jsp';
    	   </script>
       <%return;}%>
       
      </div>
        


      <!--메인 컨텐트 영역-->
      <div class="content">
       	<div class="main-box col-12 col-md-8">
            <div class="title col-12 text-center">
            	<%if(!inputADD.equals("센터")){ %>
                <h1>엔지니어 선택</h1>
                                     출장일시 : <%=new SimpleDateFormat("yyyy년 M월 d일").format(day)%> <%=timestr%>
                <br>
               	 출장주소 : <%=inputADD %>
                <br>
                <b>고객님이 선택하신 엔지니어가 직접 방문합니다.</b>
                <%}else{ %>
                <h1>엔지니어 선택</h1>
                                     방문일시 : <%=new SimpleDateFormat("yyyy년 M월 d일").format(day)%> <%=timestr%>
                <br>
                <b>고객님이 선택하신 엔지니어가 직접 수리합니다.</b>
                
                <%} %>
             </div>
             <br>
			 
             <div class="eng-box">
             <%for(int i = 0; i < list.size(); i++){%>
                <div class="card col-12 mb-5" style="max-width: 700px; margin: auto;">
                    <div class="row no-gutters">
                      <div class="col-md-4">
                        <img src="../../engimg/<%=list.get(i).getId() %>.jpg" class="card-img" alt="...">
                      </div>
                      <div class="col-md-8">
                        <div class="card-body">
                          <h5 class="card-title"><%=list.get(i).getName() %> 엔지니어</h5>
                          <p class="card-text"><%=list.get(i).getIntro() %></p>
                          <form action="reswrite.do">
                              <input type="hidden" name="engid" value="<%=list.get(i).getId() %>">
                              <input type="hidden" name="inputADD" value="<%=inputADD %>">
                              <input type="hidden" name="inputDAY" value="<%=inputDay %>">
                              <input type="hidden" name="inputTIMEnum" value="<%=inputTIMEnum %>">
                              <input type="hidden" name="sggNm" value="<%=sggNm %>">
                            <button class="btn btn-primary" type="submit">예약하기</button>
                          </form>
                         
                        </div>
                      </div>
                    </div>
                  </div>
			<%}%>
                 
                 
                  
             </div>
             
             
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