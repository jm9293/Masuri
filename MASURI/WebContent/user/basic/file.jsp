<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form action="userupdate.do" enctype="multipart/form-data" method="post">
   	파일명1 : <input type="file" name="file1" accept=".jpg,.jpeg"/><br/>
        <input type="submit" value="전송" />  
        <input type="reset" value="취소" />

   </form>
</body>
</html>