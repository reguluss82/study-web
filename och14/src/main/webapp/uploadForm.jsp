<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 
1. 웹 브라우저를 통해서 파일을 전송하기 위해서 폼 구성
 1) form 태그의 속성들 중 input 태그가 있는데 이들 중 type 속성의 속성값이 file인 
  <input type="file"> 태그는 파일을 선택할 수 있는 창을 제공
 2) form 태그의 속성들 중 method의 속성값은 “post”를 enctype의 속성값은
  "multipart/form-data“을 사용
2. <form method="post">의 형태로 전송한 폼에 담겨진 파라미터들은 request 객체를 통해서
  해당되는 값을 얻음
3. form 엘리먼트에는 enctype을 multipart/form-data라는 attribute를 기재해야 하는데 이를 기재하지
 않으면 웹 서버로 데이터를 전송할 때 파일 내용을 전송하는 것이 아니라 파일의 경로명만 전송되며
 이 속성이 제대로 동작하도록 하려면 form의 전송 방식이 post 방식이어야만 동작. 
▶ enctype="multipart/form-data"로 전송한 폼에 담겨진 파라미터들에 대한 이름과 값을 얻어내고
 <input type="file">로 지정된 파일을 서버상의 한 폴더에 업로드하기 위해 특별한 컴포넌트가 필요. 
4. cos.jar를 사용
① cos.jar 파일 다운로드 http://www.servlets.com 
② cos-05Nov.zip파일의 압축 해제
 cos\lib폴더 안에 있는 cos.jar 파일을 톰캣홈 lib폴더에 복사
③ 안전한 서비스를 위해 cos.jar파일을 톰캣홈\commons\lib폴더에 복사
④ 폴더에 업로드될 파일을 모아놓을 저장소인 fileSave폴더를 만듬
--%>
</head>
<body>
	<h2>jsp로 파일 업로드</h2>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<label for="name">작성자</label>
			         <input type="text" name="name" id="name" required="required"><p>
			제목 :   <input type="text" name="title"          required="required"><p>
			파일명 : <input type="file" name="uploadFile"     required="required"><p>
			<input type="submit" value="확인">
	</form>
</body>
</html>