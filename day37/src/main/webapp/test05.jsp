<%@page import="java.lang.reflect.Parameter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실습2</title>
</head>
<body>
	<%
		String str = "";
	
		if (request.getMethod().equals("POST")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			if (id.equals("admin") && pw.equals("1234")) {
				str = "관리자님 환영합니다! :D";
			}
			else {
				str = "다시 입력하세요.";
			}
		}
	%>
	<form method="POST">
		아이디 <input type="text" name="id" placeholder="아이디" required><br>
		비밀번호 <input type="password" name="pw" placeholder="비밀번호" required><br>
		<input type="submit" value="로그인">
	</form>
	
	<%= str %>
</body>
</html>