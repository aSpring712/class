<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ad" class="com.jqueryAddress.AddressVO">></jsp:useBean>
<jsp:setProperty property="*" name="ad"/>
<%
	JAddressDAO avo = JAddressDAO.getInstance();
	avo.update(ad);
	response.sendRedirect("addrList.jsp");
%>