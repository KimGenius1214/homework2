<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.koreait.db.Dbconn"%>

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
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	request.setCharacterEncoding("UTF-8");
	
	String userid = (String)session.getAttribute("userid");
	String b_title = request.getParameter("b_title");
	String b_content = request.getParameter("b_content");
	
	try{
		conn = Dbconn.getConnection();
		if(conn != null){
		sql = "insert into tb_board(b_userid, b_title, b_content) values (?, ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userid);
		pstmt.setString(2,b_title);
		pstmt.setString(3,b_content);
		pstmt.executeUpdate();
		}
		
	}catch (Exception e){
		e.printStackTrace();
	}
%>
<script>
	alert('등록되었습니다!');
	location.href = './list.jsp'
</script>
<% 
	}
%>

