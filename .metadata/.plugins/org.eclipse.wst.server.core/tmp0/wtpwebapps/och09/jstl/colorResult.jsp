<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
<c:forEach> 커스텀 액션은 자바 프로그램의 for 문에 해당하는 기능을 제공한다.
특정 HTML 코드를 지정된 횟수만큼 반복해서 출력 
--%>
</head>
<body>
	              <!-- 향상형for {"red" , "orange" , "yellow" , "green" , "blue" , "navy" , "violet"} -->
	<c:forEach var="col" items="${color }">
		<font color="${col }">야호</font>
	</c:forEach>
</body>
</html>