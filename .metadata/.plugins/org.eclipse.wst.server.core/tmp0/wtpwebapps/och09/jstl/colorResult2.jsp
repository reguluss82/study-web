<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
<c:forEach> 액션을 사용할 때는 begin과 end라는 이름의 애트리뷰트를 쓰고, 
거기에 각각 카운터 변수의 시작 값과 끝 값을 지정 
--%>
</head>
<body>
	<h2>이중forEach</h2>
	<c:forEach var="cnt" begin="1" end="7" step="1">
		<c:forEach var="col" items="${color }">	
			<font color="${col }" size="${cnt }">야호</font>
		</c:forEach>
		<br>
	</c:forEach>
</body>
</html>