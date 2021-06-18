<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery를 사용하기 위해 아래 주소 복사 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//$(document).ready(function() { // (document).ready 생략 가능
	$(function() {
		$("#loginBtn").click(function() {
			if($("#userid").val()=="") {
				alert("아이디를 입력하세요");
				$("#userid").focu();
				return false;
			} //userid
			if($("#pwd").val()=="") {
				alert("비밀번호를 입력하세요");
				$("#pwd").focu();
				return false;
			} // pwd
		$.ajax({ //회원인지, 아닌지, 비밀번호가 맞는지 틀렸는지 DB에서 확인
			type:"post",
			url : "loginProcess.jsp",
			data : {"userid" : $("#userid").val(), "pwd" : $("#pwd").val()},
			success : function(resp) {
				//alert(resp); 0 -1 2
				if(resp.trim()==-1) {
					alert("회원이 아닙니다. 회원가입하세요.");
				} else if(resp.trim()==2) {
					alert("비밀번호가 틀립니다. 비밀번호를 확인하세요.");
				} else if(resp.trim()==1) { // 관리자
					alert("관리자 로그인 성공"); 
					// location.href="memberList.jsp"; -> 자바스크립트
					$(location).attr("href","memberList.jsp"); //jquery
				} else if(resp.trim()==0) { // 일반회원
					alert("일반회원 로그인 성공");
					location.href="memberView.jsp";
				}
			},
			error : function(e) {
				alert("error : " + e);
			}
		}) // ajax
		}) // loginBtn
	})// document
</script>
</head>
<body>
<form>
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userid" id="userid"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" name="pwd" id="pwd"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="로그인" id="loginBtn">
				<input type="reset" value="취소">
				<input type="button" value="회원가입" onclick="location.href='memberForm.jsp'"> <!-- a태그X 사이트가 이동되어버림 -->
			</td>
		</tr>
	</table>
</form>
</body>
</html>