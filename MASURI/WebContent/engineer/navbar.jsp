<%@page import="com.masuri.engineer.command.EngineerLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%
	String EngID = (String)request.getSession().getAttribute("enlogin");

	boolean logincheck = EngineerLogin.engineerID.containsKey(EngID);
	
	if(EngID!=null&&!logincheck){
		try{
			session.invalidate();
		}catch(Exception e){
			
		}
	}	

%>


<style>
* {
  font-family: "Noto Sans KR", sans-serif;
  margin: 0px;
  padding: 0px;
}

.g{
  color: rgb(52, 152, 219);
  font-size: 20px;
}

.navbar-logo{
  color : rgb(51, 51, 53);
  font-size: 20px;
}

.aplus, .aplus:hover{
  color : rgb(159, 159, 159);
  font-size: 20px;
}



</style>



        <!--네비바 시작-->
        <meta charset="utf-8">
        <nav class="navbar navbar-expand-md navbar-light bg-white navbar-u">
            <a class= "navbar-brand navbar-logo"  href="main.do">MASURIENG</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link" href="register.do" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                    onclick="location.href='register.do'">
                      스케줄관리
                    </a>

                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link" href="schedulecheck.do" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                    onclick="location.href='schedulecheck.do'">
                      스케줄확인
                      
                    </a>

                  </li>

                  <li class="nav-item dropdown">
                    <a class="nav-link" href="info.info" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                    	onclick="location.href='info.info'">
                      내정보
                    </a>
                  </li>

              </ul>
              <form class="form-inline">
                    <button class="btn btn-outline-primary" type="button" onclick="location.href='logout.do'" >로그아웃</button>
   
                  </form>
              
            </div>
          </nav>

          
          <!--네비바 끝-->


         