<%@page import="java.io.FileWriter"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! 
	private PrintWriter pw;
	String date;
	
	public void jspInit() {
		GregorianCalendar gc = new GregorianCalendar();
		date = String.format("%TF %TT" , gc , gc);
		System.out.println("date ->" + date);
		String fileName = "c:/log/" + date.replace(":" , "") + ".txt";
		// date format 에 ":"이 들어감. 파일명에 ":" 들어갈 수없으므로 replace
		try {
			pw = new PrintWriter(new FileWriter(fileName , true));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("jspInit 헐 !");
		}
		
	}
%>
<% 
	String name = request.getParameter("name");
	String msg  = name + "님 방가워";
	out.println(msg + "<p> 현재시간 : " + date);
	pw.println(msg + "\r\n 현재시간 : " + date + "\r\n");
%>
<%! 
	public void jspDestroy() {
		System.out.println("jspDestroy start...");
		pw.flush();	// buffer 강제출력
		if (pw != null) pw.close();
}
/* flush();
버퍼에 있는 데이터를 모두 처리
파일로 치면 임시메모리에 있는 데이터를 모두 디스크에 써라 라고 하는 뜻
Write()함수를 cpu가 처리했다고 해도 모든 데이터가 물리적으로 디스크에 전부 저장되지 않을 수도 있다
일부는 버퍼라는 임시 저장소에 쓰기를 대기할 수도 있다.
Write()한 파일을 다시 읽거나 할때는 반드시 Flush()해주는게 좋다. */

%>
</body>
</html>