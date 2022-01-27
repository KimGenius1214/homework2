<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="com.koreait.member.MemberDTO"/>
<jsp:setProperty property="*" name="member"/>
<jsp:setProperty property="username" param="name" name="member"/>
<jsp:useBean class="com.koreait.member.MemberDAO" id="dao"/>
<%
	if(dao.join(member) ==1){
%>
	<script>
		alert('회원가입 완료되었습니다');
		location.href='login.jsp';
	</script>	
<% 
	}else{
%>
	<script>
		alert('회원가입 실패되었습니다');
		history.back();
	</script>	

<%
	}
%>