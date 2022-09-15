<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
1. 쿠키 기술은 웹 서버가 웹 브라우저로 데이터를 보냈다가
   웹 서버 쪽으로 다시 되돌려 받는 방법을 사용한다. 
2. 첫 번째 웹 컴포넌트는 웹 브라우저로 HTML 문서를 보낼 때 전달한 데이터를 함께 보내며,
   웹 브라우저는 그 데이터를 저장해 두었다가 두 번째 웹 컴포넌트를 호출할 때 URL과 함께 웹 서버로 보낸다
   쿠키 기술을 이용한 웹 컴포넌트 간의 데이터 전달
 -->
 
<!--  
1.웹 서버가 웹 브라우저와 정보를 주고받는 방법 중의 하나
2.쿠키는 웹 브라우저가 보관하고 있는 데이터로 웹 서버에 요청을 보낼 때 함께 전송
3.웹 브라우저가 전송한 쿠키를 사용하여 필요한 데이터를 읽을 수 있습니다. 
4.쿠키의 동작 방식
① 쿠키 생성 단계 : 웹 서버 측에서 생성
② 쿠키 저장 단계 : 웹 브라우저는 응답 데이터에 포함된 쿠키를 쿠키 저장소에
보관하는데 종류에 따라 메모리나 파일로 저장
③ 쿠키 전송 단계 : 서버 측에서 요청할 때 마다 웹 서버에 전송
5.쿠키의 구성
①이름 : 쿠키를 구별하는데 사용하는 이름
②값 : 쿠키의 이름과 관련된 값
③유효 시간 : 쿠키의 유지 시간
④도메인 : 쿠키를 전송할 도메인
⑤경로 : 쿠키를 전송할 요청 경로 -->
</head>
<body>
<% 
	Cookie cook2 = new Cookie("name" , URLEncoder.encode("중앙정보" , "utf-8"));
	response.addCookie(cook2);
%>
쿠키저장 성공<p>
<a href="cookView2.jsp">쿠키보기</a>
</body>
</html>