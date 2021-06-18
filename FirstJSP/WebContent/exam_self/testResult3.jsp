<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 'test5.jsp' 파일을 실행시켜서 [전송] 버튼 클릭 시 testResult3.jsp 페이지로 이동하고 서버에 전달된 내용을 내가 원하는 방식으로 출력할 수 있도록
	자바 문법을 이용 -->
	<% // 이걸 '스크립트릿'이라고 하고, 여기 안에 자바문법을 적어줘야 한다 & HTML은 스크립트릿 안에 적어줄 수 없음
		String name = request.getParameter("name"); // name에 '홍길동'이 담아져서 전송되면 그걸 String형 변수 name에 저장
		String addr = request.getParameter("addr"); // addr에 '부산시'가 담아져서 전송되면 그걸 String형 변수 addr에 저장
		out.println(name); // 받아온 name '홍길동' 출력
		out.println(addr); // 받아온 name '부산시' 출력
	%>
</head>
<body>
</body>
</html>