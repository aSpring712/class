<%@page import="com.address.ZipCodeBean"%>
<%@page import="com.address.AddressDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a:link {text-decoration: none; color:#000}
	a:hover {text-decoration: none; color:#000}
	a:visited {text-decoration: none; color:#000}
</style>
<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong"); //zipCheck.jsp에서 오는 동임
	AddressDAO dao = AddressDAO.getInstance();
	ArrayList<ZipCodeBean> zarr = dao.zipcodeRead(dong);
%>
<script>
	function dongCheck() {
		//if(document.getElementById("dong").value=="") {
			if(document.querySelector("#dong").value=="") {
			alert("동이름을 입력하세요");
			//document.getElementById("dong").focus();
			document.querySelector("#dong").focus();
			return;
		}
		//document.getElementById("frm").submit();
			document.querySelector("#frm").submit();
	}
	function send(code, sido, gugun, dong, bunji) { // 검색해서 우편번호, 주소 찾은 것을 클릭하면 insert.jsp 페이지의 우편번호, 주소 칸에 들어가도록하는 함수
		//var address = sido + " " + gugun + " " + dong + " " + bunji;
		const address = sido + " " + gugun + " " + dong + " " + bunji;
		//alert(address);
		//opener.document.getElementById("zipcode").value=code;
		//opener.document.getElementById("addr").value=address;
		opener.document.querySelector("#zipcode").value=code;
		opener.document.querySelector("#addr").value=address;
		self.close();
	}
</script>
</head>
<body>
<b>우편번호 찾기 : 개수<%=zarr.size() %></b>
<form action="zipCheck.jsp" id="frm"> <!-- action 생략해도 됨, 어차피 검색하면 결과를 자기 자신 페이지에 보여줄 것이므로 -->
	<table>
		<tr>
			<td>동이름 입력 : <input type="text" name="dong" id="dong"> <!-- 동을 들고 action에 가야함 -->
			<input type="button" value="검색" onclick="dongCheck()">
			</td>
		</tr>
		<tr>
<%
			if(zarr.isEmpty()) {
%>
				<td>검색 결과 없습니다.</td>	
<%
			} else {
%>
				<td>* 검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
<%
			}
%>
		</tr>
<%
		for(ZipCodeBean z : zarr) {
			String zip = z.getZipcode();
			String sido = z.getSido();
			String bunji = z.getBunji();
			String gugun = z.getGugun();
			String d = z.getDong();
%>
		<tr>
			<td><a href="javascript:send('<%=zip %>', '<%=sido %>', '<%=gugun %>', '<%=d %>', '<%=bunji %>')"><%=zip %> <%=sido %> <%=gugun %> <%=d %> <%=bunji %></a></td> <!-- 주소 클릭 시 우편번호에 우편번호가, 주소에는 주소가 입력되도록 -->
		</tr>
<%
		}
%>
	</table>
</form>

</body>
</html>