<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 문제1 : url이 formResult.jsp로 넘어가면서 입력받은 비밀번호 이런게 모두 뜨는 문제 해결!
	<form action="formResult.jsp">
	<form action="formResult.jsp" method="get">
	둘 다 같은 문장! action 뒤에 아무 것도 적지 않으면 method="get" 방식이 기본!!
	그러나 내가 입력해서 서버로 넘겨지는 내용이 url에 보이지 않도록 하려면 post 방식으로 써주어야 함 -->
	
	<form action="formResult.jsp" method="post">
		이름 : <input type="text" name="name"> <br/>
		나이 : <input type="text" name="age"> <br/>
		비밀번호 : <input type="password" name="pwd"> <br/>
		성별 : <input type="radio" name="gender"> 남자
			   <input type="radio" name="gender"> 여자
			    <br/>
		관심분야
		 	   <br/>
			   <input type="checkbox" name="hobby"> 운동
			   <input type="checkbox" name="hobby"> 게임
			   <input type="checkbox" name="hobby"> 등산
			   <input type="checkbox" name="hobby"> 영화
			   <br/>
		직업 :
			   <select name ="job">
			   		<option value="학생">학생</option>
			   		<option value="공무원">공무원</option>
			   		<option value="회사원">회사원</option>
			   		<option value="기타">기타</option>
			   </select>
			   <br/>
		<input type="submit" value="전송">
	</form>
	<!-- 문제1 해결, 근데 결과 창에서 한글이 다 깨져서 나오는 문제가 발생함.. -->
</body>
</html>