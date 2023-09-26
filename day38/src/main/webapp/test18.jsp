<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 후 다시 페이지로 --%>
<jsp:useBean id="mDAO" class="test.MemberDAO"/>
<jsp:useBean id="mVO" class="test.MemberVO"/>
<jsp:setProperty property="*" name="mVO"/>
<%
	String mid = request.getParameter("mid");
	String mpw = request.getParameter("mpw");
	
	// 이 mid와 이 mpw를 사진 회원이 있니?
	mVO = mDAO.selectOne(mVO);
	//		없어도 test17.jsp로 가는데, 로그인 실패! 안내
	if (mVO == null) {
		out.print("<script>alert('로그인 실패...'); location.href = history.go(-1)</script>");
	}
	//		있으면 test17.jsp로 가고
	else {
		session.setAttribute("name", mVO.getName());
		
		response.sendRedirect("test17.jsp");
	}
	
	
	session.setAttribute("name", mid);
	
	response.sendRedirect("test17.jsp");
%>