<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
실행 흐름
id pass 입력 
-> check.jsp에서 받아 조건일치하면 session에 저장, 불일치하면 session 종료
-> winner.jsp 실행시도
-> SimpleFilter.java 실행 , chain LoginCheck.java 실행 : 
    session조건에 따라 redirect(login.jsp) 또는(session 일치) chain Filter(SimpleFilter.java)실행후 winner.jsp 실행 
-->

</head>
<body>
	<h2>로그인</h2>
	<form action="check.jsp">
		<label for="id">아이디</label>
			<input type="text" name="id" id="id"><p>
		<label for="pass">암호</label>
			<input type="password" name="pass" id="pass"><p>
		<input type="submit" value="확인"><p>
	</form>
</body>
</html>