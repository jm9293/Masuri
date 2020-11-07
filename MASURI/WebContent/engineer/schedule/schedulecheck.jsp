
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.masuri.dto.ReslistDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
    <html lang="ko">
      <head>
        <title>기사 스케줄 확인</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- bootstrap 4.3.1 cssìì -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- ê¸°ë³¸ í°í¸ êµ¬ê¸ Noto Sans êµµê¸° 400,500,900 -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
        <!-- ê¸°ë³¸ css -->
        <link rel="stylesheet" href="CSS/basic.css">
         <!--jquery 3.3.1 ë¶ë¬ì¤ê¸°-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <!-- íì´ì§ css -->
        <link rel="stylesheet" href="CSS/schedulecheck.css">
    </head>

   
    <body>
      <!--ë¤ë¹ë° ìì-->
      <div id="navbar-wrap"></div>
		<%@ include file="../navbar.jsp" %>
      <!--ë¤ë¹ë° ë-->

      <!--ë©ì¸ ì»¨íí¸ ìì­-->
      <div class="content col-12">
	
	<c:choose>
		<c:when test="${chk==1}">
			<script type="text/javascript">location.href='login'
				alert("세션만료")</script>
		</c:when>
  </c:choose>

    <div class="weekSchedule ">
      <div class="select col-12">
      <%ArrayList<ReslistDTO> list = (ArrayList<ReslistDTO>)request.getAttribute("resarr"); 
        SimpleDateFormat sdf =  new SimpleDateFormat("yy.MM.dd HH시");
      	String date = (String)request.getAttribute("date"); 
      	System.out.println(date);
      %> 
       <h3>신청서 내역</h3>   
      <div class="menuname menuborder row col-12 alert-primary">
			<div class="col-3 col-lg-1 menu">신청번호</div>
			<div class="col-6 col-lg-4 menu">주소</div>
			<div class="col-3 col-lg-1 menu">신청자</div>
			<div class="col-3 col-lg-2 menu">기종</div>
			<div class="col-6 col-lg-2 menu">일시</div>
			<div class="col-3 col-lg-2 menu">예약상태</div>		
		</div>
		<%
			if(!list.isEmpty()){
				for(int i = 0; i < list.size(); i++){
		%>
		<div class="menuname textarea row col-12 textlist" onclick="location.href='selected.do?register=<%=list.get(i).getNum()%>'">
			<div class="col-3 col-lg-1 text" id="text1"><%= list.get(i).getNum() %></div>
			<div class="col-6 col-lg-4 text" id="text2"><%= list.get(i).getAddress().replace("서울특별시", "") %></div>	
			<div class="col-3 col-lg-1 text" id="text3"><%= list.get(i).getUserid() %></div>
			<div class="col-3 col-lg-2 text" id="text4"><%= list.get(i).getModel() %></div>
			<div class="col-6 col-lg-2 text" id="text5"><%= sdf.format(list.get(i).getTime()) %></div>
			<div class="col-3 col-lg-2 text" id="text6"><%= list.get(i).getState() %></div>	
		</div>
		<%			
				}
			}else{
		%> 
		<div class="menuname textarea row col-12 textlist">
			<div class="col-12 text" id="text1">신청서가없습니다.</div>
		</div>
		
		<%			
		}
			
		%>
      </div>
      
      <div class="click">
            근무일자를 선택하세요
      </div>
			<c:forEach var="dd" items="${week}" begin="0" end="6">
            <div class="paper week" id="weekend">
            <c:if test="${dd==date}">
             <div class="enter alert-primary sel">
              ${dd}일
            </div>
            </c:if>
            <c:if test="${dd!=date}">
             <div class="enter alert-primary">
              ${dd}일
            </div>
             </c:if>
            </div>            
			</c:forEach>
      </div>
  

  
      </div>

    </body>
    


    <!--js ë¶ë¬ì¤ê¸°->
    <!--bootstrap jsìì 4.3.1 ë¶ë¬ì¤ê¸°-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script>

    var day = ""
    $('.week').click(function(){
     
      day = $(this).text().replace("일","");
      
      var form = $('<form></form>')
      form.attr("action","schedulecheck.do")
      form.attr("method","post")
      form.appendTo("body")

      var date = $('<input type="hidden" name="selected" value='+day+'>')
      form.append(date)

      form.submit()

    })


</script>

</html>
