<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<a href="controller.jsp?action=updateMemberPage">회원정보변경</a>
	<a href="controller.jsp?action=deleteMember&mid=<%= session.getAttribute("mid") %>">회원탈퇴</a>
	
	<br>
	
	<a href="controller.jsp?action=main">메인으로 돌아가기</a>
</body>
</html>