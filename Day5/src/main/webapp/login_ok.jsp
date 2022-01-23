<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="com.koreait.member.MemberDTO" %> 
<%@page import="com.koreait.member.MemberDAO" %>
<jsp:useBean id="member" class="com.koreait.member.MemberDTO"/>
<jsp:setProperty property="*" name="member"/>
<jsp:useBean id="dao" class="com.koreait.member.MemberDAO"/>
   
    <%
    	
        String userid = request.getParameter("userid");
        String userpw = request.getParameter("userpw");
	
        int ok = dao.login_ok(userid, userpw);
        member = dao.login(member);
           
       	if(ok == (1)){
       		
       		session.setAttribute("name", member.getUsername());
       		session.setAttribute("userid", userid);
       		session.setAttribute("idx", member.getIdx());
%>        
            <script>    
                  alert('로그인 되었습니다.');
                  location.href="login.jsp";
            </script>
<%        	
       	}else{     		
%>
            <script>
                   alert('아이디 혹은 비밀번호를 확인하세요.');
                   history.back();
            </script>
<%
       	}
%>
          


