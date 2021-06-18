<%@page import="com.exam.ScoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="sb" class="com.exam.ScoreBean"/> <!-- new ~ 이렇게 객체 생성안해도 됨! 아이디는 내가 정하는 것 -->
	<!-- useBean 태그 이용 : 일일이 받아오지 않아도 알아서 받아옴 -->
	<jsp:setProperty property="*" name="sb"/> <!-- property에는 객체 전부 다 넣을거면 *, name에는 객체 sb -->	
<body>
	이름 : <%=sb.getName() %> <br/>
	국어 : <%=sb.getKor() %> <br/>
	영어 : <%=sb.getEng() %> <br/>
	수학 : <%=sb.getMath() %> <br/>
	총점 : <%=sb.getTotal() %> <br/>
	평균 : <%=sb.getAvg() %> <br/>
	학점 : <%=sb.getGrade() %>
	
</body>
</html>