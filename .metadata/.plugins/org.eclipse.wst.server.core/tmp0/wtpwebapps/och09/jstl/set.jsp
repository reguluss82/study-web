<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
1. <c:set> 커스텀 액션의 사용 방법
   <c:set>은 변수를 선언하고 초기값을 대입하는 커스텀 액션이다.
   자바 프로그램에서 변수를 선언할 때는 기본적으로 변수의 타입과 이름을 기술하고, 
   선택적으로 초기값을 기술한다.
2. <c:set> 커스텀 액션을 이용해서 변수를 선언할 때는 변수의 타입을 쓰지 않는다.
3. value 애트리뷰트 값 위치에 EL 식을 쓸 수도 있다.
--%>
</head>
	<c:set var="num1"      value="6"/>
	<c:set var="num2"      value="2"></c:set>
	<c:set var="result"    value="${num1 + num2 }"></c:set>
	<c:set var="divResult" value="${num1 / num2 }"></c:set>
<body>
	덧셈 : ${num1 } + ${num2 } = ${result }<p>
	뺄셈 : ${num1 } - ${num2 } = ${num1 - num2 }<p>
	곱셈 : ${num1 } * ${num2 } = ${num1 * num2  }<p>
	나눗셈1 : ${num1 } / ${num2 } = ${num1 / num2 }<p>
	나눗셈2 : ${num1 } / ${num2 } = ${divResult }<p>
</body>
</html>