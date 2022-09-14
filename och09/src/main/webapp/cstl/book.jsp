<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!--
JSP 페이지에서 커스텀 액션을 사용하려면 taglib 지시자를 써야 함
태그 파일을 이용해서 만든 커스텀 액션일 경우에는 taglib 지시자에 
uri 애트리뷰트 대신 tagdir 애트리뷰트를 써야 한다.
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>좋아하는 책</h2>
	<u:newLine color="red" size="20"/><p>
	홍길동전<p>
	이순신전<p>
	김유신전<p>
	<u:newLine color="blue" size="27"/>
</body>
</html>