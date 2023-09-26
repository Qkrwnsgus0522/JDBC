<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="lb" class="test.LoginBean"/>
<jsp:setProperty property="*" name="lb"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<% lb.check(); %>
	<form method="POST">
		아이디 <input type="text" name="mid" placeholder="아이디" required><br>
		비밀번호 <input type="password" name="mpw" placeholder="비밀번호" required><br>
		<input type="submit" value="로그인">
	</form>
	
	<jsp:getProperty property="result" name="lb"/>
	<%= lb.getResult() %>
</body>
</html>