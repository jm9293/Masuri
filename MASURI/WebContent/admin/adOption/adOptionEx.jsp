<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="com.masuri.dto.FixlistDTO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 내가 만든 추가로 필요한 css -->
<link rel="stylesheet" href="../mycss/mycss.css">
<!-- 페이징에 필요한 css -->
<link rel="stylesheet" href="../../user/support/sup_Notice.css?after">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<title>요청사항 설정</title>
</head>
<body>
	<%
		ArrayList<FixlistDTO> dto =  (ArrayList<FixlistDTO>)request.getAttribute("list");
	%>
	
	
	<div class="container">
	<%@ include file="../adNav.jsp" %>
	
		<h2 style="color:#999;">요청사항 설정</h2><br>
	
		<div class="input-box ">
		<form method="post" action="adOptionExOK.do">
			<label for="kindPh">폰 기종 선택 : 제조사 / 기기 종류 </label>
			<input type="text" class="form-control insert-txt" id="" name="plusOptionFac" 
				placeholder="삼성/애플/LG/모토로라/기타" value=""><br>
				<input type="text" class="form-control insert-txt" id="" name="plusOptionMod" 
				placeholder="기기 모델 등록" value=""><br>
			<button class="btn btn-outline-secondary" type="submit" id="myLbtn">신규 기종 등록하기</button><br><br><br><br>
		</form>		
			<table class="table table-striped">
				<form action="adOptionExDel.do" name="optionForm">
				<input type="hidden" id="uid" name="uid" value="">
					<tbody>
	
					<%
						if(dto != null){
							for(int i =0; i <dto.size(); i++){
					%>
						<tr>
							<td class="tab-title2"><b><%= dto.get(i).getFactory() %> / <%= dto.get(i).getModel() %> </b></td>	<!-- 등록한 기종들 가져오기 -->
							<td class="tab-view">
								<input type="button" class="btn btn-sm btn-outline-danger" id="<%= dto.get(i).getNum() %>" onclick="deleteOption(this)" value="삭제"/>
							</td>
						</tr>
					<%
							}
						}
					%>
					<tbody>
				</form>
			</table>
			
				
		</div>
	</div>
</body>

<script>
	
	function deleteOption(e) {
		var id = e.id;
		document.getElementById("uid").value = id;
		optionForm.submit();
	}
	
</script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>