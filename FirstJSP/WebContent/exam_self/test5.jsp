<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- testResult3.jsp에 내가 전송한 내용 출력하기 -->
	<form action = "testResult3.jsp">
		이름 : <input type="text" name = "name"> <br/>
		주소 : <input type="text" name = "addr"> <br/>
		<input type="submit" value = "전송">
		<!-- [전송] 클릭 시 결과페이지에서 '홍길동 부산시'라고 출력됨! 보기 쉽도록 개행하고싶음 -->
	</form>
</body>
</html>