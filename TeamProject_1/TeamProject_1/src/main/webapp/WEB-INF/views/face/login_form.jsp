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
		div{margin:0 50px;}
	</style>
	
	<script>
		function send(f) {
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			
			if(id == ''){
				alert("아이디를 입력하세요");
				return;
			}
			if(pwd == ''){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			var url = "login_check.do";
			var param = "id=" + encodeURIComponent(id) + "&pwd=" + encodeURIComponent(pwd);
			sendRequest(url, param, resultFn, 'post');
			
		}
		
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				json = (new Function('return'+data))();
				
				if(json[0].result == 'no_id'){
					alert("아이디가 존재하지 않습니다");
					
				}else if(json[0].result == 'no_pwd'){
					alert("비밀번호가 틀립니다");
					
				}else{
					alert("로그인 성공");
					location.href="main_form.do";
				}
			}
		}
	</script>
</head>
<body>
	<form>
		<table border="1">
			<caption><h1>:::로그인:::</h1></caption>

			<tr>
				<th>ID</th>
				<td><input name="id" style="WIDTH:120pt; HEIGHT:23pt;"></td>
				<td rowspan="2">
					<input type="button" style="WIDTH:60pt; HEIGHT:60pt;"
					value="로그인" onclick="send(this.form)">
				</td>
			</tr>
			
			<tr>
				<th>PWD</th>
				<td><input name="pwd" type="password" style="WIDTH:120pt; HEIGHT:23pt;"></td>
			</tr>
		</table>
		
		<div>
			<input type="button" value="회원가입" onclick="location.href='insert_form.do'">
			<input type="button" value="아이디&비번 찾기" onclick="location.href='find.do'">
		</div>
	</form>
</body>
</html>






















