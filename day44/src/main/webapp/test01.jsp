<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫 페이지</title>
</head>
<body>

<h1>첫 페이지</h1>
<hr>
<ul>
	<c:forEach var="v" items="${ datas }">
		<li>${ v.name } | ${ v.age }</li>
		<li><c:out value="${ v.name }" escapeXml="false"><font color="red">이름없음</font></c:out> | <c:out value="${ v.age }" escapeXml="false"></c:out></li>
	</c:forEach>
	<li>${ data.name } | ${ data.age }</li>
</ul>

</body>
</html>