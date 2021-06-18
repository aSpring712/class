<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- submit : 서버한테 전송해달라! -> 지금처럼 쓰면 안되고 <form> 객체로 써야 함 -->
	<form>
		이름 : <input type="text"> <br/>
		주소 : <input type="text"> <br/>
		<input type="submit" value = "전송">
		<!-- 이제는 이름과 주소를 입력하고 '전송' 버튼을 누르면 url이 바뀌고, 이름과 주소를 입력한게 사라짐 -> 서버 페이지에 전송된 것 -->
		<!-- 그러나 우리는 아직 서버 페이지가 없음 -->
	</form>
</body>
</html>