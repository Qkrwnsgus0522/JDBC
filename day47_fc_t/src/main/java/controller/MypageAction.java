package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;

		MemberDAO mDAO=new MemberDAO();
		MemberVO mVO=new MemberVO();
		mVO.setMid(request.getParameter("mid")); // V에서 받아와야함
		mVO.setMpw(request.getParameter("mpw")); // V에서 받아와야함
		mVO=mDAO.selectOne(mVO);
		if(mVO!=null){
			request.setAttribute("data", mVO);
			forward=new ActionForward();
			forward.setPath("f_mypage.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
