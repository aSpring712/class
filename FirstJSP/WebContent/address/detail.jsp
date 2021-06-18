<%@page import="com.address.Address"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num")); 
	AddressDAO dao = AddressDAO.getInstance();
	Address ad = dao.findByNum(num);
%>
<script>
	function del() {
		//alert("삭제");
		//flag = confirm("정말 삭제할까요?"); // [확인] [취소]
		//alert(flag); //각각 선택 시 어떤 값이 넘어오는지 확인 -> 확인 true, 취소 false
		if(confirm("정말 삭제할까요?")) { // 얘의 결과는 true, false 나옴 -> true 시 삭제
			location.href="deletePro.jsp?num=<%=num%>"; 
		}
	}
	function zipfinder() {
		window.open("zipCheck.jsp", "", "width=700 height=400");
	}
</script>
</head>
<body>
	상세보기
	<form action="updatePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num %>"> <!-- 사용자에게 보여지지는 않지만 num을 전달해야 해당 번호의 사람의 인적사항을 수정 가능 -->
		<table>
			<tr>
				<th>이름</th> 
				<td><input type="text" name="name" value="<%=ad.getName() %>"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="zipcode" id="zipcode" size="7" value="<%=ad.getZipcode() %>">
				<input type="button" value="검색" onclick="zipfinder()">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" id="addr" size="50" value="<%=ad.getAddr() %>"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" value="<%=ad.getTel() %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정"> <!-- action을 안적으면 자기자신에게로 감 -->
					<input type="button" value="함수삭제" onclick="del()">
					<input type="button" value="전체보기" onclick="location.href='list.jsp'">
					<input type="reset" value="취소">
			</tr>
		</table>
	</form>
</body>
</html>
