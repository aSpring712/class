<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() { // 값이 입력되지 않거나, 점수란에 숫자가 아닌 것들이 올 경우 경고창 띄우는 역할
	if(document.getElementById("name").value=="") { //name에 id로 접근해서 그 값이 비어있으면
		alert("이름을 입력하세요");
		return; //종료의 의미 -> 이걸 안써주면 "이름을 입력하세요", "국어 점수를 입력하세요" 다 나옴
	}
	if(document.getElementById("kor").value==""||isNaN(document.getElementById("kor").value)) { //isNaN 문자이면 true 아니면 false
		alert("국어점수(숫자)를 입력하세요");
		return;
	}
	if(document.getElementById("math").value==""||isNaN(document.getElementById("math").value)) { //isNaN 문자이면 true 아니면 false
		alert("수학점수(숫자)를 입력하세요");
		return;
	}
	if(document.getElementById("eng").value==""||isNaN(document.getElementById("eng").value)) { //isNaN 문자이면 true 아니면 false
		alert("영어점수(숫자)를 입력하세요");
		return;
	}
	// 위의 검사들이 다 통화되면 action으로 넘어가야함 -> form을 직접 호출
	frm.submit();
}
</script>
</head>
<body>
	<form action="scoreResult.jsp" method="post" name="frm">
		이름 : <input type = "text" name ="name" id="name"> <br/>
		국어 : <input type = "text" name ="kor" id="kor"> <br/>
		수학 : <input type = "text" name ="math" id="math"> <br/>
		영어 : <input type = "text" name ="eng" id="eng"> <br/>
		<!-- <input type = "submit" value = "성적조회"> submit은 scoreResult.jsp로 넘어가버림(내부적으로 호출하게 되어있음) -->
		<input type = "button" value = "성적조회" onclick="check()">
		<button>성적조회 button</button> <!-- input type submit이 들어있어서 누르면 action으로 가버림 주의! onclick ="check()" 해도!! 그래서 넘어가지 않도록, 이벤트 처리를 하려면 button type="button"으로 해줘야 함 -->
		<input type = "reset" value = "취소">
	</form>
</body>
</html>