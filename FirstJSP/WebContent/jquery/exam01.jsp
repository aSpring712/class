<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="exam01_process.jsp" method="post">
		id : <input type="text" id="id" name="id"><br>
		pwd : <input type="password" id="pwd" name="pwd"><br>
		<button>전송</button>
		<!-- <button type="submit">전송</button> 동일 -->
	</form>
</body>
<!-- 지금은 전송 클릭 -> action으로 가서 exam01_process.jsp 페이지로 이동해서 결과 출력 -->
</html>
