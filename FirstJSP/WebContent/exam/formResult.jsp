<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% //자바문법을 쓸 때에는 스크립트 릿 안에 써주어야 함
	request.setCharacterEncoding("utf-8"); //한글 깨짐 처리 - 값을 받아오기 전에 처리해주어야 함!
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	String pwd = request.getParameter("pwd");
	//String hobby = request.getParameter("hobby"); -> 이렇게 하면 하나만 출력됨
	String[] hobby = request.getParameterValues("hobby"); //여기까지만 하면 주소값 출력됨
	String tmp = "";
	try {
		for(int i = 0; i < hobby.length; i++) { //체크박스에 체크한 갯수만큼 for를 돌면서
			tmp += hobby[i] + "   "; //선택한 걸 "운동 "이런 식으로 차례대로 tmp에 담음
		}
	} catch(NullPointerException e) { //만약 관심분야에 아무 것도 선택하지 않았다면 NullPointerException이 뜸 -> 이것을 해결하기
		tmp = "선택없음"; // 선택한 것이 하나도 없으면 tmp에는 "선택없음"을 대입
	}
%>
</head>
<body>
	이름 : <%=name %> <br/>
	나이 : <%=age %> <br/>
	비밀번호 : <%=pwd %> <br/>
	성별 : <%=gender %> <br/>
	관심분야 : <%=tmp %> <br/> <!-- hobby를 출력하면 주소가 나오므로 tmp에 저장시킨 것들을 출력 -->
	직업 : <%=job %> <br/>
	<hr>
	이름 : <%=request.getParameter("name") %> <!-- 한 번만 쓰고 말거면 위에처럼 굳이 변수에 담지 않고 바로 출력해줘도됨 -->
</body>

</html>
