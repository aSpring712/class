<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="com.member.dto.MemberDTO"/>
<jsp:setProperty property="*" name="member"/>

<%
MemberDAOImpl dao = MemberDAOImpl.getInstance();
int flag = dao.memUpdate(member);
if(flag==1) { //정보 수정 시 세션을 끊고 로그인 페이지로 넘김
	session.invalidate();
	response.sendRedirect("loginForm.jsp");
}
%>
