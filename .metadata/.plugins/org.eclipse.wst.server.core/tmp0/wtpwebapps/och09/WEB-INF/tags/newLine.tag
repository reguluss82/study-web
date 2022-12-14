<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="empty" %>
<%@ attribute name="color" required="true" %>
<%@ attribute name="size"  required="true" type="java.lang.Integer" %>
<!--
애트리뷰트가 있는 커스텀 액션을 만들기 위해서는 태그
파일에 각각의 애트리뷰트를 위한 attribute 지시자를 써야함
-->
<%--
1. Tag File의 문제점
- <util:newLine> 커스텀 액션은 color와 size 애트리뷰트를 모두 썼을 때는 정상적으로 작동하지만,
size 애트리뷰트를 쓰지 않으면 선이 전혀 출력되지 않는다.
2. 이런 문제는 size 애트리뷰트를 필수 애트리뷰트로 만들어서 해결할 수 있다. 방법은 attribute
지시자에 required 애트리뷰트를 추가하고 그 값으로 true를 지정
--%>

<font color="${color }">
	<% 
		for (int i = 0; i < size ; i++) {
			out.println("-");
		}
	%>
</font>

<!-- 
1.커스텀 액션을 만드는 방법
1) 커스텀 액션을 만드는 방법은 크게 두 가지로 나눠진다.
•태그 파일을 작성해서 만드는 방법
•태그 클래스를 작성해서 만드는 방법
2) 태그 파일(tag file)이란 JSP 페이지와 
   비숫한 문법으로 작성하는 텍스트 파일 
-->