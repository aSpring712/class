<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<!-- 한 번만 출력하고 말 값들이라면 굳이 String name, age.. 이런 식으로 변수 만들지 않아도 됨! 더 간단하게 만들어 주기 -->
	
	<%
		request.setCharacterEncoding("utf-8"); // 한글 깨짐 처리 -- 값을 받아오기 전에 처리하고 아래에서 받아옴!
	%>
<body>
	이름 : <%=request.getParameter("name") %> <br/> 
	나이 : <%=request.getParameter("age") %> <br/>
	비밀번호 : <%=request.getParameter("pwd") %> <br/>
	성별 : <%=request.getParameter("gender") %> <br/>
	관심분야 : <%=request.getParameter("hobby") %> <br/>
	직업 : <%=request.getParameter("job") %> <br/>
</body>
	<!-- 문제1, 한글 깨짐 문제까지 해결 -->
</html>