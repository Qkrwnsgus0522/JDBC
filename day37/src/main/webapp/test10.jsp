<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="lb" class="test.LoginBean"/>
<jsp:setProperty property="*" name="lb"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="POST">
		아이디<input type="text" name="mid"><br>
		비밀번호<input type="password" name="mpw"><br>
		<input type="submit" value="로그인">
	</form>
	
	<script type="text/javascript">
	<%
		if (request.getMethod().equals("POST")) {
			lb.check();
			if(lb.isFlag()) {
			
	%>
			alert('로그인 성공');
	<%
			}
			else {
			
	%>
			alert('로그인 실패')
	<%
			}
		}
	%>
	</script>
</body>
</html>