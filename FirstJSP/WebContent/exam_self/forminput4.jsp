<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 문제1 해결, 한글 깨짐 해결 // 결과 창(formResult3.jsp)에서 값을 받아올 때 더 간단하게 받아오기 -->
	
	<form action="formResult3.jsp" method="post">
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
</body>
</html>