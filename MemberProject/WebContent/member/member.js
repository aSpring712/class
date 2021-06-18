var exp=/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/ /* 정규식 p.270 000-0000-0000 같은 형태로 입력 받기 위해*/
/* javascript만 있는 파일 */
$(document).ready(function() {
	$("#sendBtn").click(function() {
		if($("#name").val()=="") {
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		if($("#userid").val()=="") {
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		if($("#pwd").val()=="") {
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return false;
		}
		if($("#pwd").val()!=$("#pwd_check").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwd_check").focus(); // 다시 입력할 수 있도록 포커스 이동
			return false;
		}
		if($("#email").val()=="") {
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		/*if(!$("#phone").val().match(exp)) { // match 또는 test 함수 사용 가능
			alert("전화번호 양식이 아닙니다.");
			$("#phone").focus();
			return false;
		}*/
		if(!exp.test($("#phone").val())) { // match 또는 test 함수 사용 가능
			alert("전화번호 양식이 아닙니다.");
			$("#phone").focus();
			return false;
		}
		$("#frm").submit();
	})
	// 아이디 입력창 -> [중복확인] 클릭 시 뜨는 화면
	$("#idCheckBtn").click(function() {
		window.open("idCheck.jsp", "", "width=800 height=500");
	})
	
	// 아이디 중복확인 -> userid를 받아와서 db에 있는지 없는지 확인(있으면 사용 불가, 업으면 사용 가능이라고 알려줘야 함)
	$("#idBtn").on("click", function() {
		if($("#userid").val()=="") {
			alert("아이디를 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			url : "idCheckPro.jsp",
			data : {"userid" : $("#userid").val()},
			success : function(resp) {
				//alert((resp.trim()).length); // trim() 앞 뒤 공백 제거 -> 우리가 yes나 no만 출력하려고 했는데 앞뒤 공백까지 같이 들어가지니까 제거
				if(resp.trim()=="yes") { //공백 제거한 글자가 yes이면
					alert("사용 가능한 아이디입니다.");
					$(opener.document).find("#userid").val($("#userid").val());
					self.close(); //팝업창 닫아줌
				} else {
					alert("사용 불가능한 아이디입니다.");
					$("#userid").val("");
					$("#userid").focus();
				}
			},
			erro : function(e) {
				alert("error : " + e)
			}
		}); //ajax
	})//idBtn
	
}) // document

function del(userid, mode) { // memberList.jsp에서 이 함수를 알아야 사용될 수 있음 -> memberList.jsp에 <script src="member.js"></script> 넣거나 function해서 바로 넣어도 됨
	//alert(userid);
	// 관리자는 삭제할 수 업다는 메시지 출력
	if(mode=='관리자') { // " "   ' ' 상관없음
		alert("관리자는 삭제할 수 없습니다.");
		return; // 함수에서 return 사용 -> 종료의 의미가 있음! -> 아래 "정말 삭제할까요?"를 수행하지 말라는 뜻
	}
	if(confirm("정말 삭제할까요?")) { // 비동기함수 사용
		$.getJSON("memberDeletePro.jsp",  // 삭제 클릭하면 그에 맞게 개수가 변해야 함 -> memberDeletePro.jsp에서 바뀌어야 함(JSON에서 이뤄지는 것)
			{"userid" : userid}, 
			function(resp) {
				var str = "";
				$.each(resp.jarr, function(key, val) {
					str += "<tr>";
					str += "<td>" + val.name + "</td>"
					str += "<td>" + val.userid + "</td>"
					str += "<td>" + val.phone + "</td>"
					str += "<td>" + val.email + "</td>"
					str += "<td>" + val.admin + "</td>"
					str += "<td><a href=javascript:del('" + val.userid+"','" + val.admin+"')>삭제11</a></td>"
					str += "</tr>"
				}) //each
				$("table tbody").html(str);
				$("#countSpan").text(resp.countObj.count);
			}	
		) // getJSON
	} //if
} // function del()