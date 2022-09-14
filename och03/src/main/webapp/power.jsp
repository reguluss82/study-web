<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
선언문은 JSP 페이지 내에 안에서 필요한 멤버변수나 메소드가 필요할 때 쓰이는 요소
선언문에서 선언된 변수는 자바에서와 마찬가지로 전역변수 역할을 하는 멤버 변수가 된다. 
선언문의 문법 <%! 문장 %>
1. 선언문에서 변수 선언
  선언문에서 선언된 변수는 JSP 페이지가 서블릿(Servlet) 으로 파싱(parsing)될 때
  서블릿의 멤버변수가 된다.
2. 선언문에서 메소드 선언
  선언문에서 선언된 메소드는 JSP 페이지 내에서 일반적인 메소드로 사용
--%>
<%! 
	int power(int x , int y) {
		int result = 1;
		for (int i = 0; i < y; i ++) {
			result *= x;
		}
		return result;
}
%>
	2^1 = <%= power(2 , 1) %><p>
	2^2 = <%= power(2 , 2) %><p>
	2^3 = <%= power(2 , 3) %><p>
	2^4 = <%= power(2 , 4) %><p>
	2^5 = <%= power(2 , 5) %><p>
</body>
</html>