<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8"); //한글 깨지지 않도록 처리
	//String name = request.getParameter("name"); 이름은 한 번만 출력할거니까 이렇게 변수에 담을 필요 없음
	/* String kor = request.getParameter("kor");
	String math = request.getParameter("math");
	String eng = request.getParameter("eng"); */
	// 다 더해서 총점을 구해야하는데 String 형임... int형으로 변경해줘야 함
	// 기본적으로 request는 문자로 받아옴
	int kor = Integer.parseInt(request.getParameter("kor")); //아무것도 안적고 조회 누르면 오류남 -- 아무것도 안적어놓고 숫자로 바꾸라고? 하면서 NumberFormatException이 뜸(방법1 서버측에서 오류감지하고 try catch, 방법2 클라이언트 측에서 제대로 입력을 해야 전송누를 수 있도록)
	int math = Integer.parseInt(request.getParameter("math"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int tot = kor+math+eng; //여기서 총점을 변수로 담아도 되고 출력할 때 아래에서 계산해도 됨
	// 이름 쓰고, 점수 아무것도 안적어도 에러, 영문자 넣어도 int로 변환 불가해서 에러
	int avg = tot/3; //ex 93
	String grade = "";	
	switch(avg/10) { // 90점대는 모두 9가 되고, 80점대는 모두 8이 되고..
		case 10:
		case 9: grade ="A"; break;
		case 8: grade ="A"; break;
		case 7: grade ="A"; break;
		default: grade ="F";
	}
%>
</head>
<body>
	이름 : <%=request.getParameter("name") %> <br/>
	국어 : <%=kor %> <br/>
	수학 : <%=math %> <br/>
	영어 : <%=eng %> <br/>
	총점 : <%=tot %> <br/>
	평균 : <%=avg %> <br/>
	학점 : <%=grade %>
</body>
</html>