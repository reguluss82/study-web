package och17;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/*
1. 필터 클래스를 작성핛 때는 서블릿 규격서에 정해져 있는 규칙을 지켜야 한다. 
그 중 가장 중요한 규칙은 javax.servlet.Filter 인터페이스를 구현해야 한다는 것. 
2. Filter 인터페이스에는 다음과 같은 세 개의 메서드가 있다. 
① doFilter 메서드는 웹 브라우저가 웹 컨테이너로 요청을 보냈을 때 호출되는 메서드. 
② init 메서드는 필터의 초기화 작업이 수행될 때 호출되는 메서드.
③ destroy 메서드는 필터가 웹 컨테이너에 의해 제거되기 직전에 호출되는 메서드.
3. doFilter 메서드의 첫 번째와 두 번째 파라미터는 요청 객체와 응답 객체이며, 필터가 없었더라면
이 두 객체는 웹 컨테이너가 웹 컴포넌트로 직접 넘겨주었을 것이다.
doFilter 메서드의 세 번째 파라미터는 필터 체인을 표현하는 FilterChain 객체
*/
@WebFilter("/sub3/*") // annotation 이용 sub3 이하 실행될때 filter 실행
public class Greet implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Sub3에서 수행 Filter");
		chain.doFilter(request, response);//Filter chain 의 다음멤버 호출

	}

}
