<%@page import="com.masuri.dto.UserDTO"%>
<%@page import="com.masuri.user.command.LoginCommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% UserDTO user = (UserDTO)request.getAttribute("user"); %>
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

          .disnone{
              display: none;
          }

          img{
              width: 20vw;
              height: 20vw;
              margin: 3% auto;
              display: block;
              border-radius: 50%;
          }

          @media (max-width: 768px) {
                #file-btn{
                    margin-top: 10px;
                }

                img{
                    width: 40vw;
                    height: 40vw;
                }
          }
        </style>
    </head>
    
   
    <body>
      <!--네비바 시작-->
        <div id="navbar-wrap">
       <%@ include file="navbar.jsp" %>
      </div>
       <!-- <%//if(!logincheck){%>
    	   <script>
    	   alert('로그인을해야 이용할수 있습니다.')
    	   location.href='/MASURI/user/basic/login/login.do';
    	   </script>
       <%//return;}%> -->
      <!--네비바 끝-->

      <!--메인 컨텐트 영역-->
      <div class="content">
       <div class="login-box col-12 col-md-6">
           <div class="title col-12 text-center">
               <h1>회원정보변경</h1>
               <b><%=user.getId()%>님. 변경할정보를 체크하고 수정하세요.</b>
            </div>
        

        <form action="updateGo.do" method="post" enctype="multipart/form-data">
            <img src="../../userimg/<%=user.getId()+".jpg"%>" alt="" id="profileimg">
            <div class="form-group">
                <div class="input-box col-12 col-md-12">
                  <label for="inputImg" class=""><input type="checkbox" name="" id="imgcheckbox"> 프로필사진</label>
                  <div class="row col-12 paddingzero">
                    <input type="text" class="form-control col-12 col-md-7" id="inputImg" placeholder="파일경로"  disabled>
                    <div class="col-0 col-md-1 paddingzero"></div>
                    <button class="btn btn-primary col-5 col-md-4" id="file-btn" type="button" disabled>사진 등록</button>
                    <input type="file" name="file" id="file" accept=".jpg,.jpeg" disabled>
                    <div class="valid-feedback">
                      업로드준비되었습니다.
                    </div>
                      
                  </div>
                </div>

                <div class="input-box col-12 col-md-12">
                  <label for="inputPW" class=""><input type="checkbox" name="" id="pwcheckbox"> 비밀번호</label>
                  <input type="password" class="form-control" name="inputPW" id="inputPW" placeholder="6~8자 영문+숫자" maxlength="8" disabled>
                  <div class="invalid-feedback">
                    비밀번호는 6~8자 영문+숫자여야 합니다.
                  </div>   
                </div>
                
                <div class="input-box col-12 col-md-12">
                  <label for="inputPWCHK" class="">비밀번호 확인</label>
                  <input type="password" class="form-control" name="inputPWCHK" id="inputPWCHK" placeholder="비밀번호 확인" maxlength="8" disabled>
                  <div class="invalid-feedback">
                    비밀번호와 일치하지 않습니다.
                  </div>   
                </div>
                
                
                <div class="input-box col-12 col-md-12">
                  <label for="inputPhone" class=""><input type="checkbox" name="" id="phonecheckbox"> 전화번호</label>
                  <input type="text" class="form-control" name="inputPhone" id="inputPhone" placeholder='"-" 없이 숫자만 입력하세요' maxlength="11" value="<%=user.getPhone() %>" disabled>
                  <div class="invalid-feedback">
                    숫자 10~11자만 입력할수 있습니다.
                  </div>   
                </div>
                
                <div class="input-box col-12 col-md-12">
                    <label for="inputemail" class=""><input type="checkbox" name="" id="emailcheckbox"> 이메일</label>
                    <input type="text" class="form-control" name="inputemail" id="inputemail" placeholder='이메일을 입력하세요' maxlength="30"  value="<%=user.getEmail() %>" disabled>
                    <div class="invalid-feedback">
                      이메일 형식에 맞지 않습니다.
                    </div>   
                  </div>
                
     			<br>
                <div class="input-box col-12 col-md-12">
                  <button class="login-btn btn btn-primary col-12" type="submit" id="signup-btn" disabled>변경</button>
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
    <script type="text/javascript">
    var emailval ='<%=user.getEmail()%>';
    var phoneval ='<%=user.getPhone()%>';
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script>
	
	
	
    //$("#file").hide();
    
    $("#file-btn").click(function(){
        $("#file").click();
    });

    $("#file").change(function(event){
        $("#inputImg").val($("#file").val());
        $("#inputImg").addClass("is-valid");

        var reader = new FileReader();

        reader.onload = function(event){
            var img = $("#profileimg");
            img.attr("src", event.target.result);
        }

        reader.readAsDataURL(event.target.files[0]);
        checkboxCheck()
    })
    
    
    $("#imgcheckbox").change(function(){
       if($("#imgcheckbox").is(":checked")==true){
        $("#file").removeAttr("disabled");
        $("#file-btn").removeAttr("disabled");
        
       }else{
        $("#file").attr("disabled","");
        $("#file-btn").attr("disabled","");
        $("#inputImg").removeClass("is-valid");
        $("#inputImg").val("파일경로");
       }
       checkboxCheck();
    })

    $("#pwcheckbox").change(function(){
       if($("#pwcheckbox").is(":checked")==true){
        $("#inputPW").removeAttr("disabled");
        $("#inputPWCHK").removeAttr("disabled");
        
       }else{
        $("#file").attr("disabled","");
        $("#inputPW").attr("disabled","");
        $("#inputPWCHK").attr("disabled","");
        $("#inputPWCHK").removeClass("is-valid");
        $("#inputPW").removeClass("is-valid");
        $("#inputPWCHK").removeClass("is-invalid");
        $("#inputPW").removeClass("is-invalid");
        $("#inputPW").val("");
        $("#inputPWCHK").val("");
       }
       checkboxCheck();
    })

    $("#phonecheckbox").change(function(){
       if($("#phonecheckbox").is(":checked")==true){
        $("#inputPhone").removeAttr("disabled");
        
       }else{
        $("#inputPhone").attr("disabled","");
        $("#inputPhone").removeClass("is-valid");
        $("#inputPhone").removeClass("is-invalid");
  
        $("#inputPhone").val(phoneval);

       }
       checkboxCheck();
    })

    $("#emailcheckbox").change(function(){
       if($("#emailcheckbox").is(":checked")==true){
        $("#inputemail").removeAttr("disabled");
        
       }else{
        $("#inputemail").attr("disabled","");
        $("#inputemail").removeClass("is-valid");
        $("#inputemail").removeClass("is-invalid");
  
        $("#inputemail").val(emailval);
        
       }
       checkboxCheck();
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
       checkboxCheck();
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
       checkboxCheck();
	   
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
       checkboxCheck();
    })  

    $("#inputemail").keyup(function(){
        var value = $("#inputemail").val();
       if(/[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}/.test(value)){
        $("#inputemail").removeClass("is-invalid");
        $("#inputemail").addClass("is-valid");
       }else{
        $("#inputemail").removeClass("is-valid");
        $("#inputemail").addClass("is-invalid"); 
       }
       checkboxCheck();
    })  

    function checkboxCheck(){
        var chk = false;
        if($("#imgcheckbox").is(":checked")==true){
            chk = $("#inputImg").hasClass("is-valid");
            console.log(chk);
        }
        
        if($("#pwcheckbox").is(":checked")==true){
            chk = ($("#inputPW").hasClass("is-valid") && $("#inputPWCHK").hasClass("is-valid")); 
        }

        if($("#phonecheckbox").is(":checked")==true){
            chk =  $("#inputPhone").hasClass("is-valid");
        }
        
        if($("#emailcheckbox").is(":checked")==true){
            chk = $("#inputemail").hasClass("is-valid");
        } 

        if(chk){
            $("#signup-btn").removeAttr("disabled");
        }else{
            $("#signup-btn").attr("disabled","");
        }
    }



	</script>
</html>