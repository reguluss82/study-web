<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>부서 정부 수정</h2>
	<form action="oraUpdate.jsp">
		부서코드 : ${deptno }<p> <!-- PK수정 못하게함, 정확성문제 발생가능성 -->
		<input type="hidden" name="deptno" value="${deptno }"> <!-- hidden 중요. 수정하지는않아도 값 보내줘야하므로 -->
		부서명 : <input type="text" name="dname" value="${dname }"><p>
		근무지 : <input type="text" name="loc"   value="${loc }"><p>
		<input type="submit" value="수정완료">
	</form>
</body>
</html>