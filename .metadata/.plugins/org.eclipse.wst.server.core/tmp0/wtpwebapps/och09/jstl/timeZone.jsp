<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
4. 시간대를 설정하는 <fmt:timeZone>과 <fmt:setTimeZone> 커스텀 액션
   <fmt:timeZone>과 <fmt:setTimeZone>은 시간대마다 다른 날짜와 시각을
   자동으로 계산해서 표시하기 위해 필요한 커스텀 액션.
   <fmt:timeZone> 커스텀 액션의 시작 태그에 value 애트리뷰트를 쓰고
   거기에 특정 시간대에 해당하는 지역 이름을 지정하면,
   이 액션의 시작 태그와 끝 태그 사이에서 출력되는 날짜와 시각은
   그 시간대에 맞게 표시
--%>
</head>
<c:set var="date" value="<%=new Date() %>"></c:set>
<body>
	서울 : <fmt:formatDate value="${date }" type="both"/><br>

<fmt:timeZone value="Asia/Hong_Kong">
	홍콩 : <fmt:formatDate value="${date }" type="both"/><br>
</fmt:timeZone>
<fmt:timeZone value="Europe/London">
	런던 : <fmt:formatDate value="${date }" type="both"/><br>
</fmt:timeZone>
<fmt:timeZone value="America/New_York">
	뉴욕 : <fmt:formatDate value="${date }" type="both"/><br>
</fmt:timeZone>
</body>
</html>