<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - core</title>
</head>
<body>
	<h2>jstl - core</h2>
	<p>c:out(출력)</p>
	<p><c:out value="${'Hello jstl'}"/></p>
	<hr/>
	
	<p>c:set(변수선언)</p>
	<c:set var="userid" value="apple"/>
	<p>아이디 : ${userid}</p>
	<hr/>
	
	<p>c:set(배열선언)</p>
	<c:set var="memList" value='<%=new String[]{"apple", "banana", "orange"} %>'/>
	<p>memList : ${memList}</p>
	<p>memList[0] : ${memList[0]}</p>
	<hr/>
	
	<p>c:remove(변수삭제)</p>
	<p>아이디 : ${userid}</p>
	<c:remove var="userid"/>
	<p>아이디 : ${userid}</p>
	<hr/>
	
	<p>c:if(조건문)</p>
	<c:set var="userid" value="apple"/>
	<c:if test="${userid eq 'apple'}">
		<p>로그인 되었습니다</p>
	</c:if>
	<c:remove var="userid"/>
	<c:if test="${userid eq 'apple'}">
		<p>로그인 되었습니다</p>
	</c:if>
	<c:if test="${not userid}">
		<p>로그아웃 되었습니다</p>
	</c:if>
	<hr/>
	
	<p>empty(empty 비교)</p>
	<c:if test="${empty userid }">
		<p>userid 데이터가 없습니다</p>
	</c:if>
	<hr/>
	
	<p>c:choose(조건문)</p>
	<c:set var="userpw" value="1111"/>
	<c:choose>
		<c:when test="${userid }">
			<p>아이디 변수가 존재합니다</p>
		</c:when>
		<c:when test="${!empty userpw}">
			<p>비밀번호 변수가 존재합니다</p>
		</c:when>
		<c:otherwise>
			<p>아이디, 비밀번호 변수가 모두 존재하지 않습니다</p>
		</c:otherwise>
	</c:choose>	
	<hr/>
	
	<%
		String[] studentList = {"김사과", "반하나", "오렌지", "이메론"};
		pageContext.setAttribute("studentList", studentList);
	%>
	<p>forEach(반복문)</p>
	<table border="1" width="600">
		<tr>
			<th>idx</th>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<c:forEach var="student" items="${studentList}" varStatus="status">
			<tr>
				<td>${status.index}</td>
				<td>${status.count}</td>
				<td>${student}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>