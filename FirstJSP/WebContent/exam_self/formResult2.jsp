<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<!-- method="post" 시 한글이 다 깨져서 전달받은 내용이 출력되는 문제 해결
	받아올 때부터 한글 깨짐 처리를 해주어야 함 -->
	
	<%
		request.setCharacterEncoding("utf-8"); // 한글 깨짐 처리 -- 값을 받아오기 전에 처리하고 아래에서 받아옴!
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String hobby = request.getParameter("hobby");
		String job = request.getParameter("job");
	%>
<body>
	이름 : <%=name %> <br/> 
	나이 : <%=age %> <br/>
	비밀번호 : <%=pwd %> <br/>
	성별 : <%=gender %> <br/>
	관심분야 : <%=hobby %> <br/>
	직업 : <%=job %> <br/>
</body>
	<!-- 문제1, 한글 깨짐 문제까지 해결 -->
</html>