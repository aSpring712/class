<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 보기 쉽게 개행하고싶음 -->
	<form action = "testResult4.jsp">
		이름 : <input type="text" name = "name"> <br/>
		주소 : <input type="text" name = "addr"> <br/>
		<input type="submit" value = "전송">
		<!-- [전송] 클릭 시 결과페이지에서
		홍길동
		부산시
		라고 보기 쉽게 개행되어서 출력됨 -->
	</form>
</body>
</html>