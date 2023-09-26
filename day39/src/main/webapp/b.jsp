<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDAO" class="model.MemberDAO"/>
<jsp:useBean id="mVO" class="model.MemberVO"/>
<jsp:setProperty property="*" name="mVO"/>

<%
	mVO = mDAO.selectOne(mVO);

	if (mVO == null) {
		out.println("<script>alert('로그인 실패...'); history.go(-1);</script>");
	} else {
		session.setAttribute("id", mVO.getMid());
//		out.println("<script>location.href = 'a.jsp';</script>");
		response.sendRedirect("a.jsp");
	}
%>