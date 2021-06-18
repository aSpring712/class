<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String name = request.getParameter("name"); // 넘어오는 name을 변수 name에 담음
	String addr = request.getParameter("addr");
	String phoneNumber = request.getParameter("phoneNumber");
	out.println("이름 : " + name);
%>
	<br>
<%
	out.println("주소 : " + addr);
%>
	<br>
<%
	out.println("전화번호 : " + phoneNumber);
%>
<body>
	<hr/> <!-- 한 줄 긋기 -->
		<!-- 태그는 여는 태그와, 닫는 태그가 있고. 한 번만 쓸 때는 / 이렇게 닫아주기! -->
		이름1 : <% out.println(name); %><br/>
		주소1 : <% out.println(addr); %><br/>
		전화번호1 : <% out.println(phoneNumber); %><br/>
	<hr/>
		이름2 : <%=name %> <br/> <!-- 개행 -->
		주소2 : <%=addr %> <br/>
		전화번호2 : <%=phoneNumber %>
</body>
</html>