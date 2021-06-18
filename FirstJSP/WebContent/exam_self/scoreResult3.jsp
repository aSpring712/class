<%@page import="com.exam.ScoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8"); //한글 처리
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	//자바 이용! 객체 만들기 -> 반드시 import 시키기
	ScoreBean sb = new ScoreBean();
	sb.setName(name);//setter를 이용해 값을 넣음
	sb.setKor(kor);
	sb.setEng(eng);
	sb.setMath(math);
%>
</head>
	
<body>
	이름 : <%=name %> <br/>
	이름 2 : <%=sb.getName() %> <br/>
	국어 : <%=sb.getKor() %> <br/>
	영어 : <%=sb.getEng() %> <br/>
	수학 : <%=sb.getMath() %> <br/>
	총점 : <%=sb.getTotal() %> <br/>
	평균 : <%=sb.getAvg() %> <br/>
	학점 : <%=sb.getGrade() %>
</body>
</html>