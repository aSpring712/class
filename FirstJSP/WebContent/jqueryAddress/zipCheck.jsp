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
	$("#send").on("click", function() {
		$.getJSON("zipProcess.jsp", // 값 가져가는 방식 -> 비동기 함수 getJSON 사용, zipProcess.jsp로 갔다가 결과값을 들고 다시 자기 자신에게로 갈 것 -> #result 영역에 뿌릴 것 
			{ "dong" : $("#dong").val()}, // 가지고 갈 값
			function(resp) { // 서면 - 결과 513개, 이걸 담으려면 반복문이 필요
				//alert(resp.length);
				var str = "<table>"
				$.each(resp, function(key, val) { // jquery의 each 반복분 사용 - 위에서 받아온 resp 반복 돌리기
					str += "<tr>"
					str += "<td>" + val.zipcode + "</td>"
					str += "<td>" + val.sido + "</td>"
					str += "<td>" + val.gugun + "</td>"
					str += "<td>" + val.dong + "</td>"
					str += "<td>" + val.bunji + "</td>"
					str += "</tr>"
				}) 
				str += "</table>"
				$("#result").html(str);
			}
		) // getJSON
		
	}) // send
	$("#result").on("click", "tr", function() {// 클릭 이벤트 연결 -> 결과 513개가 통째(result)로로 옮겨지면 안되고 한 줄에 대한 정보가 넘어가야 함 result영역의 "tr"이 눌러질 때 function 수행해달라
		var address = $("td:eq(1)", this).text() + " " + // this란, 내가 클릭(선택)한 tr의 첫 번째 값을 받아와서
					  $("td:eq(2)", this).text() + " " +
					  $("td:eq(3)", this).text() + " " +
					  $("td:eq(4)", this).text()
	  			$(opener.document).find("#zipcode").val($("td:eq(0)", this).text());
				$(opener.document).find("#addr").val(address);
				self.close();
	
					   
	}) 
}) // document
</script>
</head>
<body>
	<table>
		<tr>
			<td>동이름<input type="text" name="dong" id="dong"/>
			<input type="button" value="검색" id="send"/>
			</td>
		</tr>
	</table>
	<div id="result"></div> <!-- 비동기 방식 : 페이지 새로고침되지 않고 결과가 나오도록 -->
</body>
</html>