<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//해당 데이터 삭제 후 다시 list.jsp로 이동시켜서 삭제되지 않은 데이터만 나타나야 함 -> 로직만 들어갈 것이기 때문에 싹 삭제
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	AddressDAO dao = AddressDAO.getInstance();
	dao.addressDelete(num);
	response.sendRedirect("list.jsp");
%>
