package test;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

/**
 * Servlet Filter implementation class EncFilter
 */
// 어노테이션(애너테이션) --> 메모리 효율이 좋아짐
@WebFilter("*.jsp")
public class EncFilter extends HttpFilter implements Filter {
	
	private String encoding;
	
    /**
     * @see HttpFilter#HttpFilter()
     */
    public EncFilter() { // 기본 생성자 필수
        super();
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// 필터가 메모리에서 해제될때 자동 호출
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 인코딩 처리 로직의 위치
//		request.setCharacterEncoding("UTF-8"); // 하드코딩 : 유지보수에 불리함
		// --->> 상수화
		request.setCharacterEncoding(this.encoding);
		// --->> 설정파일을 생성해서 해당 파일의 내용을 로드(불러와서) 사용
		//		: JAVA를 재작성하게되면 재컴파일이 필요함 == 불리
		//		: 서버가 1초이상 정지 == 사용자가 이용 xxxxx
		//		: xml파일 수정은 재컴파일 필요 xx
		
		System.out.println("doFilter 인코딩");
		
		chain.doFilter(request, response);
		// == 사용자의 요청
		// 사용자의 요청정보들이 모두 저장되어있음
		// 사용자의 요청정보를 보고, 무엇을 요청했는지를 찾아서 다음 페이지로 이동하기때문에,
		// 이동하기 전에 인코딩 처리해야함!!!!
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// 필터가 최초로 생성될때 자동 호출
		// '최초로 생성될때' 호출되기때문에 단 1번 호출됨
		this.encoding = fConfig.getServletContext().getInitParameter("encoding"); // 멤버변수 초기화
		// 외부파일에 있는 web.xml의 encoding이라는 param-name의 param-value
		System.out.println("init 동작");
	}

}
