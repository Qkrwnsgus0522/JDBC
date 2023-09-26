package controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import model.BoardDAO;
import model.BoardVO;
import model.Crawling;

/**
 * Application Lifecycle Listener implementation class TestListener
 *
 */
@WebListener
public class TestListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public TestListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
        // 리스너가 처음 시작할 때 이 부분에서 크롤링 해주세요~
    	// 그리고 DB에 넣어주세요! :D
    	ArrayList<BoardVO> datas = Crawling.sample();
    	
    	BoardDAO boardDAO = new BoardDAO();
    	for (BoardVO v : datas) {
			boardDAO.insert(v);
    	}
    	
    	System.out.println("contextInitialized 로그");
    }
	
}
