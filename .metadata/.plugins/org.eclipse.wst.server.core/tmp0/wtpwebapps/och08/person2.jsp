<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Bean 선언 -->
	<!-- Java에서의 Person person = new Person(); -->
	<jsp:useBean id="person" class="och08.Person" scope="request"/>
	
	<!-- Bean 값 저장 -->
	<%-- <jsp:setProperty property="*" name="person"/> --%>
	<jsp:setProperty property="age"    name="person"/>
	<jsp:setProperty property="gender" name="person"/>
	<jsp:setProperty property="name"   name="person"/>

	<!-- Bean Page 이동 -->
	<jsp:forward page="personResult.jsp"></jsp:forward>
</body>
</html>