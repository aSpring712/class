<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 한글 처리
%>
<jsp:useBean id="member" class="com.member.dto.MemberDTO"/>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
	dao.memInsert(member);
	response.sendRedirect("loginForm.jsp");
%>