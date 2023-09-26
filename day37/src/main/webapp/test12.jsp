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
	$(document).ready(function() {
		<%
		if (request.getMethod().equals("POST")) {
			MemberVO data = mDAO.selectOne(mVO);
			if (data != null) {
				out.println("alert('" + data.getMid() + "님, 로그인 성공!');");
			}
			else {
				out.println("alert('로그인 실패...');");
			}
		}
		%>
		$('#btn3').click(function() {
			<%
				for(MemberVO v : mDAO.selectAll(null)) {
					%>
					$('#list').append('<li>' + <%= v %> + '</li>');
					<%
				}
			%>
		});
	});
	</script>
	<form method="POST">
		아이디<input type="text" placeholder="아이디" name="mid" required><br>
		비밀번호<input type="password" placeholder="비밀번호" name="mpw" required><br>
		<input type="submit" value="로그인">
		<button>회원가입</button>
	</form>
	<button id="btn3">회원목록</button>
	
	<hr>
	
	<h2>회원목록</h2>
	<div id="wrap">
		<ul id="list">
		<%-- <%
			for(MemberVO v : mDAO.selectAll(null)) {
				// out.println("<li>" + v + "</li>");
		%>
			<li><%= v %></li>
		<%
			}
		%> --%>
		</ul>
	</div>
</body>
</html>