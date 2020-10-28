<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="adEngCreate.css">
<script src="adEngCreate.js"></script>
<%
	ArrayList<String> list = (ArrayList<String>)request.getAttribute("idList");
%>
<script>
var idlist = new Array();
<%
for(int i=0 ; i < list.size() ; i++){
%>
 idlist[idlist.length] = "<%=list.get(i)%>";

<%
}
%>
</script>

<title>MASURI MANAGER</title>
</head>
<body class="cont">

<%@ include file="../adNav.jsp" %>
    
    <div class="container">
		
	<div class="card container bg-warning" style="width: 400px; height: 600px; border: 1px solid white">
		<form name="frm" action="adEngCreateOk.do" onsubmit="return submitchk();">
		<h3>기사 계정 생성 페이지 입니다.</h3>
		<br>
		<div class="card-body form-group">
			
			<div class="input-box col-12">
				<label for="idtext">ID : </label> 
				<input type="text" class="form-control" id="idtext" name="id" maxlength="6" required/>
				<button type="button" onclick="createChk()" id="idchk-btn" disabled>중복체크</button>
				<div class="invalid-feedback" id="id-invalid">아이디는 4~6자 영문소문자+숫자여야 합니다.</div>
			</div>
			<div class="input-box col-12">
				<label for="pwtext">PW : </label> 
				<input type="password" class="form-control" id="pwtext" name="pw" maxlength="8" required/>
				<div class="invalid-feedback">비밀번호는 6~8자 영문+숫자여야 합니다.</div>
			</div>
			<div class="input-box col-12">
                  <label for="inputPWCHK" class="">비밀번호 확인</label>
                  <input type="password" class="form-control" name="pwchk" id="pwchk" placeholder="비밀번호 확인" maxlength="8" required>
				  <div class="invalid-feedback">비밀번호와 일치하지 않습니다.</div>
			</div>
			<div class="input-box col-12">
				<label for="nametext">Name : </label> 
				<input type="text" class="form-control" id="nametext" name="name" maxlength="10" required/>
				<div class="invalid-feedback">한글 2글자 이상만 입력할수 있습니다.</div>
			</div>
			<div class="input-box col-12">
				<div class="row col-12">
	                  <input type="text" class="form-control col-5" name="emailtext" id="emailtext" placeholder="이메일 아이디" maxlength="10" required>
	                  <div class="col-1 at">@</div>
	                  <select class="custom-select col-6" id="emailSelect"  name="emailSelect">
					    <option selected value="gmail.com">gmail.com</option>
					    <option value="naver.com">naver.com</option>
					    <option value="daum.net">daum.net</option>
					    <option value="nate.com">nate.com</option>
					    <option value="direct">직접 입력</option>
					  </select>
                      <input type="text" class="form-control col-6" name="inputEmaildirect" id="inputEmaildirect" placeholder="" value="직접입력">
					<div class="invalid-feedback">이메일 형식이아닙니다.</div>
				</div>
			</div>
			<div class="input-box col-12">
				<label for="phonetext">Phone : </label> 
				<input type="text" class="form-control" id="phonetext" name="phone" maxlength="11" required/>
				<div class="invalid-feedback">숫자 10~11자만 입력할수 있습니다.</div>
			</div>
			<div class="input-box col-12">
				<label for="guArea">담당지역 : </label> 
				<select name="guArea" id="guArea" class="selectpicker">
					<option value="센터">센터</option>
					<option value="강남구">강남구</option>
					<option value="강서구">강서구</option>
					<option value="강동구">강동구</option>
					<option value="강북구">강북구</option>
					<option value="관악구">관악구</option>
					<option value="광진구">광진구</option>
					<option value="구로구">구로구</option>
					<option value="금천구">금천구</option>
					<option value="노원구">노원구</option>
					<option value="도봉구">도봉구</option>
					<option value="동대문구">동대문구</option>
					<option value="동작구">동작구</option>
					<option value="마포구">마포구</option>
					<option value="서대문구">서대문구</option>
					<option value="서초구">서초구</option>
					<option value="성동구">성동구</option>
					<option value="성북구">성북구</option>
					<option value="송파구">송파구</option>
					<option value="양천구">양천구</option>
					<option value="영등포구">영등포구</option>
					<option value="용산구">용산구</option>
					<option value="은평구">은평구</option>
					<option value="종로구">종로구</option>
					<option value="중구">중구</option>
					<option value="중랑구">중랑구</option>
				</select>
			</div>
			<div class="input-box col-12">
				<label for="introtext">소개글</label> 
				<textArea class="form-control" id="introtext" name="intro" rows="10" required></textArea>
			</div>
			<button class="login-btn btn btn-primary col-12" type="submit" id="signup-btn" disabled>계정발급</button>
			<button type="button" class="btn btn-danger">취소</button>
		</div>
		</form>
		<br>
	</div>
	</div>
</body>
</html>