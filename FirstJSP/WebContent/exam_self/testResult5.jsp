<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 'test6.jsp' 파일을 실행시켜서 [전송] 버튼 클릭 시 testResult4.jsp 페이지로 이동하고 내용이 개행되어 출력됨 -->
	
	<% 
		String name = request.getParameter("name"); 
		String addr = request.getParameter("addr"); 
		String tel = request.getParameter("tel");
		out.println(name); 
	%>
		<br/>
	<%
		out.println(addr); 
	%>
		<br/>
	<%
		out.println(tel);
	%>
	
	<hr/>
		이름1 : <% out.println(name); %> <br/>
		주소1 : <% out.println(addr); %> <br/>
		전화번호 : <% out.println(tel); %> <br/>
	
	<hr/>
	이름2 : <%=name %> <br/>
	주소2 : <%=addr %> <br/>
	전화번호3 : <%=tel %>
</head>
<body>
</body>
</html>