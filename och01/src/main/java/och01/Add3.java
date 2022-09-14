package och01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 
1. 웹프로그래밍이란, 웹어플리케이션을 구현하는 행위 .
2. 웹어플리케이션이란, 웹을 기반으로 작동되는 프로그램
- WAS : Web and Application Server
- 프로토콜(Protocol) : 네트워크상에서 약속한 통신규약 (Http, FTP, SMTP, POP, DHCP)
- HTTP : HyperText Transfer Protocol 문서를 전송하기 위한 약속
- FTP  : File Transfer Protocol 파일 전송 프로토콜: 네트워크상에서 컴퓨터들이 파일을 교환하기 위한 통신 규약
- SMTP : Simple Mail Transfer Protocol 간이 우편 전송 프로토콜: 이메일 전송에 사용되는 통신 규약

- IP : 네트워크상에서 컴퓨터를 식별할 수 있는 주소
- DNS : IP주소를 인간이 쉽게 외우도록 맵핑한 문자열
- Port : IP주소가 컴퓨터를 식별할 수 있게 해준다면,
         Port번호는 해당컴퓨터의 구동되고 있는 프로그램을 구분할 수 있는 번호

URI는 URL의 의미를 포함. 
-URL(Uniform Resource Locator)  : 자원이 실제로 존재하는 위치를 가리킨다.
-URI(Uniform Resource Identifier) : 자원의 위치뿐만 아니라 자원에 대한 고유 식별자

3계층형(3-Tier) 아키텍처
3tier : 프레젠테이션 계층 <-> 애플리케이션 계층 <-> 데이터계층
- 프레젠테이션 계층 : 사용자 요청을 받아서 화면에 표시(브라우저-웹서버)
- 애플리케이션 계층 : 무엇을 할지 판단해서 필요한 경우 데이터계층에 질의(애플리케이션 서버)
- 데이터계층 : 데이터 입출력을 담당(데이터베이스 서버)
장점 : 서버 부하 집중개선, 클라이언트 단말의 정기업데이트 불필요, '처리반환'에 의한 서버 부하 저감
단점 : 구조가 클라이언트-서버 구성보다 복잡

1.서블릿은 JSP 표준이 나오기 전에 만들어 진 표준으로 자바에서
웹 애플리케이션을 개발할수 있도록 하기 위해 만들어 졌으며
자바 클래스를 웹에서 호출 및 실행 할 수 있도록 한
표준 javax.servlet.http.HttpServlet 클래스로부터 상속받아서 작성
위의 클래스는 톰캣의 servlet-api.jar 에 포함되어 있다.

2.작성과정
1) 서블릿 규칙에 따라 자바 코드 생성
2) 작성한 코드를 컴파일해서 웹 프로젝트 WEB-INF classes 폴더에 복사
3) 경우에 따라서 web.xml 파일에서 서블릿을 주소와 매핑
4) 웹 컨테이너 재실행

3. 서블릿 요청 처리
- 요청 방식에 따라 doGet이나 doPost 메서드를 재정의해서 처리
- service 메서드를 재정의해서 사용할 수 있는데 이 메서드는 get 방식이나
  post 방식 상관없이 호출되며 이 메서드가 호출되면 doGet이나 doPost
  메서드는 호출되지 않는다
- 서블릿에서 요청을 처리하기 위해 오버라이딩 한 메서드는 request 객체를 이용해서
  웹 브라우저의 요청 정보를 읽어 오던가 아니면 response를 이용해서 응답을 전송.
- 응답을 전송하고자 하는 경우는 response 객체의 setContentType()메서드를 이용해서
  타입과 인코딩 방식을 지정.
- 웹 브라우저에 데이터를 전송하려면 getWriter()를 호출해서 문자열 데이터를 출력할 수
  있는 PrintWriter를 가져오고 print()나 println()을 이용해서 전송하면 됨. 
*/
/*
 * Servlet implementation class Add3
 */
@WebServlet("/Add3") //url Web Setting Annotaiton @ 
/*
 * 이클립스 5.0이전 버전에서는 web.xml 파일을 이용해서 매핑을 했지만
 * 지금은 annotation의 등장으로 주소와의 매핑을 코드안에서 가능
 * 클래스 정의 상단에 @WebServlet(주소 또는 urlPatterns=“패턴”)의 형태로 가능
 */
public class Add3 extends HttpServlet {
	private static final long serialVersionUID = 1L; //직렬화 버전의 고유값
	/*
	 * 직렬화란 컴퓨터의 메모리 상에 존재하는 데이터를 파일로써 저장하거나, 
	 * 통신하는 다른 컴퓨터에게 알맞은 형식에 맞추어 전달하기 위해 
	 * 바이트 스트림 형태로 만드는 것을 의미
	 */
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	  서블릿 호출 방법 *****면접
	  1. Get 방식
	  – 주소에 매개변수를 붙여서 호출하는 방식
	  - 주소와 매개변수를 붙여서 주소 표시줄에 입력하는 방법(?로 구분)
	    URL + ? + param=Value
	  - a 태그를 이용해서 페이지를 요청하는 경우
	  - 자바 스크립트를 이용해서 요청하는 경우 
	  - 폼에서 명시적으로 GET 방식으로 요청하는 경우(default) 
	  - 매개변수의 데이터는 4K 이내(브라우저마다 조금씩 다름)이며 보안성이 없음
	  - 폼에서 사용하면 처리가 지연되는 경우 재요청 
	  - 데이터 형식 Text
	  2. Post 방식 
	  – 매개변수를 본문에 포함시켜 전송하는 방식 
	  - Body에 숨겨서
	  - 폼에서 명시적으로 POST 방식으로 요청 
	  - 데이터의 크기에 제한이 없으며 URL에 표시가 되지 않으므로 보안성이 우수
	  - 데이터 형식 Text, Bianary(기계어)
	  
	  -참고-
	  
	  컴퓨터에서 정보는 이진 형태로 저장되며, 바이너리는 이진 파일을 의미한다.
	  이진 파일은 텍스트 형태가 아닌 이진 형태로 인코딩 된 파일이다.하지만 많이쓰이진 않는다.
      바이너리는 프로그램 배포에서 소스코드가 아닌 실행 파일을 나타낸다.
	 */
    
	/*
	  request 객체
	  요청 정보를 서블릿에게 전달하기 위한
	  객체 헤더정보, 파라미터, url등의 정보를 확인할 수 있는 메서드를 가지고있음
	  Body의 Stream을 읽어 들이는 메소드를 가지고 있음
	  response 객체
	  요청을 보낸 클라이언트에게 응답 정보를 보내기 위한 객체 해당
	  서블릿은 HttpServletResponse 객체를 통해 응답정보를 전송함
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 목표  : 1부터 누적값 전달
		/* getParameter() 
		   클라이언트의 HTML 페이지에서 필요한 정보를 얻는 데 사용 
		   반환 유형 String */
		int num = Integer.parseInt(request.getParameter("num")); /* getParameter가 String으로 받아오기때문에 parseInt */
		String loc = request.getParameter("loc");

		System.out.println("Add3 num->" + num); //console에서 확인하기 위함
		int sum = 0;
		for (int i = 1; i <= num; i++) {
			sum += i;
		}
		
		request.setCharacterEncoding("utf-8");
		/*Post방식으로 받은 파라미터는 한글일 경우 깨진다. -> 인코딩 필요 */
		response.setContentType("text/html;charset=utf-8");
		/* 브라우저마다 문자코드 해석 default가 다르다.
		   --> 브라우저 페이지에 표시할 데이터 인코딩필요
		   -참고-
		   WAS 종류에 따라 기본 문자 인코딩방식은 달라진다.
		   톰캣의 경우에는 8버전은 기본적으로 따로 설정하지 않는 경우 UTF-8이며
		   8버전 미만에서는 ISO-8859-1 캐릭터셋을 입출력에 사용.
		   하지만  ISO-8859-1 은 한글을 표현할 수 없기때문에
		   브라우저가 보낸 한글을 이해할 수 없다.
		    */
		
		/*
		 PrintWriter --> 사용자 Browser에 보여주는 객체
		 자바 프로그램에서 파일로 텍스트를 출력할 때 사용
		 개체의 형식화된 표현을 텍스트 출력 스트림에 출력한다.
		 이 클래스는 PrintStream에 있는 모든 출력 메서드를 구현한다.
		 프로그램이 인코딩 되지 않은 바이트 스트림을 사용해야 하는 원시 바이트를
		 작성하는 메서드는 포함되어 있지 않다.
		 */
		/*
		 * Response.getWriter메서드가 리턴하는 PrintWriter 객체는 
		 * 파일이 아니라 웹 브라우저로 데이터를 출력
		 */
		PrintWriter out = response.getWriter(); 
		out.println("<html><body>");
		out.printf("<h1>1부터 %d까지 합계</h1>" , num);
		out.printf("<h4>LOC --> %s<h4>"         , loc);
		out.println(sum);
		out.println("<body><html>");
		out.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); /*post로 받은 파라미터 인코딩 */
		System.out.println("doPost 시작");
		doGet(request, response);
		/*
		  doPost메소드 밑에 doGet(request, response)를 작성해
		  doPost가 받은 인자 값을 그대로 doGet에 다시 전달
		  이런 식으로 POST 방식의 데이터 전달도 doGet메소드 밑에서 다룰 수 있다.
		 */
		
	}

}
