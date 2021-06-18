<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 이때까지는 Java Script로 처리했지만, JQuery로 처리하면 더 간단하다(자바스크립트 모음이라고 생각하면 됨) 
	JQuery는 항상 $로 시작함-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 요고 삽입 -->
<!-- <script>
$(document).ready(function() { /* $는 Jquery를 의미함 -- 이것 한 줄이 함수! ()안에 바로 구현, ready... 이거는 아래 form안에 있는 객체 모두를 읽고 시작한다는 뜻! 그렇지 않으면 얘는 저 아래의 변수?들을 알 수 없음*/
   $("#btn").click(function() { //버튼이 눌러지면 실행되도록! # : 아이디, . : 클래스 -- btn이라는 id가
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
}) 
</script> -->
</head>
<body>

<body>
   <form action="scoreResult.jsp" id="frm">
   이름 : <input type="text" name="name" id="name"><br> <!-- id값을 줘야 객체를 찾음  -->
   국어 : <input type="text" name="kor" id="kor"><br>
   수학 : <input type="text" name="math" id="math"><br>
   영어 : <input type= "text" name="eng" id="eng"><br>
   <input type="button" value="성적조회" id="btn"> <!-- submit 불가 -->
   <input type="reset" value="취소" > 
	<!-- 
	<input type ="submit" value="성적조회"> : submit은 클릭시 scoreResult.jsp로 넘어가버림(내부적으로 action을 호출하게 되어있음) 
	<button>성적조회</button> : button도 마찬가지로 input type submit이 들어있어 클릭시 action으로 넘어가버림 주의!!!!-->
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