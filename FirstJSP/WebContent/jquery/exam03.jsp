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
		$("#getBtn").on("click", function(){
			$.get("process.jsp",
					{ //가지고 갈 데이터
						"id" : $("#id").val(),
						"pwd" : $("#pwd").val(),
						"method" : "get"
					}
			) // get - 콜백함수 안에 적지않고, .done이라는 함수로. 다 하고 나면 연이어서 수행
			.done(function(resp) {
				$("#result").html(resp);
			})
		}) //getBtn
		
		$("#postBtn").on("click", function() {
			//var test = $.post("process.jsp", -> 둘 다 가능
			const test = $.post("process.jsp",
					{
						"id" : $("#id").val(),
						"pwd" : $("#pwd").val(),
						"method" : "post"
					}
			)//post
			test.done(function(resp) {
				$("#result1").html(resp);
			})
		}) //postBtn
		
		$("#ajaxBtn").on("click", function() {
			$.ajax({
				type : "get", //post 해도 됨
				url : "process.jsp",
				data : {
					"id" : $("#id").val(),
					"pwd" : $("#pwd").val(),
					"method" : "ajax"	
				}
			}) // ajax
			.done(function(resp) {
				$("#result1").html(resp);
			})
			.fail(function(e) {
				alert("error : " + e)
			})
		}) // ajaxBtn
	}) // document
	
</script>
<!-- exam02.jsp와 결과는 같지만 다르게 표현 -->
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

</html>