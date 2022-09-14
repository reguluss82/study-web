<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
1. <c:choose> 커스텀 액션은 자바 프로그램의 switch 문과 비슷한 역할을 한다.
2. <c:when>, <c:otherwise>라는 커스텀 액션과 함께 사용되며, 두 커스텀 액션은 각각
   switch 문의 case, default 절과 비슷한 역할을 한다.
3. <c:choose> 커스텀 액션의 사용 방법
   <c:choose> 커스텀 액션의 전체적인 구조는 switch 문과 비슷하지만, 
   변수의 이름이 아니라 조건식을
   <c:when> 커스텀 액션을 test 애트리뷰트에 EL 식 형태로 지정
--%>
</head>
<body>
	<!-- num2에서 호출 -->
	<h2>인사말 Switch 유사</h2>
	<c:choose>
		<c:when test="${param.num1 == 0 }">안녕하세요</c:when>
		<c:when test="${param.num1 == 1 }">Hi Hi</c:when>
		<c:when test="${param.num1 == 2 }">아리가또</c:when>
		<c:otherwise>헐! 누구</c:otherwise>
	</c:choose>
</body>
</html>