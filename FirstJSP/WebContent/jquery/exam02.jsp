<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#getBtn").click(function() {
			$.get("process.jsp", // process.jsp로 갈건데 { } 안의 값을 들고 감
				{
				"id" : $("#id").val(),
				"pwd" : $("#pwd").val(),
				"method" : "get" // method는 id, pwd처럼 입력받은 값이 저장되는게 아니고, 그냥 "get"이 저장됨
				}, // 이 값들을 다 들고 간다
				function(data) { // 이걸 다 처리한 결과값 function() : 이게 콜백 함수가 되는 것
					//alert(data); // data : 서버가 처리하는 결과값 -> out.println(str); 이 부분
					$("#result").html(data); // result 영역에 결과값을 표시하겠다 
					// html이라는 함수 -> 값에 태그로 적혀져 있는 글자는 태그가 적용되도록 해주는 함수
				} 
				) // get - get 방식을 쓸 때 함수니까 () 필요, 괄호 안에 (가고자하는 주소, 가지고갈 값, 처리 결과) -> 값을 JSON 형태로 보냄
				// JSON 형태 -> '키 : 값' 형태(자바의 map처럼)로 보냄 
		}) // getBtn -> 전송 클릭 시 함수 실행
		
		/* $("#postBtn").click(function() {
			$.post("process.jsp", {
				"id" : $("#id").val(),
				"pwd" : $("#pwd").val(),
				"method" : "post"
			}, function(resp) {
				//alert(resp);
				$("#result1").html(resp);
			})
		}) */
		
		$("#postBtn").on("click", function() {
			$.post("process.jsp", {
				"id" : $("#id").val(),
				"pwd" : $("#pwd").val(),
				"method" : "post"
			}, function(resp) {
				//alert(resp);
				$("#result1").html(resp);
			})
		}) // postBtn
		
		$("#ajaxBtn").on("click", function() {
			$.ajax({ // 속성으로 전송
				type:"get", // 원하는 방식 적으면 됨
				url : "process.jsp", // 가고자하는 페이지 주소
				data : { // 가져갈 값
					"id":$("#id").val(),
					"pwd":$("#pwd").val(),
					"method" : "ajax"
				},
				success : function(resp) { //성공하면 이 함수(콜백) 처리
					//alert(resp);
					$("#result1").html(resp);
				},
				error : function(e) {
					alert(e + " error"); // alert 창에 [object Object] error가 출력됨 
				}
				
			}); // $.ajax
		}); // ajaxBtn
	}) // document
</script>
</head>
<body>
	id : <input type="text" id="id" name="id"><br>
	pwd : <input type="password" id="pwd" name="pwd"><br>
	<button type="button" id="getBtn">get 전송</button>
	<button type="button" id="postBtn">post 전송</button>
	<button type="button" id="ajaxBtn">ajax 전송</button> 
	<hr>
	<div id="result"></div>
	<div id="result1"></div> 
</body>
<!-- 전송 클릭해도 페이지 이동이 아닌, 서버한테 받은 결과값을 들고 나한테 표시(페이지 이동X) : 비동기 함수 -->
</html>