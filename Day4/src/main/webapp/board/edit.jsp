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
		request.setCharacterEncoding("UTF-8");
	    String b_idx = request.getParameter("b_idx");

	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = "";
	    ResultSet rs = null;
	    
	    String b_userid = "";
	    String b_title = "";
	    String b_content = "";
	    String b_regdate = "";

	    
	    try{
	        conn = Dbconn.getConnection();
	        if(conn != null){
	            sql = "select b_idx, b_userid, b_title, b_content from tb_board where b_idx = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, b_idx);
	            rs = pstmt.executeQuery();
	            
	            if(rs.next()){
	                b_userid = rs.getString("b_userid");
	                b_title = rs.getString("b_title");
	                b_content = rs.getString("b_content");
	            }
	        }
	    }catch(Exception e){
	        e.printStackTrace();
	    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>커뮤니티 - 글수정</title>
</head>
<body>
	<h2>커뮤니티 - 글수정</h2>

	 	 <form action="edit_ok.jsp" method="post">
	 	 <input type="hidden" name="b_idx" value="<%=b_idx%>">
	 	<p>작성자 : <%=(String)session.getAttribute("userid")%></p>
	 	<p>제목 : <input type="text" name="b_title" value="<%=b_title%>"></p>
	 	<p>내용 : </p>
	 	<p><textarea rows="5" cols="40" name="b_content" >
	 			<%=b_content%></textarea></p>
	 	<p> <input type="submit" value="수정완료"> <input type="reset" value="다시작성">  <input type="button" value="리스트" onclick="location.href='list.jsp'"></p>
	 </form>
</body>
</html>

<%
}
%>