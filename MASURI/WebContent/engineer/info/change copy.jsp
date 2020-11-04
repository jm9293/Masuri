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
          .content{
            text-align: center;
            margin-top: 150px;
            margin-bottom: 150px;
            margin-left: 300px;
            margin-right: 300px;
            width: auto;
          }

          img{
            width: 200px;
            height: 200px;
          }

          .info-box{
            margin-top: 50px;
            margin-bottom: 50px;
          }

  
        </style>
    </head>
    
   
    <body>
      <!--네비바 시작-->

      <!--네비바 끝-->
	<c:choose>
		<c:when test="${chk==1}">
			<script type="text/javascript">location.href='login'</script>
		</c:when>
	</c:choose>
	
      <!--메인 컨텐트 영역-->
      <div class="content">
        
       <form action="after.info" enctype="multipart/form-data" method="post">
        <input type = "hidden" name = "imgp" value="upload" id= "file2" >
            <img src="../../userimg/${id}.jpg" alt="" id="profileimg">
            <div class="form-group">
               
                  <div class="row col-12 paddingzero">
                    <input type="text" class="form-control col-12 col-md-7" id="inputImg" placeholder="파일경로">
                    <div class="col-0 col-md-1 paddingzero"></div>
                    <input type="file" name="file" id="file" accept=".jpg,.jpeg" >
                    <div class="valid-feedback">
                     
                  
                        </div>
                   </div>
                             </div>
            
   	
        </form>
        </div>

      <div class="info-box">
          <div id="engineer-info">
            	<br>이름 ${name}<br><br>

            ID ${id }<br>
            
          </div>
      </div>

	
      <div class="info-box">
        <div id="engineer-bnt">
            <input type="button" value="PW변경" name="PWchange">
            <input type="button" value="IMAGE" name="imageChange">

          
        </div>
      </div>

  	<form action="after.info" method="post">
      <div class="info-box">
        담당지역
   
          <select name="local">
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

    <div class="info-box">
  
        <div class="form-group">
  	  			
          <label for="exampleFormControlTextarea1">내소개</label>
          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="intro">
          </textarea>
        <input  type="submit" class="btn btn-primary" value="수정완료">
         
        </div>
	

    </div>
		</form>

	</div>

    </div>


      <!--메인 컨텐트 끝-->

      <!--푸터 시작-->
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




</html>
