<%@page import="com.jqueryAddress.ZipCodeVO"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong");
	//String dong = "서면";
	JAddressDAO dao = JAddressDAO.getInstance();
	ArrayList<ZipCodeVO> zarr = dao.getZipcode(dong); // JAddressDAO.java에 getZipcode() 함수 만들기
	// JSON으로 서버를 돌려야 원하는 형태로!
	// zarr에 정보가 담겨있는데 이건 java 형태지 JSON 형태가 아님
	// java를 JSON으로 변환시켜줘야 함
	JSONArray jarr = new JSONArray(); // 자바의 array를 담기위한 JSON array! 	
	for(ZipCodeVO z : zarr) {
		JSONObject obj = new JSONObject();
		obj.put("zipcode", z.getZipcode()); //마치 자바의 map
		obj.put("sido", z.getSido());
		obj.put("gugun", z.getGugun());
		obj.put("dong", z.getDong());
		obj.put("bunji", z.getBunji());
		jarr.add(obj);
	}
	out.println(jarr.toString());
%>
