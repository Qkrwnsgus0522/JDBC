<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="jun" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

<script type="text/javascript">
	function signup() { 
		// window.open("새창링크", "새창의 이름", "새창의 속성");
		window.open("signup.jsp", "회원가입 창", "width = 450, height = 300");
	}
	function signin() {
		window.open("signin.jsp", "로그인 창", "width = 450, height = 300");		
	}
</script>

<div id="header">
	<h1>SNS 커뮤니티 실습 프로젝트</h1>
</div>

<div id="gnb">
	<ul>
		<li><a href="main.do">메인으로 가기</a></li>
		<jun:login_logout/>
	</ul>
</div>


<div id="content">
	<section>
		<jun:insertBoard/>
	</section>
	<br>
	<section>
		<c:if test="${ bdatas ne null }">
			<c:forEach var="v" items="${ bdatas }">
				<c:set var="b" value="${ v.board }"/> <!-- 새로운 변수를 생성하는 것 보단 -->
				<c:set var="reply" value="${ v.rdatas }"/> <!-- 멤버변수 접근 연산자를 줄이기 위해 set 사용 -->
				${ b.bid } ${ b.content } <br>
				<c:forEach var="r" items="${ reply }">
					${ r.rid } ${ r.rContent } <br>
				</c:forEach>
				<hr>
			</c:forEach>
		</c:if>
		<!-- 페이지네이션 -->
		<a href="main.do?count=${ count+2 }">[더보기]</a>
	</section>
</div>

<div id="footer">
	<h3>&copy; NAVER corp. | 회사소개 | 이용약관 | 개인정보처리방침 | 고객센터</h3>
</div>

</body>
</html>