<%@page import="com.exam.DataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   DataBean bean=new DataBean(); //객체 생성
%>
<%=bean.getToday() %>