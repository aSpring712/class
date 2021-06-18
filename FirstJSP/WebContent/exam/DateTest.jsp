<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Calendar ca = Calendar.getInstance();
	String[] arr = {"일", "월", "화", "수", "목", "금", "토"}; // 배열은 0 ~ 6까지, 일요일부터 시작하는 배열 만듦
	String day = "";
	switch(ca.get(Calendar.DAY_OF_WEEK)) {
	case 1: day = "일"; break;
	case 2: day = "월"; break;
	case 3: day = "화"; break;
	case 4: day = "수"; break;
	case 5: day = "목"; break;
	case 6: day = "금"; break;
	case 7: day = "토"; break;
	}
%>
</head>
<body>
오늘은
<%=ca.get(Calendar.YEAR) %>년
<%=ca.get(Calendar.MONTH)+1 %>월 <!-- 월은 0부터 count 되므로 +1 해줘야 내가 원하는 그 월이 나옴 -->
<%=ca.get(Calendar.DATE) %>일
<%=ca.get(Calendar.DAY_OF_WEEK) %>요일 <!-- 오늘은 금요일인데 숫자 6이 나옴.. => 배열을 쓰는 등 해서 문자로 바꿔주기 -->
<hr/>
배열요일 : <%=arr[ca.get(Calendar.DAY_OF_WEEK)-1] %>
<hr/>
switch배열 : <%=day %>
</body>
</html>