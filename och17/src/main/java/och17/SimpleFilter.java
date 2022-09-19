package och17;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/*필터 클래스를 작성한 다음에 해야 할 일은 다음과 같다. 
① 필터 클래스를 컴파일한다. 
② 컴파일 결과물을 웹 컨테이너에 설치한다. 
③ 필터 클래스를 web.xml 파일에 등록한다*/
public class SimpleFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter 시작");
	      // 또 다른 Filter 수행
	      chain.doFilter(request, response);
	      System.out.println("Filter 끝");

	}

}
