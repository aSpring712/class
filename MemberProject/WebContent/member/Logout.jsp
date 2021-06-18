<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 로그아웃 -> 세션을 끊고 로그인 창으로 이동
	//session.removeAttribute(); -> id만 끊는 등..
	session.invalidate(); // 모든 세션을 끊음
	response.sendRedirect("loginForm.jsp");
%>