<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - function</title>
</head>
<body>
	<h2>jstl - function</h2>
	
	<p>length()</p>
	<p>${fn:length('1234567890') }</p>
	<hr/>
	
	<p>indexOf()</p>
	<p>${fn:indexOf('jstl fn 예제','s') }</p>
	<hr/>
	
	<p>trim()</p>
	<p>${fn:trim('		jstl fn 예제'		) }</p>
	<hr/>
	
	<p>substring()</p>
	<p>${fn:substring('jstl fn 예제',0 , 4)}</p>
	<hr/>
	
	<p>replace()</p>
	<p>${fn:replace('jstl fn 예제','jstl' , 'Java Sever Page Standard Tag Library')}</p>
	<hr/>
	
	<p>split()</p>
	<c:set var="arr" value="${fn:split('j, s, t, l', ',')}"/>
	<c:forEach var="ch" items="${arr}" varStatus="i">
		<p>${i.count} - ${ch}</p>
	</c:forEach>
</body>
</html>