<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 하지 않았을 경우 login.jsp로 이동
	if(session.getAttribute("userid")==null){
%>
<script>
	alert('로그인 후 이용하세요');
	location.href='../login.jsp'
</script>
<%
	}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 - 글쓰기</title>
</head>
<body>
	<h2>커뮤니티 - 글쓰기</h2>
	<!-- 
		form action : write_ok.jsp
		작성자 : session.getAttribute("userid")
		제목 : b_title
		내용 : b_content
		세션이 없으면 튕겨내기
		
		wirte_ok.jsp -> list.jsp
		db insert
		세션이 없으면 튕겨내기
	 -->
	 
	 <form action="write_ok.jsp" method="post">
	 	<p>작성자 : <%=(String)session.getAttribute("userid")%></p>
	 	<p>제목 : <input type="text" name="b_title"></p>
	 	<p>내용 : </p>
	 	<p>
	 	<textarea rows="5" cols="40" name="b_content">
	 			</textarea></p>
	 	<p> <input type="submit" value="등록"> <input type="reset" value="다시작성"> <input type="button" value="리스트" onclick="location.href='list.jsp'"></p>
	 </form>
</body>
</html>
<%
}
%>