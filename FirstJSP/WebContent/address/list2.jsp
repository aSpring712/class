<%@page import="com.address.Address"%>
<%@page import="com.address.AddressDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- DB에 있는 내용 보여주는 부분 : 자바 문법 들어가야 함 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	AddressDAO dao = AddressDAO.getInstance();
	ArrayList<Address> arr = dao.getList();
%>
</head>
<body>
<div><a href="insert.jsp">추가하기</a></div>
	<table>
	<thead>
		<tr>
			<th>번호</th><th>이름</th><th>주소</th>
		</tr>
	</thead>
	<tbody>	
<%
	/* for(int i = 0; i < arr.size(); i++) {
		Address ad = arr.get(i);
		} */
	for(Address ad : arr) { // for-each문
%>
		<tr>
			<td><%=ad.getNum() %></td>
			<td><%=ad.getName() %></td>
			<td><%=ad.getAddr() %></td>
		</tr>
<%
	}
%>
	</tbody>
	</table>
</body>
</html>