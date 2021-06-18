<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
		String name = request.getParameter("name");
		String kor = request.getParameter("kor");
		String math = request.getParameter("math");
		String eng = request.getParameter("eng");
		int tot = Integer.parseInt(kor) + Integer.parseInt(math) + Integer.parseInt(eng);
		int avg = tot/3;
	%>
<body>
	이름 : <%=name %> <br/>
	국어 : <%=kor %> <br/>
	수학 : <%=math %> <br/>
	영어 : <%=eng %> <br/>
	총점 : <%=tot %> <br/>
	평균 : <%=avg %> <br/>
</body>
</html>