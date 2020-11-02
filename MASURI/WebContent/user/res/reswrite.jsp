<%@page import="java.util.HashMap"%>
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
 }else if((int)request.getAttribute("res")==2){%>
	<script>
	alert("선택하신 엔지니어가 이미 예약이 되었습니다.\n다른 엔지니어를 선택해주시기바랍니다.");
	history.back();
	</script>
	<%	return;	
  }%>


<%
 String inputDay = (String)request.getAttribute("inputDAY");
 
 String inputADD = (String)request.getAttribute("inputADD");
 
 String sggNm = (String)request.getAttribute("sggNm");
 
 EngineerDTO eng = (EngineerDTO)request.getAttribute("eng");
 
 HashMap<String, ArrayList<String>> fixlistmap = (HashMap<String, ArrayList<String>>)request.getAttribute("fixlistmap");
 
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
            margin: 10% auto;

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
       <div class="main-box col-12 col-md-6">
           <div class="title col-12 text-center">
               <h1>수리신청서작성</h1>
               
                <b>수리기사에게 전달되는 신청서입니다.</b>
            </div>
        

        <form action="rescomplete.do" method="get">
            <div class="form-group">
            	<%if(!inputADD.equals("센터")){ %>
                <div class="input-box col-12 col-md-12">
                  <label for="inputDAY" class="">출장수리 일시</label>
                  <input type="text" class="form-control" id="inputDAY" name="inputDAY"  value="<%=new SimpleDateFormat("yyyy년 M월 d일").format(day)+" "+timestr%> " readonly disabled>
                </div>
                   
                
                <div class="input-box col-12 col-md-12">
                  <label for="inputADD" class="">주소</label>
                  <input type="text" class="form-control" name="inputADD" id="inputADD" value="<%=inputADD%>" readonly disabled>
                </div>
                <%}else{ %>
                <div class="input-box col-12 col-md-12">
                  <label for="inputDAY" class="">방문수리 일시</label>
                  <input type="text" class="form-control" id="inputDAY" name="inputDAY"  value="<%=new SimpleDateFormat("yyyy년 M월 d일").format(day)+" "+timestr%> " readonly disabled>
                </div>
                
				<%}%>
                <div class="input-box col-12 col-md-12">
                  <label for="inputEng" class="">담당엔지니어</label>
                  <input type="text" class="form-control" id="inputEng" value="<%=eng.getName()%>" readonly disabled>
                 
                </div>

                <div class="input-box col-12 col-md-12">
                    <label for="inputFactory" class="">제조사</label>
                    <select class="custom-select col-12" id="inputFactory">
                          <option selected value="none" disabled hidden>제조사를 선택해주세요</option>
                          <%int cnt = 0; %>
                          <%for(String factory : fixlistmap.keySet()){
                          cnt++;%>
                          <option value="<%=cnt%>"><%=factory%></option>
                          <%} %>
                        </select>
                    <input type="hidden" id="inputFactoryval" name="inputFactory" value=""> 
                  </div>

                  <div class="input-box col-12 col-md-12">
                    <label>수리기종</label>
                    <%cnt = 0; %>
					<%for(String factory : fixlistmap.keySet()){ 
					cnt++;%>
                    <select class='custom-select col-12 modelselect' id='inputModel<%=cnt%>'  name='inputModel'>
                          <option selected value="none" disabled hidden>기종을 선택해주세요</option>
                          <%for(String model : fixlistmap.get(factory)){ %>
                          <option value="<%=model%>"><%=model%></option>
                          <%} %>
                    </select>
                    <%} %>    
                   
                        
                    
                          
                  </div>

                  <div class="input-box col-12 col-md-12">
                    <label for="inputFailsit" class="">고장상황</label>
                    <select class="custom-select col-12" id="inputFailsit"  name="inputFailsit" required>
                          <option selected value="none" disabled hidden>고장상황을 선택해주세요</option>
                          <option value="fail1">스마트폰 침수</option>
                          <option value="fail2">액정 파손</option>
                          <option value="fail3">외관 파손</option>
                          <option value="fail4">비밀번호 분실</option>
                          <option value="fail5">전원 안켜짐</option>
                          <option value="fail6">배터리 방전(교체)</option>
                          <option value="fail7">진동 안됨</option>
                          <option value="fail8">전화, 무선데이터 연결 불가</option>
                          <option value="fail9">기타 오작동, 해당항목 없음</option>
                        </select>
                        
                  </div>

                  <div class="input-box col-12 col-md-12">
                    <label for="failmsg" class="">고장상황 상세</label>
                    <textarea name="failmsg" class="form-control" id="failmsg" placeholder="100글자 이내로 써주세요." id="" cols="100" rows="5" maxlength="100"></textarea>
                    <div class="invalid-feedback" id="failmsg-invalid">
                        1글자 이상 입력해주시기 바랍니다.
                    </div> 
                </div>

                <div class="input-box col-12 col-md-12">
                  <button class="login-btn btn btn-primary col-12" id="sub-btn" type="submit" disabled>신청완료</button>
                </div>


            </div>
            <input type="hidden" name="inputADD" value="<%=inputADD%>">
            <input type="hidden" name="inputDAY" value="<%=inputDay%>">
            <input type="hidden" name="inputTIMEnum" value="<%=inputTIMEnum%>">
            <input type="hidden" name="sggNm" value="<%=sggNm%>">
            <input type="hidden" name="engid" value="<%=eng.getId()%>">
       
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
    
	var factoryarr = new Array();
	 <%for(String factory : fixlistmap.keySet()){%>
		factoryarr[factoryarr.length] = '<%=factory %>';
	 <%} %>
     $(".modelselect").each(function(){
         var id = $(this).attr("id");
         if(!(id=="inputModel1")){
            $(this).hide();
            $(this).attr("disabled","");
         }
     });

     $("#inputFactory").change(function(){
         var val = $(this).val();
         $(".modelselect").each(function(){
             var id = $(this).attr("id");
             console.log("inputModel"+val);
             if(!(id=="inputModel"+val)){
                 $(this).hide();
                 $(this).attr("disabled","");
                 $(this).val("none");
                 $(this).removeClass("is-valid")
             }else{
                 $(this).show();
                 $(this).removeAttr("disabled");
             }
         });
         $(this).addClass("is-valid");
         $("#inputFactoryval").val(factoryarr[Number($("#inputFactory").val())-1]);
         validCheck()

      })

     $(".modelselect").change(function(){
        $(this).addClass("is-valid");
        validCheck()
     })


     $("#inputFailsit").change(function(){
        $(this).addClass("is-valid");
        validCheck()
     })

     $("#failmsg").focusout(function(){
         if($(this).val().length > 0){
            $(this).addClass("is-valid");
            $(this).removeClass("is-invalid")
         }else{
            $(this).addClass("is-invalid");
            $(this).removeClass("is-valid")
         }
         validCheck()
     })

     $("#failmsg").keyup(function(){
         if($(this).val().length > 0){
            $(this).addClass("is-valid");
            $(this).removeClass("is-invalid")
         }else{
            $(this).addClass("is-invalid");
            $(this).removeClass("is-valid")
         }
         validCheck()
     })

     function validCheck() {
			var chk = $("#failmsg").hasClass("is-valid")
            &&$("#inputFailsit").hasClass("is-valid")&&$("#inputFactory").hasClass("is-valid")
            &&$(".modelselect").not("disabled").hasClass("is-valid");
			
			if(chk){
				$("#sub-btn").removeAttr("disabled");
			}else{
				$("#sub-btn").attr("disabled","");
			}
	}

    
		
		
		
	</script>
</html>