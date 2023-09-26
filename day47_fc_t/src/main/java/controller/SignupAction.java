package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class SignupAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;
		
		MemberDAO mDAO=new MemberDAO();
		MemberVO mVO=new MemberVO();
		mVO.setMid(request.getParameter("mid"));
		mVO.setMpw(request.getParameter("mpw"));
		mVO.setName(request.getParameter("name"));
		boolean flag=mDAO.insert(mVO);
		if(flag){
			request.setAttribute("msg", "회원가입 성공! 로그인후에 이용하세요!");
			request.setAttribute("path", "main.do");
			forward=new ActionForward();
			forward.setPath("alert.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
