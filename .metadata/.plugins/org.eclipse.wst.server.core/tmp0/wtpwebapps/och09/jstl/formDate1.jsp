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
<!-- 
 - JSTL의국제화/형식화액션 : fmt - JSTL fmt란?
   국제화/형식화의 기능을 제공해 주는 JSTL 라이브러리
   국제화는 다국어 내용을 처리,
   형식화는 날짜와 숫자 형식등을 처리
-->
<%-- 
  <fmt:formatDate>
- 날짜 형식의 패턴을 설정할 때 사용되는 태그
- value 속성에는 날짜 또는 시간을 입력 
- type 속성으로 날짜인지 시간인지 또는 날짜와 시간 둘다 포함한 타입인지를 지정
- dateStyle은 날짜의 스타일을 지정. type 속성이 date 또는 both일 때만 적용
- timeStyle은 시간의 스타일을 지정. type 속성이 time 또는 both일 때만 적용
- timeZone속성은 날짜와 시간이 표시될 시간대를 지정
--%>
</head>
	<c:set var="date1" value="<%=new Date() %>"></c:set>
<body>
	오늘 날짜 : <fmt:formatDate value="${date1 }"/><p>
	현재 시간 : <fmt:formatDate value="${date1 }" type="time"/>
</body>
</html>