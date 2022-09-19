<%@page import="och11.MemberDto"%>
<%@page import="och11.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
1. 서블릿 클래스에서는 새로운 세션을 시작하거나 진행 중인 세션을 계속하기 위해서는 
   getSession 메서드를 호출해야 하지만, JSP 페이지에서는 JSP 페이지가 서블릿 클래스로 변환되는 과정에서
   이 메서드를 호출하는 코드가 자동으로 추가 되기 때문에 getSession 메서드를 호출 할 필요가 없다. 
2. session 내장 변수를 사용하면 세션 데이터 영역에 데이터를 저장할 수도 있고,
   그 영역에 있는 데이터를 읽어오거나 삭제할 수도 있다.  
-->
<!-- 
DAO
Data Access Object의 약자로, 데이터베이스의 데이터에 접근하기 위해 생성하는 객체이다.
데이터베이스에 접근하기 위한 로직과 비즈니스 로직을 분리하기 위해 사용한다.
간단하게, DB에 접속하여 데이터의 CRUD(생성, 읽기, 갱신, 삭제) 작업을 시행하는 클래스이다.
JSP 및 Servlet 페이지 내에 로직을 기술하여 사용할 수 있지만, 
코드의 간결화 및 모듈화, 유지보수 등의 목적을 위해 별도의 DAO 클래스를 생성하여 사용하는 것이 좋다.

DTO
Data Transfer Object의 약자로, 계층간 데이터 교환을 위한 자바빈즈를 뜻한다.
또한 DTO는 VO(Value Object)와 용어를 혼용해서 많이 사용하는데, 
VO는 읽기만 가능한 read only 속성을 가져 DTO와의 차이점이 존재한다.
일반적으로 DTO는 로직을 가지고 있지 않은 순수한 데이터의 객체이며 
객체의 속성과 그 속성의 접근을 위한 getter 및 setter 메소드만을 가지고 있다. -->
</head>
<body>
<% 
	String chk = "";
	String agree = request.getParameter("agree");
	if (agree.equals("y")) {
		String id       = (String)session.getAttribute("id");//세션에 저장된 속성을 반환한다.
		String password = (String)session.getAttribute("password");
		String name     = (String)session.getAttribute("name");
		MemberDao md     = new MemberDao();
		MemberDto member = new MemberDto();
		member.setId(id);//DTO에 저장
		member.setPassword(password);
		member.setName(name);
		int result = md.insert(member);//DAO로 insert
		if (result > 0) chk = "success";
		else            chk = "fail";
	} else chk = "fail";
	session.invalidate(); //현재의 세션 정보들을 모두 제거한다
	out.print("invalidate() 적용후에도 " + session.getId() + "<br>"); //잠시 살아있지만 좀 지나면 종료됨
	response.sendRedirect("result.jsp?chk=" + chk); //form처럼 chk name에 value넣어 result.jsp에 전달
%>
</body>
</html>