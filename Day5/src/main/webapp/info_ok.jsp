<%@page import="java.sql.*"%>
<%@ page import="com.koreait.db.Dbconn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.koreait.member.MemberDTO" id="member"/>
<jsp:useBean class="com.koreait.member.MemberDAO" id="dao"/>	
<%
	request.setCharacterEncoding("UTF-8");
	String userid = (String)session.getAttribute("userid");
%>
<jsp:setProperty property="*" name="member"/>
<jsp:setProperty property="userid" name="member" value="<%=userid%>"/>
<jsp:setProperty property="username" param="name" name="member"/>
<%
	if(userid == null){
%>
	<script>
		alert('로그인 후 이용하세요');
		location.href='./login.jsp';
	</script>
<%	
	}else{

		if(dao.edit(member) > 0){
%>
	<script>
		alert('개인정보 수정 완료.');
		location.href='./info.jsp';
	</script>
<%
		}else{
%>
	<script>
		alert('개인정보 수정 실패.');
		history.back();
	</script>
<%
		}
		// 디비 연결
		
		// update문을 사용하여 반영
		
		// info.jsp로 이동
}
%>

	



