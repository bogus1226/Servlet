<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보입력</title>
</head>
<body>
	<form method="get" action="/database/ex02/insert">
		<label>이름</label><input type="text" name="name">
		<label>생년월일</label><input type="text" name="birthday">
		<label>이메일</label><input type="text" name="email">
		<button type="submit">입력</button>
	</form>
	
</body>
</html>