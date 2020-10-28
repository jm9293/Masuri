<%@page import="com.masuri.user.command.LoginCommand"%>
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
          .login-box{
            margin: 10% auto;

          }
          .input-box{
              margin: 2% 0;
          }
          
          .title b{
          	font-weight: 300;
          	color: rgb(52, 152, 219);
          }       
          
          .email .row{
        	padding : 0px;
        	margin : 0px;
          }
          
          .email .at{
        	text-align: center;
        	line-height:28px ;
        	padding :0px;
          }

          .paddingzero{
              padding: 0px;
              margin: auto;
          }

          @media (max-width: 768px) {
                #idcheck{
                    margin-top: 10px;
                }
          }
        </style>
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
               <h1>회원가입</h1>
               <b>고객님의 개인정보는 소중히 보관됩니다.</b>
            </div>
        

        <form action="signup.do" method="post" onsubmit="return submitchk();">
            <div class="form-group">
                <div class="input-box col-12 col-md-12">
                  <label for="inputID" class="">아이디</label>
                  <div class="row col-12 paddingzero">
                    <input type="text" class="form-control col-12 col-md-7" id="inputID" name="inputID" placeholder="4~6자 영문소문자+숫자" maxlength="6" required>
                    <div class="col-0 col-md-1 paddingzero"></div>
                    <button class="btn btn-primary col-5 col-md-4" id="idcheck" type="button" disabled>중복확인</button>
                    <div class="valid-feedback">
                      사용가능아이디입니다.
                    </div>
                    <div class="invalid-feedback" id="id-invalid">
                      아이디는 4~6자 영문소문자+숫자여야 합니다.
                    </div>   
                  </div>
                </div>

                <div class="input-box col-12 col-md-12">
                  <label for="inputPW" class="">비밀번호</label>
                  <input type="password" class="form-control" name="inputPW" id="inputPW" placeholder="6~8자 영문+숫자" maxlength="8" required>
                  <div class="invalid-feedback">
                    비밀번호는 6~8자 영문+숫자여야 합니다.
                  </div>   
                </div>
                
                <div class="input-box col-12 col-md-12">
                  <label for="inputPWCHK" class="">비밀번호 확인</label>
                  <input type="password" class="form-control" name="inputPWCHK" id="inputPWCHK" placeholder="비밀번호 확인" maxlength="8" required>
                  <div class="invalid-feedback">
                    비밀번호와 일치하지 않습니다.
                  </div>   
                </div>
                
                <div class="input-box col-12 col-md-12">
                  <label for="inputNAME" class="">이름</label>
                  <input type="text" class="form-control" name="inputNAME" id="inputNAME" placeholder="한글" maxlength="10" required>
                  <div class="invalid-feedback">
                    한글 2글자 이상만 입력할수 있습니다.
                  </div>   
                </div>
                
                <div class="input-box col-12 col-md-12">
                  <label for="inputPhone" class="">전화번호</label>
                  <input type="text" class="form-control" name="inputPhone" id="inputPhone" placeholder='"-" 없이 숫자만 입력하세요' maxlength="11" required>
                  <div class="invalid-feedback">
                    숫자 10~11자만 입력할수 있습니다.
                  </div>   
                </div>
                
                <div class="input-box col-12 col-md-12 email">
                  <label for="inputEmail" class="">이메일</label>
	                <div class="row col-12">
	                  <input type="text" class="form-control col-5" name="inputEmail" id="inputEmail" placeholder="이메일 아이디" maxlength="10" required>
	                  <div class="col-1 at">@</div>
	                  <select class="custom-select col-6" id="emailSelect"  name="emailSelect">
					    <option selected value="gmail.com">gmail.com</option>
					    <option value="naver.com">naver.com</option>
					    <option value="daum.net">daum.net</option>
					    <option value="nate.com">nate.com</option>
					    <option value="direct">직접 입력</option>
					  </select>
                      <input type="text" class="form-control col-6" name="inputEmaildirect" id="inputEmaildirect" placeholder="" value="직접입력">
                      <div class="invalid-feedback">
                        이메일 형식이아닙니다.
                      </div>   
	                </div>
                </div>
     			<br>
                <div class="input-box col-12 col-md-12">
                  <button class="login-btn btn btn-primary col-12" type="submit" id="signup-btn" disabled>회원가입</button>
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
	<script>

	$(function(){
	$("#inputEmaildirect").hide();
	$("#emailSelect").change(function() {
			if($("#emailSelect").val()==='direct') {
				$("#emailSelect").hide();
                $("#inputEmaildirect").show();
                $("#inputEmaildirect").keyup();
			}
        }) 
        
    $("#inputID").keyup(function(){
            var value =  $("#inputID").val();
           if(/[a-z0-9]{4,6}/.test(value)&&/[a-z]/.test(value)&&/[0-9]/.test(value)){
            
        	$("#inputID").addClass("is-invalid");
        	$("#id-invalid").text("중복확인을 해주세요.");
            $("#idcheck").removeAttr("disabled");
           }else{
        	   
        	$("#id-invalid").text("아이디는 4~6자 영문소문자+숫자여야 합니다.");
            $("#inputID").addClass("is-invalid"); 
            $("#idcheck").attr("disabled","");
           }
           
           validchk();
        })
    
    $("#inputPW").keyup(function(){
        var value =  $("#inputPW").val();
       if(/(?=.*[a-zA-Z])(?=.*\d).{6,8}/.test(value)){
        $("#inputPW").removeClass("is-invalid");
        $("#inputPW").addClass("is-valid");
       }else{
        $("#inputPW").removeClass("is-valid");
        $("#inputPW").addClass("is-invalid"); 
       }
	 
       validchk();
    })  


    $("#inputPWCHK").keyup(function(){
        var value =  $("#inputPWCHK").val();
       if(value===$("#inputPW").val()){
        $("#inputPWCHK").removeClass("is-invalid");
        $("#inputPWCHK").addClass("is-valid");
       }else{
        $("#inputPWCHK").removeClass("is-valid");
        $("#inputPWCHK").addClass("is-invalid"); 
       }
	   
       validchk();
    })  

    $("#inputNAME").keyup(function(){
        var value =  $("#inputNAME").val();
       if(/[가-힣]{2,}/.test(value)){
        $("#inputNAME").removeClass("is-invalid");
        $("#inputNAME").addClass("is-valid");
       }else{
        $("#inputNAME").removeClass("is-valid");
        $("#inputNAME").addClass("is-invalid"); 
       }
       
       validchk();
    })  

    $("#inputPhone").keyup(function(){
        var value =  $("#inputPhone").val();
       if(/[0-9]{10,11}/.test(value)){
        $("#inputPhone").removeClass("is-invalid");
        $("#inputPhone").addClass("is-valid");
       }else{
        $("#inputPhone").removeClass("is-valid");
        $("#inputPhone").addClass("is-invalid"); 
       }
       
       validchk();
    })  

    $("#inputEmail").keyup(function(){
        var value;
        if($("#emailSelect").val()!=='direct'){
           value = $("#inputEmail").val()+'@'+$("#emailSelect").val()
        }else{
            value = $("#inputEmail").val()+'@'+$("#inputEmaildirect").val()
        }

       if(/[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}/.test(value)){
        $("#inputEmail").removeClass("is-invalid");
        $("#inputEmail").addClass("is-valid");
       }else{
        $("#inputEmail").removeClass("is-valid");
        $("#inputEmail").addClass("is-invalid"); 
       }

       validchk();
    })  

    

    $("#inputEmaildirect").keyup(function(){
        var value;
        value = $("#inputEmail").val()+'@'+$("#inputEmaildirect").val()
  
       if(/[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}/.test(value)){
        $("#inputEmaildirect").removeClass("is-invalid");
        $("#inputEmaildirect").addClass("is-valid");
       }else{
        $("#inputEmaildirect").removeClass("is-valid");
        $("#inputEmaildirect").addClass("is-invalid"); 
       }
	
        validchk();
    }) 
      
    $("#idcheck").click(function(){
        
        $.get('http://localhost:8080/MASURI/user/basic/login/idchk.do?inputID='+$("#inputID").val(), function(data) {  
		if(data==='true'){
			$("#inputID").removeClass("is-invalid");
			$("#inputID").addClass("is-valid");
			$("#inputID").attr("readonly","");
		}else{
			$("#id-invalid").text("중복된아이디입니다.");
		}

        });

    });

    

    });
    
	function validchk() {
		var chk = $("#inputID").hasClass("is-valid")&&$("#inputPW").hasClass("is-valid")
        &&$("#inputPWCHK").hasClass("is-valid")&&$("#inputNAME").hasClass("is-valid")
        &&$("#inputPhone").hasClass("is-valid")&&$("#inputEmail").hasClass("is-valid");
		if(chk){
     	   $("#signup-btn").removeAttr("disabled");
        }else{
     	   $("#signup-btn").attr("disabled","");
        }
        return chk;
	}
	
    function submitchk(){

        $("#inputID").keyup();
        $("#inputPW").keyup();
        $("#inputPWCHK").keyup();
        $("#inputNAME").keyup();
        $("#inputPhone").keyup();
        $("#inputEmail").keyup();

        return validchk();
                
    }
    
    
    

	</script>
</html>