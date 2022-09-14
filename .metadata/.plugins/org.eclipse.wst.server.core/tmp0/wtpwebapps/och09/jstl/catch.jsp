<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
1. JSTL은 JSP 표준 태그 라이브러리(JSP Standard Tag Library)의 약어.
2. 라이브러리란 여러 프로그램이 공통으로 사용하는 코드를 모아놓은
코드의 집합.
3. JSTL을 가지고 할 수 있는 일
- 간단한 프로그램 로직의 구사
(자바의 변수 선언, if 문, for 문 등에 해당하는 로직)
- 다른 JSP 페이지 호출(<c:redirect>, <c:import>)
- 날짜, 시간, 숫자의 포맷
- JSP 페이지 하나를 가지고 여러 가지 언어의 웹 페이지 생성
- 데이터베이스로의 입력, 수정, 삭제, 조회
- XML 문서의 처리
- 문자열을 처리하는 함수 호출
4. 문자열을 처리하는 함수 호출을 제외한 나머지 기능들은 모두 커스텀 액션
형태로 제공된다.  
--%>
<!-- 라이브러리 불러오기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <c:catch>
1.<c:catch> 커스텀 액션은 자바 프로그래밍 언어의 try문과 비슷한 기능을 한다.
2.<c:catch> 커스텀 액션의 시작 태그와 끝 태그 사이에서 에러가 발생하면 실행의 흐름이
  곧바로 <c:catch> 액션 다음에 있는 코드로 넘어간다.  
3.<c:catch> 커스텀 액션은 자바의 try 블록에 해당하는 일만 하기 때문에
  catch 블록에 해당하는 일은 별도로 코딩
- var 애트리뷰트에 지정된 변수(익셉션 객체가 저장되는 변수)는
  <c:catch> 액션의 범위 밖에서도 EL 식을 통해 사용할 수 있으므로,
  이를 이용해서 에러 처리를 하면 된다
- ${e.message}라는 EL 식은 익셉션 객체 e에 대해
  getMessage 메서드를 호출하는 일을 한다
--%>
</head>
<body>
	<!-- num에서 호출 try-catch -->
	<c:catch var="e1">
		<% 
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
		%>
		나눗셈 결과 : <%= num1/num2 %>	
	</c:catch>
	<c:if test="${e1 != null }">
		에러메세지 : ${e1.message }
	</c:if>
</body>
</html>