<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cb" class="test.CalcBean"/>
<%--
	액션태그 == 객체화
	test.CalcBean cb = new test.CalcBean();
	CalcBean cb = new CalcBean();
 --%>
 <jsp:setProperty property="*" name="cb"/>
 <%-- cb라는 객체의 멤버변수 초기화 --%>
 <%-- 객체의 멤버변수 이름과 파라미터 이름을 일치시키기 --%>
 <%-- 멤버변수를 초기화할때에 name값을 보고 자동호출
 	자동 형변환 처리됨
 	setter 메서드를 전부 호출 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 분리하기</title>
</head>
<body>
	<% cb.calculate(); %>
	<form method="post"> 
		<input type="number" name="num1">
		<select name="op">
			<option>+</option>
			<option>-</option>
		</select>
		<input type="number" name="num2">
		<input type="submit" value="결과확인">
	</form>
	
	<hr>
	
	계산결과 : <jsp:getProperty property="result" name="cb"/>
	<%= cb.getResult() %>
</body>
</html>