<%@page import="com.masuri.user.command.LoginCommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userID = (String)request.getSession().getAttribute("login");

boolean logincheck = LoginCommand.Users.containsKey(userID);

if(userID!=null&&!logincheck){
	try{
		session.invalidate();
	}catch(Exception e){
		
	}
}	

%>
 
        <!--네비바 시작-->
        <nav class="navbar navbar-expand-md navbar-light bg-white navbar-u">
            <a class="navbar-brand navbar-logo" href="/MASURI">MASURI</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      출장수리
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="#">출장수리 안내</a>
                      <a class="dropdown-item" href="../res/res1.jsp">출장수리 예약</a>
                      <a class="dropdown-item" href="../res/res_chk1.do">예약 확인</a>
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      방문수리
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">방문수리 안내</a>
                        <a class="dropdown-item" href="../res/res2.jsp">방문수리 예약</a>
                        <a class="dropdown-item" href="../res/res_chk2.do">예약 확인</a>
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      회사소개
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../info/Intro_Com.do">회사 소개</a>
                        <a class="dropdown-item" href="../info/Intro_Map.do">오시는길</a>
                    </div>
                  </li>

                  <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      고객센터
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../support/sup_Notice.do?page=1">공지사항</a>
                        <a class="dropdown-item" href="../support/sup_FAQ.do">자주 묻는 질문</a>
                        <a class="dropdown-item" href="../support/sup_Qna.do?page=1">고객 상담 게시판</a>
                    </div>
                  </li>
                  <form class="form-inline">
                  <%
                  if(!logincheck) { 
                  %>
                    <button class="btn btn-outline-primary" type="button" onclick="" data-toggle="modal" data-target="#loginmodal">로그인</button>
                  <%
                  }else{
                  %>
                  	<button class="btn btn-outline-primary" type="button" onclick="" data-toggle="modal" data-target="#loginmodal">
                  	<%=userID %>
                  	</button>
                  <%
                  }
                  %>
                  </form>
              </ul>
            </div>
          </nav>

          
          <!--네비바 끝-->

          <!--로그인모달창 시작-->
          <%if(!logincheck){ %>
          <div class="modal fade loginmodal" tabindex="-1" id="loginmodal">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">로그인하여 서비스를 이용하세요.</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <button type="button" class="btn btn-secondary" onclick="location.href='../basic/signup.jsp'">회원가입</button>
                  <button type="button" class="btn btn-primary" onclick="location.href='../basic/login.jsp'">로그인</button>
                </div>
                
              </div>
            </div>
          </div>
          <%}else{ %>
          <div class="modal fade loginmodal" tabindex="-1" id="loginmodal">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">환영합니다.</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <img src="../../userimg/<%=userID%>.jpg" class="center" alt="">
                  <h3><%=userID%></h3>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" onclick="location.href='../basic/updateuser.do'">회원정보 수정</button>
                  <button type="button" class="btn btn-primary" onclick="location.href='../basic/login/logout.do'">로그아웃</button>
                </div>
                
              </div>
            </div>
          </div>
          <!--로그인모달창 끝-->
          <%} %>

         