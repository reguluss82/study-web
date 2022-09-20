<%
	String id = (String)session.getAttribute("id"); //session에 저장된 id get
	if (id == null || id.equals("")) {
		response.sendRedirect("loginForm.jsp");
	}
%>