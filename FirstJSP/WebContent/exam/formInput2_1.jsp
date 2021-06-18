<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() { //이렇게만 적어줘도 됨 // $(document).ready(function() { 대신
	$("#btn").click(function() {
		if($("#name").val() == "") { //이름을 안적었으면
			alert("이름을 입력하세요");
			return false; // 원래 return false라고 써야하는데 JQuery 버전 업이 되면서 return이라고만 써도 됨
		}
		if($("#age").val() == "" || !$.isNumeric($("#age").val())) { //나이를 안적었거나 나이가 숫자가 아니라면
			alert("나이(숫자로)를 입력하세요");
			return;
		}
		if($("#pwd").val() == "") { //비밀번호를 안썼으면
			alert("비밀번호를 입력하세요");
			return;
		}
		//라디오! 위처럼 id가 없음.... 성별을 체크하지 않은 경우 
		if($("input:radio[name=gender]:checked").length==0) { // 앞에 아무것도 없는 것은 태그선택자!(유일한 게 아니라서 id가 없으므로) input 타입 중에서도 radio인것 중에서도 name이 gender인것 중에 선택된 것의 길이가 0인 경우 --> 선택이 안된경우
			alert("성별을 선택하세요");
			return false;
		}
		if($("input:checkbox[name=hobby]:checked").length==0) { // input 타입 중에서도 checkbox인것 중에서도 name이 hobby인것 중에 선택된 것의 길이가 0인 경우 --> 선택이 안된경우
			alert("취미를 한가지 이상 선택하세요");
			return false;
		}	
		$("#frm").submit();
	})
})
</script>
</head>
<body>
	<form action="formResult.jsp" method="post" id="frm"> <!-- method="get"이 기본 -->
		이름 : <input type="text" name="name" id="name"> <br/>
		나이 : <input type="text" name="age" id="age"> <br/>
		비밀번호 : <input type="password" name="pwd" id="pwd"> <br/>
		성별 : <input type="radio" name="gender" value="남자"> 남자
			  <input type="radio" name="gender" value="여자"> 여자 
			  <br/>
		관심분야 <br/>
			<input type="checkbox" name="hobby" value="운동"> 운동
			<input type="checkbox" name="hobby" value="게임"> 게임
			<input type="checkbox" name="hobby" value="등산"> 등산
			<input type="checkbox" name="hobby" value="영화"> 영화
			<br/>
		직업 : 
			<select name="job"> <!-- id = "job" 삭제.. 왜냐면 어차피 하나는 선택되어있음 -->
				<option>학생</option> <!-- 안적어줘도 "학생"을 넘겨줌 -->
				<option value="공무원">공무원</option>
				<option value="회사원">회사원</option>
				<option value="기타">기타</option>
			</select><br/>
		<input type="button" value="전송" id="btn">
	</form>
</body>
</html>