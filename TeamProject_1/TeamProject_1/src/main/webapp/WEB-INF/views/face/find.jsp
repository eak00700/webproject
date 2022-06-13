<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>

	<style>
		.i{display:inline;}
		.p{display:inline;}
		#button{width="200px"}
	</style>
	
	<script>
	
		function search_check(num) {
			if (num == '1') {
				document.getElementById("searchPw").style.display = "none";
				document.getElementById("searchId").style.display = "";	
			} else {
				document.getElementById("searchPw").style.display = "";
				document.getElementById("searchId").style.display = "none";
			}
		}
		
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
				var id = json[0].id;
				
				if(json[0].result == 'no_name'){
					alert("존재하지 않는 이름입니다");
					return;
				}
				if(json[0].result == 'no_phone'){
					alert("맞지 않는 번호입니다");
					return;
				}else{
					alert("id : " + id);
				}
				
			}
		}
	</script>
</head>
<body>
	<div class="i">
		<input type="radio" class="custom-control-input" id="search_1" name="search_total"
			 onclick="search_check(1)" checked="checked">
		<label class="custom-control-label font-weight-bold text-white"
			for="search_1">아이디 찾기</label>		
	</div>
	
	<div class="p">
		<input type="radio" class="custom-control-input" id="search_2" name="search_total"
			 onclick="search_check(2)"> 
		<label class="custom-control-label font-weight-bold text-white"
			 for="search_2">비밀번호 찾기</label>
	</div>
	
	<form name="id_form">
		<div id="searchId">
			<div>
				<label class="name_label" for="inputName_1">이름</label>
				<div>
					<input name="name" id="name" autofocus required>
				</div>
			</div>
			<div>
				<label class="phone_label" for="inputName_1">전화번호</label>
				<div>
					<input name="phone" id="phone">
				</div>
			</div><br>
			
			<div>
				<input type="button" value="확인" onclick="find_id()"
					style="WIDTH:62pt; HEIGHT:17pt;">
				<input type="button" value="취소" onclick="location.href='login.do'"
					style="WIDTH:62pt; HEIGHT:17pt;">
			</div>
		</div>
	</form>
	
	<form name="pwd_form">
		<div id="searchPw" style="display:none;">
			<div>
				<label class="name_label" for="inputName_1">ID</label>
				<div>
					<input name="id" id="id">
				</div>
			</div>
			<div>
				<label class="ask_label" for="inputName_1">질문</label>
				<div>
					<select name="ask" style="WIDTH:125px; HEIGHT:21pt;">
					    <option value="">비밀번호 힌트</option>
					    <option value="취미">취미</option>
					    <option value="좋아하는것">좋아하는것</option>
					    <option value="기타">기타</option>
					</select>
				</div>
				
				<div>
					<input name="answer" placeholder="질문에 답을 입력하시요"
							 style="WIDTH:120pt; HEIGHT:17pt;">
				</div><br>					
				
				<div>
				<input type="button" value="확인" onclick="find_pwd()"
					style="WIDTH:64pt; HEIGHT:17pt;">
					
				<input type="button" value="취소" onclick="location.href='login.do'"
					style="WIDTH:64pt; HEIGHT:17pt;">
				</div>
			</div>
		</div>
	</form>	

</body>
</html>














