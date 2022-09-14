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
      - <c:set> 액션을 이용해서 선언한 변수는 page 데이터 영역의 애트리뷰트가 된다.
      - <c:set> 태그에 scope 애트리뷰트를 추가하고
        page, request, session, application 중 한 값을 지정하면
        선언된 변수가 page, request, session, application 데이터 영역의
        애트리뷰트가 되도록 지정하는 것도 가능하다.
    2. scope 애트리뷰트에 request라는 값을 지정하고 나서 
       forward 메서드를 통해 다른 JSP 페이지를 호출하면
       그 JSP 페이지 안에서도 선언된 변수를 사용할 수 있다 --%>
</head>
<body>
	<c:set var="code"  value="1112"     scope="request"></c:set>
	<c:set var="name"  value="온도계"   scope="request"></c:set>
	<c:set var="price" value="16,000원" scope="request"></c:set>
	<jsp:forward page="set2Result.jsp"></jsp:forward>
</body>
</html>