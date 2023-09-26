package test;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

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
    	ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
    	for (int i = 0; i < 5; i++) {
    		MemberVO data = new MemberVO();
    		data.setName("홍길동0" + (i + 1));
    		datas.add(data);
    	}
    	
    	datas.add(new MemberVO());
    	datas.add(new MemberVO());
    	
    	MemberVO mVO = new MemberVO();
    	mVO.setName("티모");
    	mVO.setAge(13);
    	
    	//application.setAttribute("datas", datas);
    	// application 역할
    	ServletContext sc =  sce.getServletContext();
    	sc.setAttribute("datas", datas);
    	sc.setAttribute("data", mVO);
    	
    	System.out.println("contextInitialized 로그");
    }
	
}
