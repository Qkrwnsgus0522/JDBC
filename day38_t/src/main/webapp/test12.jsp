<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>결제 페이지</h1>
<%=session.getAttribute("member")%>님이 결제하신 상품목록입니다. <br>
<ul>
	<%
		ArrayList<String> datas=(ArrayList<String>)session.getAttribute("datas");
		if(datas == null){
			out.println("장바구니가 비어있습니다!");
		}
		else{
		for(String v:datas){
			out.println("<li>"+v+"</li>");
		}
		}
	%>
</ul>

</body>
</html>