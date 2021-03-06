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
         <link rel="stylesheet" href="CSS/change.css">
         <script src="change.js"></script>
    </head>
    
          <!--네비바 끝-->
      <c:choose>
        <c:when test="${chk==1}">
          <script type="text/javascript">location.href='login'</script>
        </c:when>
      </c:choose>
    
   
    <body>
      <!--네비바 시작-->
      <div id="navbar-wrap">
        <%@ include file="../navbar.jsp" %>
            </div>
          <!--메인 컨텐트 영역-->
         <div class="content col-12 ">
           <div class="col-sm-5" id="infoSize">

           <form action="after.info" enctype="multipart/form-data" accept=".jpg,.jpeg" method="post">
            <input type = "hidden" name = "file2" value="upload" id= "file2" disabled>
            <img src="../engimg/${id}.jpg" alt="" id="img" class="rounded-circle">

            <div class="form-group title">
              <input type="file" class="form-control-file" accept=".jpg,.jpeg" id="imgUp" name="imgUp">
            </div>

            <div class="form-group row title">
              <div class="col-sm-10">
                <input type="password" name = "pwKey" class="form-control" id="inputPassword"
                 value="${pwKey}" disabled="disabled">
              </div>
              <div class="form-check title">
                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" name="chk">
                <label class="form-check-label" for="defaultCheck1">
                  비밀번호 수정
                </label>
                <label for="inputPassword" name="msg"></label>
              </div>
            </div>

          <div class=" title">
            담당지역
            <select class="intro btn btn-primary dropdown-toggle " name="local">
              <option value="센터">센터</option>
              <option value="강동구">종로구</option>
              <option value="중구">중구</option>
              <option value="용산구">용산구</option>
              <option value="성동구">성동구</option>
              <option value="광진구">광진구</option>
              <option value="동대문구">동대문구</option>
              <option value="중랑구">중랑구</option>
              <option value="성북구">성북구</option>
              <option value="강북구">강북구</option>
              <option value="도봉구">도봉구</option>
              <option value="노원구">노원구</option>
              <option value="은평구">은평구</option>
              <option value="서대문구">서대문구</option>
              <option value="마포구">마포구</option>
              <option value="양천구">양천구</option>
              <option value="강서구">강서구</option>
              <option value="구로구">구로구</option>
              <option value="금천구">금천구</option>
              <option value="영등포구">영등포구</option>
              <option value="동작구">동작구</option>
              <option value="관악구">관악구</option>
              <option value="서초구">서초구</option>
              <option value="강남구">강남구</option>
              <option value="송파구">송파구</option>
              <option value="강동구">강동구</option>
            </select>
          </div>

          <div class="form-group title">
            <label for="exampleFormControlTextarea1">내 소개</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="intro" maxlength="100">${intro}</textarea>
            <label for="exampleFormControlTextarea1" name="introMsg"></label>
          </div>
          <input type="submit" name = "infoChn" class="btn btn-primary" value="수정완료" >
        </form>



      </div>
        </div>
    


      <!--메인 컨텐트 끝-->

      <!--푸터 시작-->
  
    </body>

    <!--js 불러오기->
    <!--bootstrap js요소 4.3.1 불러오기-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script>
  	
    $("#imgUp").change(function(event){
        $("#imgUp").val();
	
        var reader = new FileReader();

        reader.onload = function(event){
            var img = $("#img");
            img.attr("src", event.target.result);
        }

        reader.readAsDataURL(event.target.files[0]);
    })
    


    $("input[name=chk]").change(function(){
       if($("input[name=chk]").prop("checked")==true){
        $("input[name=pwKey]").removeAttr("disabled")
      }else{
        $("input[name=pwKey]").attr("disabled","true")
      }

     })
     
     
    $("input[name=pwKey]").change(function(){
      var pw = $("input[name=pwKey]").val()
      var patt = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[0-9])[A-Za-z0-9]{6,8}$/

      if(patt.test(pw)){
        $("input[name=infoChn").removeAttr("disabled")
        $("label[name=msg]").text("")
      }else{
        $("input[name=infoChn").attr("disabled","true")
        $("label[name=msg]").text("잘못된 비밀번호입니다")
	    	$("label[name=msg]").css("color","#BDBDBD")
      }
      
    })

    $("#exampleFormControlTextarea1").change(function(){
      var intro = /^[가-힣ㅏ-ㅣㄱ-ㅎA-Za-z\d$@$!%*#?&]{0,100}$/

      if(intro.test($(this).val())){
        $("input[name=infoChn").removeAttr("disabled")
        $("label[name=introMsg]").text("")
      }else{
        $("input[name=infoChn").attr("disabled","true")
        $("label[name=introMsg]").text("100자 미만으로 작성해주세요")
	    	$("label[name=introMsg]").css("color","#BDBDBD")
      }

    })

</script>


</html>
