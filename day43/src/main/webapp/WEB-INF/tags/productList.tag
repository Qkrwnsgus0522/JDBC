<%@ tag language="java" pageEncoding="UTF-8"%>

<!-- border, bgcolor라는 이름의 변수 생성 -->
<%@ attribute name="border" %>
<%@ attribute name="bgcolor" %>

<jsp:useBean id="pb" class="test.ProductBean"/>

<!-- jsp:doBody : 몸체로 전달받은 내용을 사용 -->
<h1><jsp:doBody/></h1>
<hr>

<ul>
	<% for (String v : pb.getPdatas()) { %>
		<li><%= v %></li>
	<% } %>
</ul>

<hr>

<table border="${border}" bgcolor="${bgcolor}">
	<% for (String v : pb.getPdatas()) { %>
		<tr><td><%= v %></td></tr>
	<% } %>
</table>