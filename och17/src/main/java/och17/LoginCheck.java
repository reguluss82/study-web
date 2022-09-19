package och17;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/sub2/*") //annotation sub2
public class LoginCheck implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		/* session
		 * 2) request 객체로 부터 생성 ① HttpSession 변수 = request.getSession() ② 위의 경우는 세션이 있으면
		 * 그 세션을 리턴하고 없으면 새로 생성해서 리턴 ③ 만일 생성된 경우에만 리턴받고자 하는 경우는 getSession에 매개변수로 false를
		 * 전달
		 * 
		 * ServletRequest request 에 session 객체가 없어서 HttpServletRequest casting 후 session 사용
		 */
		HttpServletRequest  httpServletRequest  = (HttpServletRequest)  request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		// Session 도출 방법
		HttpSession session = httpServletRequest.getSession();
		System.out.println("LoginCheck doFilter ...");
		if (session == null || session.equals("")) {
			httpServletResponse.sendRedirect("../login.jsp");
		}
		String id = (String)session.getAttribute("id");
		if (id == null || id.equals("")) {
			httpServletResponse.sendRedirect("../login.jsp");
		}
		// 권한체크할때 이런 방식으로 , 나중에 spring 인터셉터 aop 로 사용할것
		// pass the request along the filter chain
		chain.doFilter(request, response);


	}

}
