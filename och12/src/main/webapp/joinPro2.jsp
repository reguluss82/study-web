<%@page import="och12.Member"%>
<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%  // DTO 방식 사용 joinPro1.jsp 와 비교
	Member member = new Member();
	member.setId(request.getParameter("id"));
	member.setPasswd(request.getParameter("passwd"));
	member.setName(request.getParameter("name"));
	member.setAddress(request.getParameter("address"));
	member.setTel(request.getParameter("tel"));
	MemberDao md = MemberDao.getInstance();
	int result = md.insert(member);
	if (result > 0) {
%>	
	<script type="text/javascript">
		alert("회원가입 축하 !! 이제 고생 좀 해");
		location.href="loginForm.jsp";
	</script>
<% 

	} else { %>
		<script type="text/javascript">
			alert("헐 실패야 똑바로 해 ~");
			location.href="joinForm.jsp";
		</script>
<% } %>
</body>
</html>