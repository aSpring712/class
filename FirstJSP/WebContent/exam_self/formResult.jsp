<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<!-- 입력받은 이름, 나이, 비밀번호, 성별, 관심분야, 직업 출력 -->
	<%
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
	<!-- 문제1 : url이 formResult.jsp로 넘어가면서 입력받은 비밀번호 이런게 모두 뜸! -->
	<!-- 문제2 : 성별, 관심분야를 체크하지 않으면 null로 뜨고, 뭔가를 하나라도 체크하면 on이라고 출력됨 -->
	<!-- 문제3 : 관심분야는 1개를 체크하든, 여러개를 체크하든 on이라고만 출력됨 -->
</html>