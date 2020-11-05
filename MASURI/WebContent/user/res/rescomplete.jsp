<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.masuri.dto.EngineerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
int type = 0;
try{
  type = (int)request.getAttribute("type");

 if((int)request.getAttribute("res")==0){
	 
 %>
	<script>
	location.href = "../ErrorPage.do";
	</script>
 <%	return;	
 }else if((int)request.getAttribute("res")==2){%>
	<script>
	alert("선택하신 엔지니어가 이미 예약이 되었습니다.\n다시 예약해주시기 바랍니다.");
	location.href = 'res<%=type%>.do';
	</script>
	<%	return;	
  }
  
}catch(Exception e){%>
	<script>
	location.href = "../ErrorPage.do";
	</script>
<%}%>
  
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
            margin:0 auto;
            padding-top: 15%; 

          }
          .input-box{
              margin: 2% 0;
          }
          
          .form-control[readonly=""]{
               background-color:white;
               color: black;
          } 

          .title b{
          	font-weight: 300;
          	color: rgb(52, 152, 219);
          }   
          
          .login-btn{
          	margin: 1% auto;
          }
          
          .content{
          	min-height: 745px;
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
	       <div class="main-box col-12 col-md-4">
	           <div class="title col-12 text-center">
	               <h1>예약완료</h1>
	               <b>이용해주셔서 감사합니다.</b><br>
	               
	            </div>
	        
	            <div class="input-box col-12 col-md-12">
	               <button class="login-btn btn btn-primary col-12"  type="button" onclick="location.href='res_chk<%=type %>.do'">예약확인</button>
	              <button class="login-btn btn  btn-secondary col-12"  type="button" onclick="location.href='/MASURI'">홈으로</button>
	              
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