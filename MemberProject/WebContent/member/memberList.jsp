<%@page import="com.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="member.js"></script> <!-- member.js에 있는 함수를 인식하기 위해 -->
<%
	String sid = (String)session.getAttribute("userid");
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
	ArrayList<MemberDTO> arr = dao.memList(); // list에서 사용하는 arr
	int count = dao.getCount();
%>
</head>
<body>
<div align="right">
<a href="memberView.jsp"><%=sid %> 관리자</a>님 반갑습니다. 
/ <a href="Logout.jsp">로그아웃</a>
</div>
<h3>전체보기(<span id="countSpan"><%=count %></span>)</h3>
<table>
	<thead>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>구분</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
<%
		for(MemberDTO member : arr) {
			String mode = member.getAdmin()==0?"일반회원":"관리자";
%>		
			<tr>
				<td><%=member.getName() %></td>
				<td><%=member.getUserid() %></td>
				<td><%=member.getPhone() %></td>
				<td><%=member.getEmail() %></td>
				<td><%=mode %></td>
				<th><a href="javascript:del('<%=member.getUserid()%>','<%=mode %>')">삭제</a></th> <!-- 클릭 시 del 함수 호출 : javascript 이므로 member.js에 작성 -->
				<!-- member.js에서 userid, mode를 알 수 있도록 -->
			</tr>
<%
		}
%>
	</tbody>
</table>
</body>
</html>