<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
	table {
		width: 100%;
	}
</style>
<% 
	String context = request.getContextPath();
%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function getDeptName(v_num) {
		alert("getDeptNAme v_num->"+v_num);
		$.ajax({
			url      : "<%=context%>/ajaxGetDeptName.do" ,
			data     : {num : v_num} ,       /* 파라미터 */
			dataType : 'text' ,
			success  : function(data) { /* ajaxGetDeptName.do 의 결과값이 text형식으로 data에 간다 */
							alert(".ajax Data"+data);
							/* input Tag value속성*/
							$('#deptName').val(data);
							/* span Tag value속성 없음 -> html로*/
							$('#msg').html(data);
					   }
		});
	}
</script>
</head>
<body>
	<h1>게시판</h1>
	<table>
		<tr>
		<td><a href="writeForm.do">글쓰기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>번호</th> <th>제목</th> <th>작성자</th> <th>이메일</th> <th>IP</th> <th>작성일</th> <th>조회수</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td class="left" width="200">
						<c:set var="numbering" value="1"/>
						<c:if test="${board.readcount > 20 }">
							<img alt="" src="images/hot.gif" onmouseover="getDeptName(${board.num})">
						</c:if>
						<c:if test="${board.re_level > 0 }">
							<img alt="" src="images/level.gif" width="${board.re_level * 10 }">
							<img alt="" src="images/re.gif">
						</c:if>
						<a href="content.do?num=${board.num }&pageNum=${currentPage}">
						${board.subject }</a>
					</td>
					<td>${board.writer }</td>
					<td><a href="mailto:${board.email }">${board.email }</a></td>
					<td>${board.ip }</td>
					<td>${board.reg_date }</td>
					<td>${board.readcount }</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }"/>
				<%-- <c:set var="startNum" value="${numbering + 1 }"/> --%>
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href="list.do?pageNum=${startPage-blockSize }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="list.do?pageNum=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href="list.do?pageNum=${startPage + blockSize }">[다음]</a>
		</c:if>
	</div>
	
	Ajax deptName 결과 :  <input type="text" id="deptName" readonly="readonly"><p>
    Message            :  <span id="msg"></span><p>

</body>
</html>