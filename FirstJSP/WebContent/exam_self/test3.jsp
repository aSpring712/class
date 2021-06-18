<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- action을 적어주지 않으면 자기 자신 페이지가 Result 역할을 함 -> Result 페이지 만들어주기 -->
	<form action = "testResult.jsp">
		이름 : <input type="text"> <br/>
		주소 : <input type="text"> <br/>
		<input type="submit" value = "전송">
		<!-- 전송 버튼 클릭 시 testResult.jsp 페이지로 이동함. 그러나 지금은 testResult.jsp 파일을 우리가 만들어주지 않아서 에러가 남 -->
		<!-- 따라서 전송 버튼 클릭 시 testResult.jsp 페이지로 이동하며 오류가 아닌 내가 원하는 결과가 뜨도록 'testResult.jsp' 파일 만들어주기 -->
		<!-- 만들어 준 후 다시 test3.jsp를 실행시켜 [전송] 버튼 클릭 시 url을 보면 testResult.jsp로 이동하며 웹에 성공이라고 출력됨 -->
		<!-- 그러나, 아직 내가 입력한 이름과 주소를 실제로 서버에 보낸 것은 아님!! 서버의 입장에서는 내가 입력한 내용 중 어떤게 이름에 해당하는 내용이고,
		어떤게 주소에 해당하는 내용인지 모름 -->
	</form>
</body>
</html>