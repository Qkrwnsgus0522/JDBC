<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${ empty mid }">
	<a href="controller.jsp?action=signupPage">회원가입</a>
	<form action="controller.jsp" method="post">
		<input type="hidden" name="action" value="login">
		<input type="text" name="mid">
		<input type="password" name="mpw">
		<input type="submit" value="로그인">
	</form>
</c:if>
<c:if test="${ not empty mid }">
	<!-- out.println("<button onClick='check()'>"+mid+"님의 마이페이지</button> <a href='controller.jsp?action=logout'>로그아웃</a>"); -->
	<a href='controller.jsp?action=mypagePage'>${ mid }님의 마이페이지</a>
	<a href='controller.jsp?action=logout'>로그아웃</a>
</c:if>
