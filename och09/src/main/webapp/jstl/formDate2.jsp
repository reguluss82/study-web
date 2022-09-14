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
1. 날짜와 시각을 포맷하는 <fmt:formatDate> 커스텀 액션
  1) <fmt:formatDate>는 날짜와 시각을 포맷하는 커스텀 액션이다.
  2) 이 액션에는 출력할 날짜와 시각을 java.util.Date 클래스 타입의 객체로 넘겨줘야 하므로
     먼저 이 클래스의 객체를 만들어야 한다.
     Date date = new Date(); // 현재의 날짜와 시각을 포함한 Date 객체를 생성
  3) <fmt:formatDate> 커스텀 액션의 value 애트리뷰트에 Date 객체를 지정하면 그 객체가
	 포함하고 잇는 날짜가 YYYY. MM. DD 포맷으로 출력된다.
	 <fmt:formatDate value= “${date} ” /> // Date 객체 

2 <fmt:formatDate> 애트리뷰트
  1) dateStyle 애트리뷰트 full, long, medium, short 중 한 값을 넘겨주면
     날짜를 다른 포맷으로 출력할 수 잇다. 
  2) timeStyle 애트리뷰트에 full, long, medium, short 중 한 값을 넘겨주면
     시각도 다른 포맷으로 출력.
  3) type 애트리뷰트에 both 값을 지정해서 날짜와 시각을 한꺼번에 출력할 때는
     dateStyle과 timeStyle 애트리뷰트를 함께 씀
--%>
</head>
	<c:set var="date" value="<%=new Date() %>"></c:set>
<body>
	<h2>현재 날짜와 시간</h2>
	<fmt:formatDate value="${date }" type="both" dateStyle="short"  timeStyle="short"/><br>
	<fmt:formatDate value="${date }" type="both" dateStyle="medium" timeStyle="medium"/><br>
	<fmt:formatDate value="${date }" type="both" dateStyle="long"   timeStyle="long"/><br>
	<fmt:formatDate value="${date }" type="both" dateStyle="full"   timeStyle="full"/>
</body>
</html>