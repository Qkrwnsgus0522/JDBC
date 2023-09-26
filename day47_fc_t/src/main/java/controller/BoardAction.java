package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardVO;

public class BoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;
		
		BoardDAO bDAO=new BoardDAO();
		BoardVO bVO=new BoardVO();
		bVO.setNum(Integer.parseInt(request.getParameter("num")));
		bVO=bDAO.selectOne(bVO);
		if(bVO!=null){
			request.setAttribute("data", bVO);
			
			forward=new ActionForward();
			forward.setPath("d_board.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
