<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String clientId = "7x13p0LGy9xlnMVuk3UD";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/MASURI/user/basic/navercallback.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
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
        <link rel="stylesheet" href="CSS/basic.css">
         <!--jquery 3.3.1 불러오기-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- 페이지 css -->
         <link rel="stylesheet" href="CSS/login.css">
         
    </head>
    
   
    <body>
      <!--네비바 시작-->
      <div id="navbar-wrap">
       <%@ include file="navbar.jsp" %>
      </div>
        <%if(logincheck){%>
    	   <script>
    	   alert('로그인중이시면  이용하실수 없습니다.')
    	   location.href='/MASURI/';
    	   </script>
       <%return;}%>
      <!--네비바 끝-->

      <!--메인 컨텐트 영역-->
      <div class="content">
       <div class="login-box col-12 col-md-6">
           <div class="title col-12 text-center">
               <h1>로그인</h1>
                <a href="signup.jsp">회원이 아니신가요?</a>
            </div>
        

        <form action="login/login.do" method="post">
            <div class="form-group">
                <div class="input-box col-12 col-md-12">
                  <label for="inputID" class="">아이디</label>
                  <input type="text" class="form-control" id="inputID" name="inputID" placeholder="" required>
                </div>
                   
                <div class="input-box col-12 col-md-12">
                  <label for="inputPW" class="">비밀번호</label>
                  <input type="password" class="form-control" name="inputPW" id="inputPW" placeholder="" required>
                </div>
				<div class="input-box col-12 col-md-12 row" style="">
                 <div class="col-6"><a href="idsearch.jsp">아이디 찾기</a></div>
                 <div class="col-6"><a href="pwsearch.jsp">비밀번호 찾기</a></div>
                </div>
                
                <div class="input-box col-12 col-md-12">
                  <button class="login-btn btn btn-primary col-12" type="submit">로그인</button>
                </div>
            </div>
        </form>
                <div class="input-box col-12 col-md-12">
                  <button class="login-btn btn btn-success col-12" onclick="location.href='<%=apiURL%>'">네이버로 로그인</button>
                </div>
                <div class="input-box col-12 col-md-12">
                  <button class="login-btn btn btn-success col-12" id="kakao-login-btn">카카오버튼</button>
                  <button class="login-btn btn btn-warning col-12" onclick="$('#kakao-login-btn').click()">카카오로 로그인</button>
                </div>
                <form action="kakaocallback.do" id="kakaoform" method="post">
                	<input type="hidden" id="kakaoemail" name="kakaoemail" value="">
                	<input type="hidden" id="kakaoid" name="kakaoid" value=""> 
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
	
	 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	 <script type='text/javascript'>

    document.addEventListener("DOMContentLoaded", function() {
        Kakao.init( "7e5dd1b3d783cce86b62c626f0af2fe2" );
        Kakao.Auth.createLoginButton({
              container : "#kakao-login-btn"
            , success : function( authObj ) {
                Kakao.API.request({
                      url : "/v2/user/me"
                    , success : function( res ) {
                        $("#kakaoid").val(res.id);
                        $("#kakaoemail").val(res.kakao_account.email);
                        $("#kakaoform").submit();
                    }, fail : function( error ) {
                        alert( JSON.stringify( error ) );
                    }
                });
            }
            , fail : function( error ) {
                alert( JSON.stringify( error ));
            }
        });
    });
    </script>
</html>
