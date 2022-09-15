<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
1. 세션 기술은 웹 브라우저를 거치지 않고 웹 서버에 있는 데이터 영역을 통해 데이터를 전달하는 방법. 
2. 첫 번째 웹 컴포넌트는 웹 서버 쪽에 데이터를 저장해 놓고, 
   그 데이터를 읽기 위해 필요한 세션 아이디만 웹 브라우저로 보낸다. 
   웹 브라우저는 아이디를 저장해 두었다가 두 번째 웹 컴포넌트를 호출할 때 웹 서버로 보내며, 
   그 아이디를 이용하면 저장된 데이터를 찾을 수 있다. 
   세션기술을 이용한 웹 컴포넌트 간의 데이터 전달 
-->
<%-- 
1. 세션은 웹 컨테이너에 정보를 저장할 수 있는 객체
2. 웹 컨테이너는 하나의 웹 브라우저에 하나의 세션을 생성
3. 세션 생성
1) 코드에서 생성: <%@ page session=“true” %> 
2) request 객체로 부터 생성
① HttpSession 변수 = request.getSession() 
② 위의 경우는 세션이 있으면 그 세션을 리턴하고 없으면 새로 생성해서 리턴
③ 만일 생성된 경우에만 리턴받고자 하는 경우는 getSession에 매개변수로 false를 전달
4. 세션에서 속성 사용
① session.setAttribute(“속성명”, “값”) 
② session.getAttribute(“속성명”) 
5. 세션 객체의 메서드
① String getId() 
② long getCreationTime() 
③ long getLastAccessedTime()  --%>
</head>
<body>
<% 
	String id       = request.getParameter("id");
	String password = request.getParameter("password");
	String name     = request.getParameter("name");
	session.setAttribute("id"       , id);//세션 객체에 속성을 저장한다.
	session.setAttribute("password" , password);
	session.setAttribute("name"     , name);
%>
	<h2>약관 동의</h2>
	------------------------------------------------------------------------- <BR>
	1. 회원 정보는 웹 사이트의 운영을 위해서만 사용됩니다.     <BR>
	2. 웹 사이트의 정상 운영을 방해하는 회원은 탈퇴 처리합니다. <BR>
	--------------------------------------------------------------------------- <BR>
	<form action="subscribe.jsp">
		동의<input type="radio" name="agree" value="y"><p>
		거부<input type="radio" name="agree" value="n"><p>
	<input type="submit" value="확인">
</form>
</body>
</html>