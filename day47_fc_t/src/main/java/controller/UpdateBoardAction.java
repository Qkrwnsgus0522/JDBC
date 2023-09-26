package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardVO;

public class UpdateBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;
		
		BoardDAO bDAO=new BoardDAO();
		BoardVO bVO=new BoardVO();
		bVO.setContent(request.getParameter("content"));
		bVO.setNum(Integer.parseInt(request.getParameter("num")));
		bVO.setTitle(request.getParameter("title"));
		boolean flag=bDAO.update(bVO);
		if(flag){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("board.do?num="+bVO.getNum());
		}
		
		return forward;
	}

}
