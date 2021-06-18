<%@page import="com.exam.DataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 자바에서 작성한 것 여기에 불러와서 사용하기
	지금 이 파일에는 HTML에 사용하는 태그가 하나도 없어서 이렇게만 써줘도 정상적으로 실행됨 	*/
	DataBean bean = new DataBean(); //디폴트 생성자 이용해 객체 생성 -> 자기 패키지의 것이 아니므로 에러 -> import 시키기
%>
<%=bean.getToday() %>