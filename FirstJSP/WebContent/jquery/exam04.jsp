<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#b1").click(function() {
			$.get("test.txt", function(resp, status) { // 원래 두번째는 가지고 갈 값 입력하는 부분인데 없으면 생략 가능
				//alert(resp); -> alert 창에 test.txt의 내용이 출력됨
				var str = "데이터: " + resp + " 상태 : "+status
         		$("#result").text(str); //서버가 보내주는 결과값에 html 태그가 없으므로 html말고 그냥 text 사용
			}) 
		}) //b1
		
		$("#b2").click(function() {
			$.get("test.txt", function(resp) {
				var d = JSON.parse(resp); // JSON으로 들어온 결과를 해석해서 d에 담음
				var str = "";
				for(i = 0; i < d.length; i++) {
					console.log(d[i].picture) //크롬 브라우저 Console에 내가 버튼을 누를 때마다 goroman.png, myFace.png 이런게 찍힘
					str += "이름 : " + d[i].irum + "<br>"
				}
				$("#result").html(str);
			})
		})
		$("#b3").on("click", function() {
			var str="";
			$.getJSON("test.txt", function(resp) { // getJSON --> get 방식으로 전달되고, parse까지 처리됨
				$.each(resp, function(key, val) { // -> 반복문 for라고 생각하면 됨, 함수들이 이름없이 바로 선언되어지는 것이 많음
					// key : i의 위치값
					str += "회원번호 : " + val.memberNumber + "<br>";
					str += "이름 : " + val.irum + "<br>";
					str += "이미지 : " + val.picture + "<hr>";
				}) // each
				$("#result").html(str);
			}) //getJSON
		}) // b3
		
	}) //document
	
	
</script>
</head>
<body>
	<button id="b1">결과1</button>
	<button id="b2">결과2</button>
	<button id="b3">결과3</button>
	<div id="result"></div>
</body>
</html>