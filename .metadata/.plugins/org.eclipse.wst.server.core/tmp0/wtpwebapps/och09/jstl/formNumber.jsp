<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
<fmt:formatNumber>
- 태그는 숫자형식의 패턴을 설정할 때 사용
- value 속성에는 패턴을 적용 시킬 원래의 값을 입력
- type은 숫자의 타입을 의미. 숫자, 통화, 퍼센트중 원하는 타입으로 설정 가능
- pattern 속성은 지정한값을 어떤 패턴으로 변화 시킬지를 정 할수 있다.
- currencyCode는 통화코드를 의미하며, 숫자타입이 통화일 경우만 유효하다.
- currencySymbol도 숫자타입이 통화일 유효하며, 통화기호를 지정할 수 있다.
- groupingUsed는 그룹기호의 포함 여부를 나타낸다.
- maxIntegerDigits는 최대정수 길이
- minIntegerDigits는 최소 정수 길이
- maxFractionDigits은 최대 소수점 자릿수
- minFractionDigits는 최소 소수점 자릿수를 의미 
--%>
</head>
<body>
	<fmt:formatNumber value="1000000"       groupingUsed="true"/><br>
	<fmt:formatNumber value="3.1415923"     pattern="#.###"/><br>
	<fmt:formatNumber value="3.1"           pattern="#.##"/><br>
	<fmt:formatNumber value="3.1"           pattern="#.00"/><br>
	<fmt:formatNumber value="121434323453." pattern="#,###.00"/><br>  <!-- \ 1개 <- 뒤에 특수문자로 인식 -->
	<fmt:formatNumber value="250000"        type="currency" currencySymbol="\$"/><br>
	<fmt:formatNumber value="0.75"          type="percent"/><br>
</body>
</html>