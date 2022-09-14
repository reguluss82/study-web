<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
- <jsp:useBean> 액션태그는 JSP 페이지에서 사용할 자바빈 객체를 지정해주는 기능을 한다.
  <jsp:useBean id="[이름]" class="[자바빈클래스이름]" scope="[범위]"/>
- id    : jsp페이지에서 자바빈 객체에 접근할 때  사용할 이름을 명시한다. 
- class : 패캐지 이름을 포함한 자바빈 클래스의 완전한 이름을 명시한다.
- scope : 자바빈 객체가 저장될 영역을 지정한다. 
  page ,request, session, application 중 하나를 값으로 갖는다. 기본값은 page
--%>

<%--
 <jsp:getProperty> , <jsp:setProperty>
 - <jsp:useBean>으로 객체를 생성하면 겟셋 프로퍼티 액션태그를 사용할 수 있다.
   <jsp:setProperty name="[자바빈]" property="이름" value="[값]" />
 - name : 프로퍼티의 값을 변경할 자바빈 객체의 이름. 
     <jsp:useBean>액션 태그의 id속성에서 지정한 값을 사용한다.
 - property : 값을 지정할 프로퍼티의 이름
 - value : 프로퍼티의 값, 표현식을 사용할수 있다.
 --%>

</head>
<body>
	<!-- Bean 선언 -->
	<!-- Java에서의 Person person = new Person(); -->
	<jsp:useBean id="person" class="och08.Person" scope="request"/>
	
	<!-- Bean 값 저장 -->
	<!-- Java에서 person.setName() -->
	<%-- <jsp:setProperty property="*" name="person"/> --%>
	<jsp:setProperty property="age"    name="person"/>
	<jsp:setProperty property="gender" name="person"/>
	<jsp:setProperty property="name"   name="person"/>
	<!-- Bean 값 가져오기 -->
	<!-- Java에서 person.getName() -->
	이름 : <jsp:getProperty property="name"   name="person"/><p>
	성별 : <jsp:getProperty property="gender" name="person"/><p>
	나이 : <jsp:getProperty property="age"    name="person"/><p>
	<!-- Bean Page 이동 -->
</body>
</html>