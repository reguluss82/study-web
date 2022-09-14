<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
<c:redirect> 커스텀 액션은 sendRedirect 메서드를 통해
다른 웹 자원을 호출하는 일을 한다.
호출할 웹 자원의 URL은 url 애트리뷰트를 이용해서 지정 
--%>
</head>
<body>
	<c:redirect url="http://www.choongang.co.kr/"></c:redirect>
</body>
</html>