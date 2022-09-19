<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 지시자 빼고 나머지 html 문서 다 지움 <- 불필요한 값 없애기 위함 -->
<% 
	double[] temp = {9.8 , 12.2 , 24.7 , 23.7 , 23.1};
	for (int i = 0; i < temp.length; i++) {
		out.println(temp[i]);
		if (i != (temp.length -1)) { // 마지막에 "," 안넣기 위한
			out.println(",");
		}
	}
%>