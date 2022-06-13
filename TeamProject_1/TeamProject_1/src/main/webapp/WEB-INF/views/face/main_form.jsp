<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="check_login.jsp"/>
	<div>
	${ vo.name }님 환영합니다
	<input type="button" value="로그아웃" 
			onclick="location.href='logout.do'">
	</div>
	
	<c:forEach var="vo" items="${ list }">
		<div>
			<div>작성자 : ${ vo.id }</div>
			
		</div>
	</c:forEach>
	
</body>
</html>