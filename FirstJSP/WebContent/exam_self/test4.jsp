<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 내가 입력한 이름, 주소를 서버에 전달하기 위해서 어떤게 이름이고 어떤게 주소를 입력한 건지 name 붙여주기  -->
	<form action = "testResult2.jsp">
		이름 : <input type="text" name = "name"> <br/>
		주소 : <input type="text" name = "addr"> <br/>
		<input type="submit" value = "전송">
		<!-- 내가 입력해준 내용 중에 어떤게 이름이고, 어떤게 주소인지 서버에 전달이 되고,
		url이 testResult2.jsp로 바뀌고 뒤에 ?name=홍길동&addr=부산시 이렇게 변하고 웹페이지에는 '성공'이 뜸
		-> 즉, [전송] 클릭 시 name에는 홍길동이, addr에는 부산시가 전송이 되었다는 뜻 -->
	</form>
</body>
</html>