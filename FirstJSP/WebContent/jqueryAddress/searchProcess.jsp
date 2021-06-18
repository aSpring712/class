<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String field = request.getParameter("field");
	String word = request.getParameter("word");
	JAddressDAO dao = JAddressDAO.getInstance();
	ArrayList<AddressVO> sarr = dao.searchList(field, word);
	int count = dao.searchCount(field, word); // 검색 시 개수
	// 결과인 sarr을 자바 형태로 보여주면 안됨, JSON 형태로 변환해야 함
	
	// 검색 결과와 결과의 개수를 두개 다 받아오기 위해서 mainObj, countObj 만듦
	// mainObj(루트)
	JSONObject mainObj = new JSONObject();
	
	// countObj
	JSONObject countObj = new JSONObject();
	countObj.put("count", count);
	
	JSONArray jarr = new JSONArray();
	for(AddressVO avo : sarr) {
		JSONObject obj = new JSONObject(); // avo를 jSON 객체로 만듦
		obj.put("num", avo.getNum());
		obj.put("name", avo.getName());
		obj.put("addr", avo.getAddr());
		obj.put("tel", avo.getTel());
		obj.put("zipcode", avo.getZipcode());
		jarr.add(obj);
	}
	mainObj.put("countObj", countObj);
	mainObj.put("jarrObj", jarr);
	// 두개의 결과를 mainObj에 저장 -> mainObj를 출력(return은 하나밖에 안되기 때문에)
	
	//out.println(jarr.toString()); // jarr의 값(결과값)을 문자형으로 출력
	out.println(mainObj.toString());
	// 이 값을 들고 
%>