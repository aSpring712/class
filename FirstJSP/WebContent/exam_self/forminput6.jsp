<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<!-- 문제3 : 관심분야는 1개를 체크하든, 여러개를 체크하든 한가지만 출력됨 -->
<body>
	<!-- 문제3 해결하기 : 배열에 담아서 저장하기(formResult5.jsp) -->
	
	<form action="formResult5.jsp" method="post">
		이름 : <input type="text" name="name"> <br/>
		나이 : <input type="text" name="age"> <br/>
		비밀번호 : <input type="password" name="pwd"> <br/>
		성별 : <input type="radio" name="gender" value="남자"> 남자
			   <input type="radio" name="gender" value="여자"> 여자
			    <br/>
		관심분야
		 	   <br/>
			   <input type="checkbox" name="hobby" value="운동"> 운동
			   <input type="checkbox" name="hobby" value="게임"> 게임
			   <input type="checkbox" name="hobby" value="등산"> 등산
			   <input type="checkbox" name="hobby" value="영화"> 영화
			   <br/>
		직업 :
			   <select name ="job">
			   		<option>학생</option>
			   		<option value="공무원">공무원</option>
			   		<option value="회사원">회사원</option>
			   		<option>기타</option>
			   		<!-- 문제3 해결 -->
			   </select>
			   <br/>
		<input type="submit" value="전송">
	</form>
</body>
</html>