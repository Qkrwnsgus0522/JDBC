<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.BoardVO,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>

<%
	String mid = (String)session.getAttribute("mid");
	// == 아, 세션에 로그인 정보가 "name"이라는 변수명으로 저장되어있구나!

	if (mid == null) { // 로그인안된상태
%>
	<a href="controller.jsp?action=signupPage">회원가입</a>
	<form action="controller.jsp" method="post">
		<input type="hidden" name="action" value="login">
		아이디 : <input type="text" name="mid"><br>
		비밀번호 : <input type="password" name="mpw"><br>
		<input type="submit" value="로그인">
	</form>
<%
	}
	else {
		// form 태그는 input 태그 등으로 "데이터를 보낼수있음"
		// a 태그는 별도로 데이터를 보내지않을때 사용함
		out.println("<a href='controller.jsp?action=mypage'>" + mid + "님 마이페이지</a> <a href='controller.jsp?action=logout'>로그아웃</a>");
	}
%>

<hr>

<table border="1">
	<tr>
		<th>글 번호</th><th>글 제목</th><th>작성자</th>
	</tr>
	<%
		ArrayList<BoardVO> datas = (ArrayList<BoardVO>)request.getAttribute("datas");
		for(BoardVO v : datas){		
	%>
	<tr>
		<td><a href="controller.jsp?action=board&num=<%=v.getNum()%>"><%=v.getNum()%></a></td>
		<td><%=v.getTitle()%></td>
		<td><%=v.getWriter()%></td>
	</tr>
	<%
		}
	%>
</table>
<br>
<%
	if(mid != null){
		out.println("<a href='controller.jsp?action=boardWritePage'>게시글 작성</a>");
	}
%>

</body>
</html>