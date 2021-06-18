<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 문제2 : 성별, 관심분야를 체크하지 않으면 null로 뜨고, 뭔가를 하나라도 체크하면 on이라고 출력됨 -->
	<!-- 문제3 : 관심분야는 1개를 체크하든, 여러개를 체크하든 on이라고만 출력됨 -->
</head>
	<!-- 문제2 해결 -->
	<%
		request.setCharacterEncoding("utf-8"); // 한글 깨짐 처리 -- 값을 받아오기 전에 처리하고 아래에서 받아옴!
		String gender = request.getParameter("gender");
		String hobby = request.getParameter("hobby");
		String job = request.getParameter("job");
	%>
<body>
	이름 : <%=request.getParameter("name") %> <br/> 
	나이 : <%=request.getParameter("age") %> <br/>
	비밀번호 : <%=request.getParameter("pwd") %> <br/>
	성별 : <%=request.getParameter("gender") %> <br/>
	관심분야 : <%=request.getParameter("hobby") %> <br/>
	직업 : <%=request.getParameter("job") %> <br/>
</body>
	<!-- 문제2 해결됨 -->
</html>