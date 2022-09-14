<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
1. <c:forTokens> 커스텀 액션은 자바의 for 문과
   java.util.StringTokenizer 클래스의 기능을 합친것 같은 기능을 제공
2. 이 액션에는 items, delims, var라는 3개의 애트리뷰트를 써야 한다.
   items  애트리뷰트에는 토큰을 포함하는 문자열을, 
   delims 애트리뷰트에는 토큰 분리에 사용할 구획 문자를,
   var    애트리뷰트에는 분리된 토큰을 대입할 변수의 이름을 써야 함 
--%>

</head>
<body>
	<c:set var="animals" value="토끼, 고양이*강아지, 여우"></c:set>
	<h2>사자의 생일</h2>     <!-- 토끼 , 고양이*강아지 , 여우 -->
	<c:forTokens var="an" items="${animals }" delims=",*">
		${an }<br>
	</c:forTokens>
</body>
</html>