<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="member.js"></script> <!-- 이 jsp를 실행할 때, 현재 경로에서 member.js를 찾겠다는 뜻 -->
</head>
<body>
<div align="right"><a href="memberList.jsp">전체보기</a></div>
<div class="container">
  <h2>회원가입</h2>
  <form action="memberPro.jsp" id="frm" method="post">
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    <div class="row"> <!-- 한 줄에 ID 입력받고, 중복확인 버튼도 같이 위치시키려고 -->
	    <div class="col"> <!-- ID 입력받는 곳 -->
	      <label for="userid">UserID:</label>
	      <input type="text" class="form-control" id="userid" placeholder="Enter userid" name="userid" readonly="readonly">
	    </div>
	    <div class="col align-self-end"> <!-- 같은 줄에 중복확인 버튼 -->
	    	<button type="button" id="idCheckBtn" class="btn btn-primary">중복확인</button>
	    </div>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter pwd" name="pwd">
    </div>
    <div class="form-group">
      <label for="pwd_check">Password Check:</label>
      <input type="password" class="form-control" id="pwd_check" placeholder="Enter pwd_check" name="pwd_check">
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="form-group">
      <label for="phone">Phone</label>
      <input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone">
    </div>
    
	<div class="form-check-inline">
		<label class="form-check-label"> 
		<input type="radio" class="form-check-input" name="admin" value="0" checked>일반회원 
			<!-- radio 버튼은 둘 중에 하나만 선택이 되어야 하고(name 통일), 서버에 넘어가는 정보는 달라야 함(value값 다르게 주기) -->
		</label>
	</div>
	<div class="form-check-inline">
		<label class="form-check-label"> 
		<input type="radio" class="form-check-input" name="admin" value="1">관리자
		</label>
	</div>
	<div class="form-group form-check">
    </div>
    
    <button type="button" class="btn btn-primary" id="sendBtn">Submit</button>
    <!-- <button type="submit"> 하면 클릭 시 바로 넘어가니까 button으로 바꾸어줌 -->
  </form>
</div>
</body>
</html>