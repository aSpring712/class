<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="formResult.jsp" method="post"> <!-- method="get"이 기본 -->
		이름 : 
			<input type="text" name="name"> <br/>
		나이 : 
			<input type="text" name="age"> <br/>
		비밀번호 : 
			<input type="password" name="pwd"> <br/>
		성별 : 
			<input type="radio" name="gender" value="남자" checked> 남자
			<input type="radio" name="gender" value="여자"> 여자
			<!-- radio는 name을 같은 것으로 지정해주어야 한 개만 선택할 수 있도록 설정됨 -->
			<br/>
		관심분야 <br/>
			<input type="checkbox" name="hobby" value="운동"> 운동
			<input type="checkbox" name="hobby" value="게임"> 게임
			<input type="checkbox" name="hobby" value="등산"> 등산
			<input type="checkbox" name="hobby" value="영화"> 영화
			<br/>
		직업 : 
			<select name="job">
				<option>학생</option> <!-- 안적어줘도 "학생"을 넘겨줌 -->
				<option value="공무원">공무원</option>
				<option value="회사원">회사원</option>
				<option value="기타">기타</option>
			</select>
	  	<br/>
		<input type="submit" value="전송">
	</form>
</body>
</html>