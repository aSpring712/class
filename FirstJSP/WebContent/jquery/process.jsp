<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String method = request.getParameter("method");
	String str = "[처리결과]<br>";
	str += "id : " + id + "<br>";
	str += "pwd : " + pwd + "<br>";
	str += "method : " + method + "<br>";
	out.println(str); // 서버가 보내주는 결과값 -> 이걸 data가 받아감
	
	// 즉, 콜백함수 : 서버페이지가 보내주는 값 -> '화면에 출력되어지는 것을 그대로 들고옴'
%>
