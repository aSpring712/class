<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
		request.setCharacterEncoding("utf-8"); // 한글 깨짐 처리 -- 값을 받아오기 전에 처리하고 아래에서 받아옴!
		String gender = request.getParameter("gender");
		//String hobby = request.getParameter("hobby");
		String job = request.getParameter("job");
		
		String[] hobby = request.getParameterValues("hobby"); //배열에 담아서 저장할 것임, 여기까지만 하면 주소값만 출력됨
		String tmp = ""; //for문을 돌면서 서버로부터 넘어오는 hobby들을 tmp에 담을 것
		try { //선택을 하나라도 했으면 --> 받은 내용 저장
			for(int i = 0; i < hobby.length; i++) {
				tmp += hobby[i] + " "; //선택한 것들을 tmp에 저장
			}
		} catch(NullPointerException e) { // 아무 것도 선택을 안했으면 해당 오류가 발생하므로 오류 처리
			tmp = "선택 없음";
		}
	%>
<body>
	이름 : <%=request.getParameter("name") %> <br/> 
	나이 : <%=request.getParameter("age") %> <br/>
	비밀번호 : <%=request.getParameter("pwd") %> <br/>
	성별 : <%=request.getParameter("gender") %> <br/>
	관심분야 : <%=tmp %> <br/> <!-- hobby가 아니라 tmp에 담긴 내용 출력해야 함 -->
	직업 : <%=request.getParameter("job") %> <br/>
</body>
	<!-- 문제3 해결됨 -->
</html>