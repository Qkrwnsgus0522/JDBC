<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.MemberVO"%>
<jsp:useBean id="mDAO" class="test.MemberDAO"/>
<jsp:useBean id="mVO" class="test.MemberVO"/>
<jsp:setProperty property="*" name="mVO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<title>실습3</title>
</head>
<body>
	<script type="text/javascript">
		<%
		if (request.getMethod().equals("POST")) {
			
			if (request.getParameter("action").equals("login")) {
				
				MemberVO data = mDAO.selectOne(mVO);
				if (data != null) {
					out.println("alert('" + data.getMid() + "님, 로그인 성공!');");
				}
				else {
					out.println("alert('로그인 실패...');");
				}
			}
			// action값이 signup
			else if (request.getParameter("action").equals("signup")) {
				// 회원가입
				boolean flag = mDAO.insert(mVO);
				if (flag) {
					out.println("alert('회원가입 성공!')");
				} else {
					out.println("alert('회원가입 실패...')");
				}
			}
		}
		%>
		
	</script>
	<script type="text/javascript">
		function signup() {
			var ans = confirm('입력하신 정보로 회원가입할까요?');
			if (ans == true) {
				// form 태그 내부에있는 action의 값이 signup이 될수있게
				// 그 상태로 submit 진행
				document.test.action.value="signup";
				document.test.submit();
			}
			else {
				return;
			}
		}
	</script>
	<form method="POST" name="test">
		<input type="hidden" name="action" value="login">
		아이디<input type="text" placeholder="아이디" name="mid" required><br>
		비밀번호<input type="password" placeholder="비밀번호" name="mpw" required><br>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onClick="signup()">
	</form>
	
	<hr>
	
	<h2>회원목록</h2>
	<div id="wrap">
		<ul>
		<%
			for(MemberVO v : mDAO.selectAll(null)) {
				// out.println("<li>" + v + "</li>");
		%>
			<li><%= v %></li>
		<%
			}
		%>
		</ul>
	</div>
</body>
</html>