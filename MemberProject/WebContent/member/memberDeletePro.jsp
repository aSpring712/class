<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
	dao.memDelete(userid);
	ArrayList<MemberDTO> arr = dao.memList(); // 전체보기 - 자바코드 : 화면에 삭제하고 난 후의 결과를 돌려줘야 함(JSON 형태로)
	int count = dao.getCount(); // 개수 : 자바코드
	// arr(java)  <=====>  JSON  변환 -> lib의 json-simple.jar
	JSONObject mainObj = new JSONObject(); //루트
	
	JSONArray jarr = new JSONArray(); //데이터
	for(MemberDTO member : arr) {
		String mode = member.getAdmin() == 0 ? "일반회원" : "관리자";
		JSONObject obj = new JSONObject();
		obj.put("name", member.getName());
		obj.put("userid", member.getUserid());
		obj.put("email", member.getEmail());
		obj.put("phone", member.getPhone());
		obj.put("pwd", member.getPwd());
		obj.put("admin", mode);
		jarr.add(obj); // 회원들 내용
	}
	// 개수 ==> JSON
	JSONObject countObj = new JSONObject();
	countObj.put("count", count);
	
	// 루트(mainObj)에 데이터와 개수를 추가
	mainObj.put("jarr", jarr);
	mainObj.put("countObj", countObj);
	
	out.println(mainObj.toString());
%>