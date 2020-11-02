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
         <!--jquery 3.3.1 불러오기-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- 페이지 css -->
         <style> 
          .login-box{
            margin: 10% auto;

          }
          .input-box{
              margin: 2% 0;
          }
          
          #inputADD[readonly=""]{
          	 background-color:white;
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
       <div class="login-box col-12 col-md-6">
           <div class="title col-12 text-center">
               <h1>방문수리예약</h1>
               <h6>숙련된 엔지니어가 직접 수리합니다.</h6>
                <a href="#">방문수리예약 안내</a>
            </div>
        

        <form action="res2.do" method="post">
            <div class="form-group">
                <div class="input-box col-12 col-md-12">
                  <label for="inputDAY" class="">방문수리를 원하시는 날을 선택해주세요</label>
                  <input type="date" class="form-control" id="inputDAY" name="inputDAY" min='<%=sdf.format(date)%>' max='<%=sdf.format(sevendate)%>' placeholder="" required>
                    <div class="invalid-feedback" id="id-invalid">
                      	예약일 1일~7일 전부터 예약할수 있습니다. 
                    </div>  
                </div>
                   
                <div class="input-box col-12 col-md-12">
                  <label for="inputPW" class="">시간을 선택해주세요.</label>
                  <select class="custom-select col-12" id="inputTIME"  name="inputTIME" required>
                        <option selected value="none" disabled hidden>시간을 선택해주세요</option>
					    <option value="1">09:00 ~ 11:00 (오전)</option>
					    <option value="2">13:00 ~ 15:00 (오후 1)</option>
					    <option value="3">16:00 ~ 18:00 (오후 2)</option>
					  </select>
					  <div class="invalid-feedback" id="id-invalid">
                       	 시간을 선택해주세요.
                      </div> 
                </div>

                <div class="input-box col-12 col-md-12">
                  <button class="login-btn btn btn-primary col-12" id="sub-btn" type="submit" disabled>다음으로</button>
                </div>
            </div>
            
        </form>
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
	<script>
		
		
		
		
		$("#inputDAY").change(function(){
            if(new Date($("#inputDAY").val())> new Date()&&new Date($("#inputDAY").val())> new Date()){
                $("#inputDAY").removeClass("is-invalid");
                $("#inputDAY").addClass("is-valid");
            }else{
                $("#inputDAY").removeClass("is-valid");
                $("#inputDAY").addClass("is-invalid");
            }
            validCheck()
        })
		

       

        $("#inputTIME").change(function(){
            if($("#inputTIME").val()!="none"){
                $("#inputTIME").removeClass("is-invalid");
                $("#inputTIME").addClass("is-valid");
            }else{
                $("#inputTIME").removeClass("is-valid");
                $("#inputTIME").addClass("is-invalid");
            }
            validCheck()
        })
        
        
        function validCheck() {
			var chk = $("#inputTIME").hasClass("is-valid")
			&&$("#inputDAY").hasClass("is-valid");
			
			if(chk){
				$("#sub-btn").removeAttr("disabled");
			}else{
				$("#sub-btn").attr("disabled","");
			}
		}
		
	</script>
</html>