<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 'test6.jsp' 파일을 실행시켜서 [전송] 버튼 클릭 시 testResult4.jsp 페이지로 이동하고 내용이 개행되어 출력됨 -->
	
	<!-- 첫 번째 방법 -->
	<% 
		String name = request.getParameter("name"); 
		String addr = request.getParameter("addr"); 
		out.println(name); 
	%>
		<br/>
		<!-- <br> 태그는 자바 문법이 아닌 HTML 문법이므로 스크립트릿 밖에 적어줌 -->
	<%
		out.println(addr); 
	%>
	
	<hr/>
	<!-- 두 번째 방법 -->
		이름1 : <% out.println(name); %> <br/>
		주소1 : <% out.println(addr); %> <br/>
	
	<!-- 두 가지 방법 중 편한 방법으로 사용하면 되는데, 보통 아래가 더 간결함 -->
	
	<hr/>
	<!--out을 일일히 써주기 귀찮음 : 표현식이라는 게 있음
	out의 표현식은 '<%=' '%>'  -->
	이름2 : <%=name %> <br/>
	주소2 : <%=addr %> <br/>
</head>
<body>
</body>
</html>