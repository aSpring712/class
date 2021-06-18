<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="scoreResult.jsp">
		이름 : <input type ="text" name="name"> <br/>
		국어 : <input type ="text" name="kor"> <br/>
		수학 : <input type ="text" name="math"> <br/>
		영어 : <input type ="text" name="eng"> <br/>
		<input type ="submit" value="성적조회">
		<input type ="reset" value="취소">
	</form>
</body>
</html>