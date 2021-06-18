<%@page import="com.address.Address"%>
<%@page import="com.address.AddressDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
	function searchCheck() {
		if(document.querySelector("#word").value==="") { // 자바스크립트 : '!==', '===' 이렇게 써주어야 함
			alert("검색어를 입력하세요");
			return;
		}
		document.querySelector("#frm").submit();
	}
</script>
<%
	request.setCharacterEncoding("utf-8");
	String field = "";
	String word = "";
	if(request.getParameter("word")!=null) {
		word = request.getParameter("word");
		field = request.getParameter("field");
	}
	AddressDAO dao = AddressDAO.getInstance();
	ArrayList<Address> arr = dao.getList(field, word); //검색 포함
	// int count = dao.getCount();
	int count = dao.getCount(field, word);
%>
</head>
<body>
	<div class="container">
		<h2>전체보기(<%=count %>)</h2>
		<div align = "right">
			<a href="insert.jsp">추가하기</a>	/
			<a href="list.jsp">전체보기</a>
		</div>
		
		<table class="table table-hover mt-5">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
<%
				for(Address ad : arr) {
%>
					<tr>
						<td><%=ad.getNum() %></td>
						<td><a href="detail.jsp?num=<%=ad.getNum()%>"><%=ad.getName() %></a></td>
						<td><%=ad.getAddr() %></td>
						<td><%=ad.getTel() %></td>
					</tr>
<%
				}
%>
			</tbody>
		</table>
		<form action="list.jsp" id="frm"> <!-- 검색! 지금은 action을 굳이 안적어줘도 되긴 함 -->
			<select name="field"> 
				<option value="name">이름</option> <!-- sql문에는 "이름"이 아닌 "name"이라고 전달되어야 함 -->
				<option value="tel">전화번호</option>
			</select>
			<input type="text" name="word" id="word">
			<input type="button" value="검색" onclick="searchCheck()">
		</form>
	</div>
</body>
</html>