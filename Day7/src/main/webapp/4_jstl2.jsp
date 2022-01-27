<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import ="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - formatting</title>
</head>
<body>
	<h2>jstl - formatting</h2>
	<p><fmt:formatNumber value="1234.5678"></fmt:formatNumber></p>
	<p><fmt:formatNumber value="50000"></fmt:formatNumber></p>
	<p><fmt:formatNumber value="50000" type="currency"></fmt:formatNumber></p>
	<p><fmt:formatNumber value="50000" type="currency" currencySymbol="$"></fmt:formatNumber></p>
	<p><fmt:formatNumber value="0.5" type="percent"></fmt:formatNumber></p>
	<hr/>
	<%
		request.setAttribute("now", new Date());
	%>
	<p><fmt:formatDate value="${now}"/></p>
	<p><fmt:formatDate value="${now}" type="date"/></p>
	<p><fmt:formatDate value="${now}" type="time"/></p>
	<p><fmt:formatDate value="${now}" type="both"/></p>
</body>
</html>