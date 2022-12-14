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
1. <fmt:setLocale> 커스텀 액션은 출력할 데이터의 포맷을
   특정 지역에 맞게 설정하고자 할 때 사용하는 액션이다.
2. <fmt:setLocale> 커스텀 액션을 이용해서 특정 지역을 설정하기 위해서는
   value 애트리뷰트에 언어 코드 또는 국가코드_언어코드를 지정하면 된다
     <fmt:setLocale value= “en” /> // 언어코드
     <fmt:setLocale value= “us_en” /> // 국가 코드 및 언어 코드
3. 위의 액션이 실행되고 나면 날짜와 시각이 영어권에 맞게 포맷되고,
   <fmt:formatNumber>액션을 이용해서 출력되는 모든 금액 앞에는
   달러를 의미하는 $기호가 자동으로 붙어서 표시
--%>

</head>
<c:set var="date" value="<%=new Date() %>"></c:set>
<body>
	<h2>우리나라</h2>
	<fmt:setLocale value="ko_kr"/>
	금액 : <fmt:formatNumber value="1000000"  type="currency"/><br>
	일시 : <fmt:formatDate   value="${date }" type="both" dateStyle="full" timeStyle="full"/><br>
	
	<h2>미국</h2>
	<fmt:setLocale value="en_us"/>
	금액 : <fmt:formatNumber value="1000000"  type="currency"/><br>
	일시 : <fmt:formatDate   value="${date }" type="both" dateStyle="full" timeStyle="full"/><br>
	
	<h2>일본</h2>
	<fmt:setLocale value="ja_jp"/>
	금액 : <fmt:formatNumber value="1000000"  type="currency"/><br>
	일시 : <fmt:formatDate   value="${date }" type="both" dateStyle="full" timeStyle="full"/><br>
	
</body>
</html>