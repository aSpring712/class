<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="avo" class="com.jqueryAddress.AddressVO"/>
<jsp:setProperty property="*" name="avo"/>
<%
	JAddressDAO dao = JAddressDAO.getInstance();
	dao.insert(avo);
	response.sendRedirect("addrList.jsp");
%>

<%=avo.getName() %>