<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- EL(Expression Language)
- 표현언어를 의미
- jsp스크립트를 대신하여 속성값들을 좀 더 편리하게 출력하기 위해 제공되는 언어
- 예를 들어 <%=hello%>라는 코드를 EL로 표현할때는 ${hello}로 표현된다
1. 익스프레션 언어의 유일한 목적은 식을 계산해서 그 결과를 출력하는 것 
2. 식 위치에는 데이터 이름 하나로만 구성된 식이 들어갈 수도 있고,
   연산자를 포함하는 식이 들어 갈 수도 있으며,
   자바의 정적 메서드를 호출하는 식이 들어갈 수도 있다
--%>
<%-- 
1. param은 웹 브라우저에서 <FORM> 엘리먼트를 통해
  입력된 데이터를 가져올 때 사용하는 내장 객체
2. param 객체의 사용 방법
   ① ${param.NUM}
   ② ${param[ “COLOR ”]}
3. <FORM> 엘리먼트를 통해 똑같은 이름의 데이터가 여러 개 입력되는 경우
   paramValuse 내장 객체를 사용
 ① 객체 이름 뒤에 마침표를 찍고, 그 다음에 데이터 이름을 쓰고,
    그 다음에 데이터 값의 인덱스를 대괄호로 묶어서 표시
      ${paramValues.ANIMAL[0]}
 ② 객체 이름 뒤에 두 개의 대괄호를 치고
    그 안에 각각 따옴표로 묶은 데이터 이름과 인덱스를 쓰는 것
      ${paramValues[ “ANIMAL” ][1]}
☞ EL 식의 인덱스가 0부터 시작하므로,
  첫 번째 데이터 값을 가져오기 위해서는 인덱스를 0이라고 써야 하고,
  두 번째 데이터 값을 가져오기 위해서는 1이라고 표기
 --%>
</head>
<body>
	<h1>Form은 param 받음</h1>
	첫번째 동물 : ${param.an1 }<br>
	두번째 동물 : ${param.an2 }<p>
	같은   동물 : ${param.an1 == param.an2 }<br>
</body>
</html>