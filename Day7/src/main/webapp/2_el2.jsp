<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test" class="com.koreait.el.Eltest"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java Class를 활용한 el문법</title>
</head>
<body>
	<h2>Java Class를 활용한 el문법</h2>
	<p>test.getStr() : ${test.getStr()}</p>
	<p>test.setStr("Hello el!")  ${test.setStr("Hello el!")}</p>
	<p>test.getStr() : ${test.getStr()}</p>
	<p>test.sum(10,5) : ${test.sum(10, 5)}</p> 
</body>
</html>