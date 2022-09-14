<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 지시자(Directive) -->
<!--   JSP 페이지에 대한 정보를 설정할 때 사용
    page가 디렉티브 이름이고 contentType과 pageEncoding이 속성
     "text/html; charset=utf-8" , “utf-8” 이 값
	 - 제공되는 디렉티브
	① page: JSP 페이지에 대한 정보를 지정하며 문서의 타입, 출력 버퍼의
	크기, 에러 페이지 등의 정보를 입력
	② taglib: 태그 라이브러리를 지정
	③ include: 특정 영역에 다른 문서를 포함 -->
    
<%--    
 JSP 문서의 기본 구조
1.JSP 기술에서 웹 애플리케이션을 구현 할 때 작성하는 코드를 JSP
2.JSP 페이지는 HTML 문서의 사이에 Java 문법의 코드가 삽입되는 형태로 작성
3.JSP 페이지에 있는 HTML 코드는 웹 브라우저로 그대로 전송되지만, JSP 문법의
코드는 웹 컨테이너 쪽에서 실행되고 그 결과만 웹 브라우저로 전송

<!DOCTYPE …> 이전 까지는 JSP 페이지에 대한 정보를 이용하는 설정부분
JSP 페이지가 생성하는 문서의 타입 및 사용할 커스텀 태그, 사용할 자바 클래스를 지정하는 부분
<!DOCTYPE ..> 이후 부분은 문서를 생성하는 생성부분
문서의 데이터와 문서를 생성하는데 필요한 스크립트 코드를 작성하는 부분
<% … %> 부분이 스크립트 코드 --%>
<!-- 
1.웹 컨테이너는 JSP 페이지 전체를 서블릿 클래스의 소스 코드로 변환한 다음에,
그 소스 코드를 컴파일해서 그 결과를 가지고 서블릿 객체를 만들고, 그 서블
릿 객체를 초기화해서 서블릿을 만든다.
웹 브라우저로부터 URL이 왔을 때 실행되는 것은 서블릿이다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사칙연산</h1>
<%  
	// scriptlet              - 내장객체 사용

	/* 	
		스크립트릿(Scriptlet)은 JSP페이지에서 가장 일반적으로 많이 쓰이는 스크립트 요소로
주로 프로그래밍의 로직을 기술할 때 많이 쓰인다.
2.JSP 페이지가 Servlet으로 변환되고 이 페이지가 호출 될 때 _jspService 메소드 안에 선언
3.스크립트릿(Scriptlet)에서 선언된 변수는 지역변수로 선언
5. 스크립트릿에서 선언한 변수는 지역 변수이므로 별도로 선언한 메소드부분에서는
해당변수를 사용할 수 없다.
6.자동 초기화가 안되므로 반드시 초기화를 해 주어야 한다 
7.Implicit Object: 웹 애플리케이션을 작성하는데 필요한 기능을 제공해주는 객체로
				   별도의 생성과정 없이 사용할 수 있는 객체
	- request
	- response
	- session
	- application
	- page
	- 기타 */
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int add  = num1 + num2;
	int min  = num1 - num2;
	int mul  = num1 * num2;
	int div  = num1 / num2;
%>

	<%--
	익스프레션(expression)
	- <%=로 시작해서 %>로 끝나고 그 사이에 자바 식이 들어갈 수 있다.
	- 이 식은 상수나 변수 이름 하나로 구성될 수도 있고, 연산자를 포함할 수도 있으며,
	  리턴 값이 있는 메서드 호출식이 될 수도 있다.
	- 이 식은 웹 서버 쪽에서 실행되고 그 결과만 웹 브라우저로 전송된다 --%>
	덧셈   : <%= add %><p>
	뺄셈   : <%= min %><p>
	곱셈   : <%= mul %><p>
	나눗셈 : <%= div %><p>
</body>
</html>