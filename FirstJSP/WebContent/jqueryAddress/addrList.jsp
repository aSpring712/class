<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() { // document 기다려달라는 의미에서
	$("#btnSearch").click(function() {
		$.ajax({
			type : "get",
			url : "searchProcess.jsp", // 가고자하는 서버 페이지 이름
			data : { // 이 값을 들고 내가 적어준 url로 감
				"field" : $("#field").val(),
				"word" : $("#word").val()
			},
			success : function(resp) { // 값을 잘 들고 갔다오면
				// alert("성공"); // 성공을 띄우고
				// alert(resp);
				// resp를 JSON 형태를 인식해야 함 -> 파싱해야 함
				alert(resp);
				var d = JSON.parse(resp); // resp를 JSON 형태로 해석, 데이터(jarrObj), 갯수(countObj) -> jarrObj를 반복문을 돌려야 함
				var str = "";
				$.each(d.jarrObj, function(key, val) {
					str += "<tr>";
					str += "<td>" + val.num + "</td>";
					str += "<td><a href='addrDetail.jsp?num=" + val.num + "'>" + val.name + "</a></td>";
					str += "<td>" + val.addr + "</td>";
					str += "</tr>";
				})
				$("table tbody").html(str); // 공간을 띄워주면 table 안에있는 tbody를 의미 여기에 결과값을 찍을 것
				$("#cntSpan").text(d.countObj.count); // cntSpan 영역에 개수 찍음
			},
			error : function(e) { // 오류가 나면
				alert("error : " + e) // 이 메시지 띄움
			}
		}) // ajax
	}) // btnSearch click
}) // document
</script>
<%
	JAddressDAO dao = JAddressDAO.getInstance();
	ArrayList<AddressVO> arr = dao.getList();
	int count = dao.addrCount();
%>
</head>
<body>
	<div align="right">
		<a href="insert.jsp">추가하기</a>
	</div>
	<h3>전체보기(<span id="cntSpan"><%=count %></span>)</h3>
	<table>
	<thead>
		<tr>
			<th>번호</th><th>이름</th><th>주소</th>
		</tr>
	</thead>
	<tbody>
<%
		for(AddressVO ad : arr) {
%>
			<tr>
				<td><%=ad.getNum() %></td>
				<td><a href="addrDetail.jsp?num=<%=ad.getNum()%>"><%=ad.getName() %></a></td>
				<td><%=ad.getAddr() %></td>
			</tr>
<%
		}
%>
	</tbody>
	</table>
			<select name="field" id="field"> 
				<option value="name">이름</option> <!-- sql문에는 "이름"이 아닌 "name"이라고 전달되어야 함 -->
				<option value="tel">전화번호</option>
			</select>
			<input type="text" name="word" id="word">
			<input type="button" value="검색" id="btnSearch">
</body>
</html>