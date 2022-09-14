<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
 1. initParam은 웹 애플리케이션의 초기화 파라미터 값을 가져다가
    출력할 때 사용하는 내장 객체
   	initParam 객체의 이름 뒤에 마침표나 대괄호를 이용해서
   	해당 초기화 파라미터의 이름을 표시
 
 2. 웹 애플리케이션의 초기화 파라미터 이름
   	${initParam.DB_NAME}
   	${initParam.[ “DB_NAME ”]}
--%>
</head>
<body>
	<h1>Web.xml Setting값 가져오기</h1>
	${initParam.DBName }<p>
	${initParam.DBName2 }
</body>
</html>