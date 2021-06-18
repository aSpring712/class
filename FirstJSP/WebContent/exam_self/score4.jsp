<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<body>
   <form action="scoreResult4.jsp" id="frm">
   이름 : <input type="text" name="name" id="name"><br> <!-- id값을 줘야 객체를 찾음  -->
   국어 : <input type="text" name="kor" id="kor"><br>
   수학 : <input type="text" name="math" id="math"><br>
   영어 : <input type= "text" name="eng" id="eng"><br>
   <input type="button" value="성적조회" id="btn"> <!-- submit 불가 -->
   <input type="reset" value="취소" >
   </form> 
   <script> //document ready 어쩌고를 쓰고싶지 않으면 인식 다 한 뒤에 불러서 쓸 수 있도록 이렇게 쓰고, 아니면 그냥 이거 지우고 저 위에다가 원래대로(주석처리 풀고) 하면 됨
      $("#btn").click(function() { //버튼이 눌러지면 실행되도록! # : 아이디, . : 클래스 --> btn이라는 id가
         if($("#name").val()=="") {
            alert("이름을 입력하세요");
            return;
         }
         if($("#kor").val()=="" || !$.isNumeric($("#kor").val())) { //숫자이면 true이니까, 숫자가 아니면 걸리도록 !
            alert("국어점수(숫자) 입력하세요");
            return;
         }
         if($("#math").val()=="" || !$.isNumeric($("#math").val())) {
            alert("수학점수(숫자) 입력하세요");
            return;
         }
         if($("#eng").val()=="" || !$.isNumeric($("#eng").val())) {
            alert("영어점수(숫자) 입력하세요");
            return;
         }
         $("#frm").submit();
      })  
   </script>
</body>
</html>