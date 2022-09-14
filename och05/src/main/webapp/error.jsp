<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<% 
//                 정상값 setting
response.setStatus(200); 
%>
<!-- 
try-catch 구문을 써서 오류를 제어한다고 하더라도
html 응답 헤더에 따라 결과가 다르게 나올 수 있다.
오류 메시지를 작성한 데로 결과가 나올 수 있고(DataError.jsp) 
아니면 웹 페이지를 찾을 수 없습니다. 라는 문구의 결과가 나올 수 있다.
그 이유는 웹 브라우저는 500 에러일 때, http 문서를 무시하고
웹 브라우저 자체 에러메시지를 출력하기 때문
그때 사용하는 방법이 response.setStatus(200);
200(제대로 실행한 http 응답코드) 대로 제대로 실행이 되고,
개발자가 설정한 http 페이지를 보여준다. 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항</h1>
	작업중...<p>
<%
	System.out.println("예외 클래스 : " + exception.getClass().getName());
	System.out.println("예외 내용 : " + exception.getMessage());
		// 콘솔에 출력되는 에러내용 확인
%>

</body>
</html>