<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>

	<script>
		function send(f) {
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			var name = f.name.value.trim();
			var email = f.email.value.trim();
			var phone = f.phone.value.trim();
			var ask = f.ask.value;
			var answer = f.answer.value;
			var gender = f.gender.value;
			var addr = f.addr.value.trim();
			
			var idcheck = false;
			
			var id_pattern = /^[a-zA-Z]+$/;
			if(!id_pattern.test(id)){
				alert("아이디형식이 올바르지 않습니다");
				return;
			}
			
			var pwd_pattern = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/;
			if(pwd == ''){
				alert("비밀번호 형식이 올바르지않습니다");
				return;
			}
			
			var name_pattern = /^[가-힣]{2,4}$/;
			if(!name_pattern.test(name)){
				alert("이름이 올바르지 않습니다");
				return;
			}
			
			var e_pattern = 
				/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(!e_pattern.test(email)){
				alert("이메일 형식이 올바르지 않습니다");
				return;
			}
			
			var p_pattern =
				/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			if(!p_pattern.test(phone)){
				alert("전화번호 형식이 올바르지 않습니다");
				return;
			}
			if(ask == ''){
				alert("질문을 선택하세요");
				return;
			}
			if(answer == ''){
				alert("답변을 입력하세요");
				return;
			}
			if(gender == ''){
				alert("성별을 선택하세요");
				return;
			}
			if(addr == ''){
				alert("주소를 입력하세요");
				return;
			}
			
			f.action = "insert.do";
			f.method = "post";
			f.submit();
			
		}
		
		function id_check() {
			var id = document.getElementById("id").value;
			
			if(id == ''){
				alert("아이디를 먼저 입력하세요");
				return;
			}
			
			var url = "id_check.do";
			var param = "id=" + encodeURIComponent(id);
			sendRequest(url, param, resultFn, 'post');
		}
		
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var data = xhr.responseText;
				var json = (new Function('return'+data))();
				
				if(json[0].result == 'no'){
					alert("이미 사용중인 아이디 입니다");
					return;
				}else{
					alert("사용가능한 아이디 입니다");
					idcheck = true;
				}
			}
		}
		
		function change() {
			idcheck = false;
		}
	</script>
	
</head>
<body>
	<form>
		<table border="1">
			<caption>회원가입</caption>
			<tr>
				<th>ID</th>
				<td>
					<input name="id" id="id" onchange="change();">
					<input type="button" value="중복체크" onclick="id_check()">
				</td>
			</tr>
			
			<tr>
				<th>PWD</th>
				<td><input name="pwd" type="password"></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
			</tr>
			
			<tr>
				<th>email</th>
				<td><input name="email"></td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td><input name="phone"></td>
			</tr>
			<tr>
				<th rowspan="2">질문&응답</th>
				<td><select name="ask">
					    <option value="">비밀번호 힌트</option>
					    <option value="취미">취미</option>
					    <option value="좋아하는것">좋아하는것</option>
					    <option value="기타">기타</option>
					</select></td>	
			</tr>
			
			<tr>
				<td><input name="answer" placeholder="질문에 답을 입력하시요"></td>
			</tr>
			
			<tr>
				<th>gender</th>
				<td><select name="gender">
					    <option value="">성별</option>
					    <option value="남">남</option>
					    <option value="여">여</option>
					</select></td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input name="addr"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="가입" onclick="send(this.form)">
					<input type="button" value="취소" onclick="location.href='login.do'">
				</td>
			</tr>
			
	

			
		</table>
	</form>
</body>
</html>










