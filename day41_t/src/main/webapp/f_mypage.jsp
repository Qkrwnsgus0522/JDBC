<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	function remove(){
		var ans=confirm("정말로 탈퇴하시겠습니까???");
		if(ans==true){
			document.form.action.value='deleteMember';
			document.form.submit();
		}
	}
</script>

<%
	MemberVO data=(MemberVO)request.getAttribute("data");
%>
<form name='form' action="controller.jsp" method="post">
	<input type="hidden" name="action" value="updateMember">
	아이디 <input type="text" name="mid" readonly value='<%=data.getMid()%>'> <br>
	비밀번호 <input type="password" name="mpw" value='<%=data.getMpw()%>'> <br>
	이름 <input type="text" name="name" value='<%=data.getName()%>'> <br>
	<input type="submit" value="회원정보변경"> <input type="button" value="회원탈퇴" onClick='remove()'>
</form>

<br>

<a href="controller.jsp?action=main">메인으로 돌아가기</a>


</body>
</html>