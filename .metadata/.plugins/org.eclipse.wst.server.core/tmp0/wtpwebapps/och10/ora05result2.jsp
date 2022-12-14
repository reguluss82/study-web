<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover {
		background-color: red;
	}
</style>
</head>
<body>
	<h2>EL표기법 + JSTL (MVC2 view) scriptlet X</h2>

<!-- 
MVC Model-View-Controller
애플리케이션을 세 가지 역할로 구분한 개발 방법론
사용자가 Controller를 조작하면 Controller는 Model을 통해 데이터를 가져오고 
그 데이터를 바탕으로 View를 통해 시각적 표현을 제어하여 사용자에게 전달하게 된다
사용자 인터페이스로부터 비즈니스 로직을 분리하여 
애플리케이션의 시작적 요소나 그 이면에서 실행되는 비즈니스 로직을
서로 영향 없이 쉽게 고칠 수 있는 애플리케이션을 만들 수 있게 된다. -->

<!-- 
1 사용자가 웹사이트에 접속 (Users)
2 Controller는 사용자가 요청한 웹페이지를 서비스하기 위해서 모델을 호출 (Manipulates)
3 Model은 데이터베이스나 파일과 같은 데이터 소스를 제어한 후 그 결과를 Return
4 Controller는 Model이 리턴한 결과를 View에 반영 (Updates)
5 데이터가 반영된 View는 사용자에게 보여짐 (Sees) -->

<!-- 
모델 2 방식은 웹브라우저 사용자의 요청을 서블릿이 받고 
서블릿은 해당 요청으로 View로 보여줄 것인지 Model로 보낼 것인지를 판단하여 전송
또한 모델 2 방식의 경우 HTML 소스와 JAVA소스를 분리해놓았기 때문에
모델 1 방식에 비해 확장시키기도 쉽고 유지보수 또한 쉽다. -->

<!-- 모델 (Model)
데이터를 가진 객체
데이터는 내부의 상태에 대한 정보를 가질 수도 있고,
모델을 표현하는 이름 속성으로 가질 수 있다. 
모델의 상태에 변화가 있을 때 컨트롤러와 뷰에 이를 통보한다.
이와 같은 통보를 통해 뷰는 최신의 결과를 보여줄 수 있고,
컨트롤러는 모델의 변화에 따른 적용 가능한 명령을 추가, 제거, 수정할 수 있다.

모델의 규칙
사용자가 편집하길 원하는 모든 데이터를 가지고 있어야만 함
뷰나 컨트롤러에 대해서 어떠한 정보도 알지 말아야 함
변경이 일어나면, 변경 통지에 대한 처리방법을 구현해야 함 -->
 

<!-- 뷰 (View)
View는 클라이언트 측 기술은 HTML/CSS/Javascript들을 모와둔 컨테이너
사용자가 볼 결과물을 생성하기 위해 모델로부터 정보를 얻어온다.

뷰의 규칙
모델이 가지고 있는 정보를 따로 저장해서는 안됨
모델이나 컨트롤러와 같이 다른 구성 요소를 몰라야 함
변경이 일어나면, 변경 통지에 대한 처리방법을 구현해야 함 -->
 

<!-- 컨트롤러 (Controller)
사용자가 접근한 URL에 따라 사용자의 요청사항을 파악한 후에
그 요청에 맞는 데이터를 Model을 의뢰하고,
데이터를 View에 반영해서 사용자에게 알려준다.

모델에 명령을 보냄으로써 뷰의 상태를 변경할 수 있음 => (워드에서 문서 편집)
컨트롤러가 관련된 모델에 명령을 보냄으로써 뷰의 표시 방법을 바꿀 수 있음 => (문서를 스크롤하는 것)

컨트롤러의 규칙
모델이냐 뷰에 대해서 알고 있어야 함
모델이나 뷰의 변경을 모니터링해야 함 -->


	<table width="100%" bgcolor="yellow" border="1">
		<tr bgcolor="pink"><th>사번</th><th>이름</th><th>업무</th><th>급여</th></tr>
		<c:forEach var="a" items="${al }">
			<tr>
				<td>${a.empno }</td>
				<td>${a.ename }</td>
				<td>${a.job }</td>
				<td>${a.sal }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>