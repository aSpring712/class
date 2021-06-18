<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<!-- 문제2 : 성별, 관심분야를 체크하지 않으면 null로 뜨고, 뭔가를 하나라도 체크하면 on이라고 출력됨 -->
	<!-- 문제3 : 관심분야는 1개를 체크하든, 여러개를 체크하든 한가지만 출력됨 -->
<body>
	<!-- 문제2 해결 : 성별, 관심분야 체크 시 체크한 내용이 출력되도록 하기 -> value 값 지정-->
	
	<form action="formResult4.jsp" method="post">
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
			   		<!-- select의 option들은 버전이 업되면서 value를 적어주지 않아도 '학생', '공무원' 이렇게 알아서 서버로 넘어감
			   		만약에 동일한 내용이 아니라 다르게 전송하고 싶다면 넘겨주고자 하는 값을 value에 적어주면 됨 -->
			   </select>
			   <br/>
		<input type="submit" value="전송">
	</form>
</body>
</html>