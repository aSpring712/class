<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ad" class="com.address.Address"/>
<jsp:setProperty property="*" name="ad"/>
<%
	AddressDAO dao = AddressDAO.getInstance(); // import 시켜야 함 -> getInstance() 호출
	dao.addressInsert(ad); // DB에 값을 넣으려면 값을 들고가야 하니까 () 안에 ad 넣기 -> ad는 Address형
	response.sendRedirect("list.jsp");
%>

<%=ad.getName() %>