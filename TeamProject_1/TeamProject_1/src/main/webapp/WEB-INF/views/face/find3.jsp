<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	
	<style>
		table{border-collapse:collapse;}
	</style>
	
	<script>
		function find_id() {
			var f = document.id_form;
			var name = f.name.value.trim();
			var phone = f.phone.value.trim();
			
			if(name == ''){
				alert("이름을 입력하세요");
				return;
			}
			if(phone == ''){
				alert("전화번호를 입력하세요");
				return;
			}
			
			var url = "find_id.do";
			var param = "name=" + encodeURIComponent(name) + "&phone=" + encodeURIComponent(phone);
			sendRequest(url, param, resultId, 'post');
		}
		
		function resultId() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = (new Function('return'+data))();
				
				if(json[0].result == 'no_name'){
					alert("존재하지 않는 이름입니다");
				}
				if(json[0].result == 'no_phone'){
					alert("맞지 않는 번호입니다");
				}else{
					alert();
				}
				
			}
		}
		
		function find_pwd() {
			var f = document.pwd_form;
			var id = f.id.value.trim();
			var ask = f.ask.value.trim();
			var answer = f.answer.value.trim();
			
			f.method = "post";
			f.action = "find_pwd.do";
			f.submit();
		}
	</script>
</head>
<body>
	<form name="id_form">
	<table border="1">
		<caption>아이디 찾기</caption>
		<tr>
			<th>이름</th>
			<td><input name="name" id="name" style="WIDTH:120pt; HEIGHT:23pt;"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input name="phone" id="phone" style="WIDTH:120pt; HEIGHT:23pt;"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="확인"
			 onclick="find_id()" style="WIDTH:176pt; HEIGHT:23pt;"></td>
		</tr>
	</table><br>
	</form>
	
	<form name="pwd_form">
	<table border="1">
		<caption>비밀번호 찾기</caption>
		<tr>
			<th>ID</th>
			<td><input name="id" style="WIDTH:120pt; HEIGHT:23pt;"></td>
		</tr>
		<tr>
			<th rowspan="2">질문&응답</th>
			<td><select name="ask" style="WIDTH:125pt; HEIGHT:23pt;">
				    <option value="">비밀번호 힌트</option>
				    <option value="취미">취미</option>
				    <option value="좋아하는것">좋아하는것</option>
				    <option value="기타">기타</option>
				</select></td>	
		</tr>
		<tr>
			<td><input name="answer" placeholder="질문에 답을 입력하시요"
			 style="WIDTH:120pt; HEIGHT:23pt;"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="확인"
			 onclick="find_pwd()" style="WIDTH:187pt; HEIGHT:23pt;"></td>
		</tr>
	</table>				
	</form>

</body>
</html>











